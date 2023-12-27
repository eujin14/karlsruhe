package com.karlsruhe.admin;


import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
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

import com.karlsruhe.photo.PhotoService;
import com.karlsruhe.users.UsersService;


@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private UsersService usersService;

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
	public String create(@RequestParam Map<String, Object> map, @RequestParam("image") MultipartFile file) {

		String filecheck = file.getOriginalFilename();

		if (filecheck != null && !filecheck.trim().isEmpty()) {
			String FTP_ADDRESS = "iup.cdn1.cafe24.com";
			String LOGIN = "ekgkarlsruhe";
			String PSW = "gkdlel9254";
			String REMOTE_DIRECTORY = "main";

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
			map.put("image", filename);
		}
		adminService.create(map);
		return "redirect:/admin/readList";
	}
	

	@GetMapping("/readList")
	public String readList(Model model) {

		model.addAttribute("admin", adminService.readList());

		return "admin/readList";
	}
	
	
	@GetMapping("/readDetail")
	public String readDetail(@RequestParam String img, Model model) {

		model.addAttribute("admin", adminService.readDetail(img));
	
		return "admin/readDetail";
	}


	@GetMapping("/update")
	public String update(Model model) {
		
		model.addAttribute("img1", adminService.readDetail("img1"));
		model.addAttribute("img2", adminService.readDetail("img2"));
		model.addAttribute("img3", adminService.readDetail("img3"));

		
		return "admin/update";
	}

	@PostMapping("/update")
	public String update(@RequestParam("img") String img,
						 @RequestParam("image") MultipartFile file
			) {
		
		String filecheck = file.getOriginalFilename();
		
		String nfilename = "";
		Map<String, Object> map = new HashMap<String, Object>();
		if (filecheck != null && !filecheck.trim().isEmpty()) {
		
		String FTP_ADDRESS = "iup.cdn1.cafe24.com";
		String LOGIN = "ekgkarlsruhe";
		String PSW = "gkdlel9254";
		String REMOTE_DIRECTORY = "main";

     	String uuid = UUID.randomUUID().toString();
		String filename = file.getOriginalFilename();
		System.out.println(filename);
			
			
		String tarr = filename.split("\\.")[1];
		System.out.println(tarr);
		nfilename = uuid + "." + tarr;

			FTPClient con = null;

			try {
				con = new FTPClient();
				con.connect(FTP_ADDRESS);

				if (con.login(LOGIN, PSW)) {
					con.enterLocalPassiveMode();
					con.setFileType(FTP.BINARY_FILE_TYPE);

					con.changeWorkingDirectory(REMOTE_DIRECTORY);

					//새 사진 저장
					con.storeFile(nfilename, file.getInputStream());
					con.logout();
					con.disconnect();
					System.out.println("success!!!");
					
				}
		} catch (Exception e) {
			System.out.println("fail!!!");
		}
			
			
			map.put("image", nfilename);
			map.put("img", img);

		}

		adminService.update(map);
  
		return "redirect:/admin/update";
	}
	
	
}
