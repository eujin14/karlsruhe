package com.karlsruhe.guide;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/guide")
@Controller
public class GuideController {
	
	@GetMapping("/main")
	public String main() {
		return "guide/main";
		
	}

}
