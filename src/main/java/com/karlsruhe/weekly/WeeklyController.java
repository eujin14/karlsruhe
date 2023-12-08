package com.karlsruhe.weekly;

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


@RequestMapping("/weekly")
@Controller
public class WeeklyController {
	
	@Autowired
	private WeeklyService weeklyService;
	
	@GetMapping("/temp")
	public String main() {
		return "weekly/temp";
		
	}
	@GetMapping("/create")
	public String create() {
		return "weekly/create";
	}

	@PostMapping("/create")
	public String create(@RequestParam Map<String, Object> map, @RequestParam("gimage") MultipartFile file) {

	String filecheck = file.getOriginalFilename();

			if (filecheck != null && !filecheck.trim().isEmpty()) {
				String FTP_ADDRESS = "iup.cdn1.cafe24.com";
				String LOGIN = "sasa724";
				String PSW = "skehahffk8*";
				String REMOTE_DIRECTORY = "weekly";

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
				map.put("gimage", filename);

			}
	
			weeklyService.create(map);
			return "redirect:/weekly/readList";
		}
		
		@GetMapping("/readList")
		public String readList(Model model) {
			model.addAttribute("lists", weeklyService.readList());
			return "weekly/readList";
		}
		
		@GetMapping("/readDetail")
		public String readDetail(@RequestParam("gid") String gid, Model model) {
			model.addAttribute("details", weeklyService.readDetail(gid));
			
			return "weekly/readDetail";
		}
		
		@GetMapping("/update")
		public String updateform(@RequestParam("nid") String gid, Model model) {

			model.addAttribute("details", weeklyService.readDetail(gid));

			return "notice/update";
		}
		
		
		@PostMapping("/update")
		public String update(@RequestParam Map<String, Object> map, @RequestParam("gimage") MultipartFile file) {

			String filecheck = file.getOriginalFilename();
			if (filecheck != null && !filecheck.trim().isEmpty()) {
				String FTP_ADDRESS = "iup.cdn1.cafe24.com";
				String LOGIN = "sasa724";
				String PSW = "skehahffk8*";
				String REMOTE_DIRECTORY = "weekly";

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
				map.put("gimage", filename);

			}

			weeklyService.update(map);

			return "redirect:/weekly/readList";
		}
		
		
		
		@GetMapping("/delete")
		public String delete(@RequestParam("gid") String gid) {
			weeklyService.delete(gid);
			return "redirect:/weekly/readList";
		}

}
