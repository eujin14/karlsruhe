package com.karlsruhe.admin;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.karlsruhe.board.BoardService;
import com.karlsruhe.notice.NoticeService;
import com.karlsruhe.users.UsersService;
import com.karlsruhe.weekly.WeeklyService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private UsersService usersService;

	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private WeeklyService WeeklyService;
	
	@Autowired
	private AdminService adminService;
	
	
	@GetMapping("/admin")
	public String admin() {
		
		
		
		return "admin/admin";
	}
	
	
	@GetMapping("/memberlist")
	public String memberlist(Model model) {
		
		model.addAttribute("members", usersService.memberList());
		model.addAttribute("users", sqlSessionTemplate.selectList("admin.userlist"));
		
		
		return "admin/memberlist";
	}
	

	
	@GetMapping("/create")
	public String create() {
		return "admin/create";
	}

	@PostMapping("/create")
	public String create(@RequestParam Map<String, Object> map, @RequestParam("image1") MultipartFile file) {

		String filecheck = file.getOriginalFilename();

		if (filecheck != null && !filecheck.trim().isEmpty()) {
			String FTP_ADDRESS = "iup.cdn1.cafe24.com";
			String LOGIN = "ekgkarlsruhe";
			String PSW = "gkdlel9254";
			String REMOTE_DIRECTORY = "main1";

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
			map.put("image1", filename);
		}
		adminService.create(map);
		return "redirect:/admin/readList";
	}
	
	
	@GetMapping("/create2")
	public String create2() {
		return "admin/create2";
	}

	@PostMapping("/create2")
	public String create2(@RequestParam Map<String, Object> map, @RequestParam("image2") MultipartFile file) {

		String filecheck = file.getOriginalFilename();

		if (filecheck != null && !filecheck.trim().isEmpty()) {
			String FTP_ADDRESS = "iup.cdn1.cafe24.com";
			String LOGIN = "ekgkarlsruhe";
			String PSW = "gkdlel9254";
			String REMOTE_DIRECTORY = "main2";

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
			map.put("image2", filename);
		}
		adminService.create2(map);
		return "redirect:/";
	}
	
	
	
	@GetMapping("/create3")
	public String create3() {
		return "admin/create3";
	}

	@PostMapping("/create3")
	public String create3(@RequestParam Map<String, Object> map, @RequestParam("image3") MultipartFile file) {

		String filecheck = file.getOriginalFilename();

		if (filecheck != null && !filecheck.trim().isEmpty()) {
			String FTP_ADDRESS = "iup.cdn1.cafe24.com";
			String LOGIN = "ekgkarlsruhe";
			String PSW = "gkdlel9254";
			String REMOTE_DIRECTORY = "main3";

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
			map.put("image3", filename);
		}
		adminService.create3(map);
		return "redirect:/";
	}
	
	@GetMapping("/update")
	public String update(@RequestParam("id") String id, Model model) {

		model.addAttribute("admin", adminService.readDetail(id));

		return "admin/update";
	}

	// U 저장시에 사진값이 mdn에 담길 수 있는 방법 + 사진이 안 담겼을 경우 mdn에 저장 되지 않게함
	@PostMapping("/update")
	public String updatepost(@RequestParam Map<String, Object> map, @RequestParam("image1") MultipartFile file) {
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

					con.changeWorkingDirectory("main1");

					con.storeFile(filename, file.getInputStream());
					con.logout();
					con.disconnect();
					System.out.println("success!!!");
				}
			} catch (Exception e) {
				System.out.println("fail!!!");
			}
			map.put("image1", filename);

		}

		adminService.update(map);

		return "redirect:/";
	}
	@GetMapping("/readList")
	public String readList(Model model) {

		model.addAttribute("admin", adminService.readList());

		return "admin/readList";
	}
	@GetMapping("/readDetail")
	public String readDetail(@RequestParam String id, Model model) {

		model.addAttribute("admin", adminService.readDetail(id));
		
		return "main";
	}

}
