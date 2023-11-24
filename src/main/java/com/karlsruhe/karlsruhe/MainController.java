package com.karlsruhe.karlsruhe;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/main")
	public String main(Model model, Principal principal) {
		
		return "main";
		
	}
	
	@GetMapping("/login")
	public String login() {
		
		return "login";
	}
	
	@GetMapping("/login2")
	public String signup(Model model) {
		
		String signup = "signup";
		
		model.addAttribute("signup", signup);
		
		return "login";
	}
	
	@GetMapping("/naverlogin")
	public String naverlogin() {
		
		return "naverlogin";
	}
	
	@GetMapping("/logout")
	public String logout() {
		
		return "logout";
	}
	

}
