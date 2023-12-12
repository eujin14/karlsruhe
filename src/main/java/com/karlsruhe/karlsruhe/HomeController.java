
package com.karlsruhe.karlsruhe;



import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
	
	
	@GetMapping("/")
	public String home() {
		
		
		return "main";
	}
	
	@GetMapping("/login")
	public String login() {
		
		return "login";
	}
	
	
	@GetMapping("/naverlogin")
	public String naverlogin() {
		
		return "naverlogin";
	}
	
	@GetMapping("/time")
	public String time() {
		
		return "time";
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
	
	@GetMapping("/loginfailed")
	public String loginfailed() {
		
		return "loginfailed";
	}
	
	@GetMapping("/Withdrawal")
	public String Withdrawal() {
		return "Withdrawal";
	}
}

