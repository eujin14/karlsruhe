package com.karlsruhe.notice;

import java.util.Map;
import java.util.UUID;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
		
	@GetMapping("/create")
	public String create() {
		return "notice/create";
	}

	@PostMapping("/create")
	public String create(@RequestParam Map<String, Object> map) {

/*		
 * , @RequestParam("nimage") MultipartFile file
 * 
 * String filecheck = file.getOriginalFilename();

		if (filecheck != null && !filecheck.trim().isEmpty()) {
			String FTP_ADDRESS = "iup.cdn1.cafe24.com";
			String LOGIN = "";
			String PSW = "";
			String REMOTE_DIRECTORY = "notice";

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
			map.put("nimage", filename);

		}
*/
		noticeService.create(map);

		return "redirect:/notice/readList";
	}

}
