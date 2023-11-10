package com.karlsruhe.photo;

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
import org.springframework.web.multipart.MultipartFile;

@RequestMapping("/photo")
@Controller
public class PhotoController {
		
		@Autowired
		private PhotoService photoService;
					
		@GetMapping("/create")
		public String create() {
			return "photo/create";
		}

		@PostMapping("/create")
		public String create(@RequestParam Map<String, Object> map, @RequestParam("pcontent") MultipartFile file) {

			String filecheck = file.getOriginalFilename();

			if (filecheck != null && !filecheck.trim().isEmpty()) {
				String FTP_ADDRESS = "iup.cdn1.cafe24.com";
				String LOGIN = "tjdgml789";
				String PSW = "qwaserdf123";
				String REMOTE_DIRECTORY = "photo";

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
				map.put("pcontent", filename);

			}

			photoService.create(map);
			return "redirect:/photo/readList";
		}
		
		@PostMapping("/createreply")
		public String createreply(@RequestParam Map<String, Object> map) {

			photoService.create(map);
			return "redirect:/photo/readList";
		}
		@GetMapping("/readList")
		public String readList(Model model) {

			model.addAttribute("photos", photoService.readList());

			return "photo/readList";
		}
		@GetMapping("/readDetail")
		public String readDetail(@RequestParam String pno, Model model) {

			model.addAttribute("photo", photoService.readDetail(pno));

			// 디테일에서 댓글의 목록을 볼 수 있게 함
			//model.addAttribute("replylist", photoService.readreply(pno));

			return "photo/readDetail";
		}

		@GetMapping("/update")
		public String update(@RequestParam("pno") String pno, Model model) {

			model.addAttribute("photo", photoService.readDetail(pno));

			return "photo/update";
		}

		// U 저장시에 사진값이 mdn에 담길 수 있는 방법 + 사진이 안 담겼을 경우 mdn에 저장 되지 않게함
		@PostMapping("/update")
		public String updatepost(@RequestParam Map<String, Object> map, @RequestParam("pcontent") MultipartFile file) {
			String filecheck = file.getOriginalFilename();

			if (filecheck != null && !filecheck.trim().isEmpty()) {
				String FTP_ADDRESS = "iup.cdn1.cafe24.com";
				String LOGIN = "tjdgml789";
				String PSW = "qwaserdf123";

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

						con.changeWorkingDirectory("photo");

						con.storeFile(filename, file.getInputStream());
						con.logout();
						con.disconnect();
						System.out.println("success!!!");
					}
				} catch (Exception e) {
					System.out.println("fail!!!");
				}
				map.put("pcontent", filename);

			}

			photoService.update(map);

			return "redirect:/photo/readList";
		}

		@GetMapping("/delete")
		public String delete(@RequestParam("pno") String pno) {

			photoService.delete(pno);

			return "redirect:/photo/readList";
		}

		// 좋아요 클릭시에 숫자 증가하고 나타나게 함
		@PostMapping("/count")
		public String count(@RequestParam Map<String, Object> map, Model model) {

			photoService.count(map);

			return "redirect:/photo/readList";
		}

	}