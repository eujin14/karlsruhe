
package com.karlsruhe.karlsruhe;


import java.security.Principal;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;



import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
	
	
	@GetMapping("/")
	public String home() {
		
		
		return "main";
	}
	
	

}

