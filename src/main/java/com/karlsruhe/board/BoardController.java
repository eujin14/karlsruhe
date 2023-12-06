package com.karlsruhe.board;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/board")
@Controller
public class BoardController {
		
		@Autowired
		private BoardService boardService;
		
			
		@GetMapping("/create")
		public String create() {
			return "board/create";
		}

		@PostMapping("/create")
		public String create(@RequestParam Map<String, Object> map, @RequestParam("bimage") MultipartFile file) {

			String filecheck = file.getOriginalFilename();

			if (filecheck != null && !filecheck.trim().isEmpty()) {
				String FTP_ADDRESS = "iup.cdn1.cafe24.com";
				String LOGIN = "ekgkarlsruhe";
				String PSW = "gkdlel9254";
				String REMOTE_DIRECTORY = "board";

				String uuid = UUID.randomUUID().toString();
				String filename = file.getOriginalFilename();
				filename = uuid + "_" + filename;

				FTPClient con = null;

				try {
					con = new FTPClient();
					con.connect(FTP_ADDRESS);

					if (con.login(LOGIN, PSW)) {
						con.enterLocalPassiveMode();
						con.setFileType(FTP.BINARY_FILE_TYPE);

						con.changeWorkingDirectory(REMOTE_DIRECTORY);

						con.storeFile(filename, file.getInputStream());
						con.logout();
						con.disconnect();
						System.out.println("success!!!");
					}
				} catch (Exception e) {
					System.out.println("fail!!!");
				}
				map.put("bimage", filename);

			}

			boardService.create(map);
			return "redirect:/board/readList";
		}
		
		@PostMapping("/createReply")
		public String createReply(@RequestParam Map<String, Object> map) {

			boardService.create(map);
			return "redirect:/board/readList";
		}
		@GetMapping("/readList")
		public String readList(Model model) {

			model.addAttribute("boards", boardService.readList());

			return "board/readList";
		}
		@GetMapping("/readDetail")
		public String readDetail(@RequestParam String bno, Model model) {

			model.addAttribute("board", boardService.readDetail(bno));

			// 디테일에서 댓글의 목록을 볼 수 있게 함
			model.addAttribute("replyList", boardService.readReply(bno));

			return "board/readDetail";
		}

		@GetMapping("/update")
		public String update(@RequestParam("bno") String bno, Model model) {

			model.addAttribute("board", boardService.readDetail(bno));

			return "board/update";
		}

		// U 저장시에 사진값이 mdn에 담길 수 있는 방법 + 사진이 안 담겼을 경우 mdn에 저장 되지 않게함
		@PostMapping("/update")
		public String updatepost(@RequestParam Map<String, Object> map, @RequestParam("bimage") MultipartFile file) {
			String filecheck = file.getOriginalFilename();

			if (filecheck != null && !filecheck.trim().isEmpty()) {
				String FTP_ADDRESS = "iup.cdn1.cafe24.com";
				String LOGIN = "ekgkarlsruhe";
				String PSW = "gkdlel9254";

				String uuid = UUID.randomUUID().toString();
				String filename = file.getOriginalFilename();
				filename = uuid + "_" + filename;

				FTPClient con = null;

				try {
					con = new FTPClient();
					con.connect(FTP_ADDRESS);

					if (con.login(LOGIN, PSW)) {
						con.enterLocalPassiveMode();
						con.setFileType(FTP.BINARY_FILE_TYPE);

						con.changeWorkingDirectory("board");

						con.storeFile(filename, file.getInputStream());
						con.logout();
						con.disconnect();
						System.out.println("success!!!");
					}
				} catch (Exception e) {
					System.out.println("fail!!!");
				}
				map.put("bimage", filename);

			}

			boardService.update(map);

			return "redirect:/board/readList";
		}

		@GetMapping("/delete")
		public String delete(@RequestParam("bno") String bno) {

			boardService.delete(bno);

			return "redirect:/board/readList";
		}

		// 댓글이 작성될 수 있게 하며 댓글의 내용이 담길 수 있게 함
		
		  @ResponseBody
		  @PostMapping("/readReply") 
		  public List<Map<String, Object>>readReply(@RequestParam("breply") String breply) {
		  
		  return boardService.readReply(breply);
		  
		  }
		
		@GetMapping("/deleteReply")
		public String deleteReply(@RequestParam("bno") String bno, @RequestParam("boardbno") String boardbno, Model model) {

			boardService.delete(bno);

			model.addAttribute("board", boardService.readDetail(boardbno));
			model.addAttribute("replyList", boardService.readReply(bno));

			return "redirect:/board/readDetail?bno=" + boardbno;
		}

	}

