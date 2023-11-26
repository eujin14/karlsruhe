package com.karlsruhe.karlsruhe;

import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.karlsruhe.users.UsersDTO;
import com.karlsruhe.users.UsersService;

@Controller
public class MainController {
	
	 @Autowired
	  UsersService usersService;
	 

	  @Autowired
	  BCryptPasswordEncoder bcryptPasswordEncoder;
	
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
	
	 @GetMapping({"/findId"})
	  public String FindId() {
	    return "findId";
	  }
	  
	 
	  
	  
	}


