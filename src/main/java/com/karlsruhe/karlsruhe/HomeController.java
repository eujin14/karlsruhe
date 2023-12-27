
package com.karlsruhe.karlsruhe;



import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.karlsruhe.admin.AdminService;
import com.karlsruhe.users.UsersService;


@Controller
public class HomeController {
	
	@Autowired
	private UsersService usersService;

	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/")
	public String home(Model model) {
		
		model.addAttribute("img1", adminService.readDetail("img1"));
		model.addAttribute("img2", adminService.readDetail("img2"));
		model.addAttribute("img3", adminService.readDetail("img3"));
		
		return "main";
	}
	
	

	@GetMapping("/create")
	public String join() {
		return "create";
	}

	@PostMapping("/create")
	public String join(@RequestParam Map<String, Object> map) {
		
		BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();
		

		String pass = (String) map.get("password");

		String encodedPassword = bcryptPasswordEncoder.encode(pass);

		map.put("password", encodedPassword);

		

		usersService.create(map);

		/*
		 * String to = (String) map.get("uemail"); String uname = (String)
		 * map.get("uname"); String body = uname + "님의 방문이 저희에게는 큰 감사가 되었습니다.";
		 * String subject = uname + "님 방문해주셔서 대단히 감사드립니다.";
		 * 
		 * mailService.sendMail(to, subject, body);
		 */

		return "redirect:/login";
	}
	
	
	@GetMapping("/login")
	public String login() {
		
		return "login";
	}
	
	@GetMapping("/loginfailed")
	public String loginfailed() {
		
		return "loginfailed";
	}
	
	

	
	@GetMapping("/greetings")
	public String greetings() {
		
		return "greetings";
	}
	
	@GetMapping("/history")
	public String history() {
		
		return "history";
	}
	
	@GetMapping("/location")
	public String location() {
		
		return "location";
	}
	
}

