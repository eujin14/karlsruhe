
package com.karlsruhe.karlsruhe;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.karlsruhe.users.UsersDTO;
import com.karlsruhe.users.UsersService;


@Controller
public class HomeController {
	
	@Autowired
	private UsersService usersService;
	
	@GetMapping("/")
	public String home() {
		
		
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
	
	//임시비밀번호
	@RequestMapping(value="/findPwView" , method=RequestMethod.GET)
	public String findPwView() throws Exception{
		return"/users/findPwView";
	}
		
	//임시비밀번호 발송
	@ResponseBody
	@RequestMapping(value = "/findPw", method = RequestMethod.POST, produces = {"text/html;charset=UTF-8"})
	public ResponseEntity<String> findPw(@RequestParam("username") String username,
	                                      @RequestParam("uemail") String uemail) {
	    try {
	        // Check if the username and email exist in the database
	        UsersDTO user = usersService.memberExist(uemail);

	        if (user != null && user.getUsername().equals(username)) {
	            // Generate and send the temporary password
	            usersService.findPw(uemail, username);
	            return ResponseEntity.ok("임시메일이 전송되었습니다.");
	        } else {
	            // Return an error response to the client if username or email is invalid
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("아이디와 이메일을 확인해주세요");
	        }
	    } catch (Exception e) {
	        // Handle any other exceptions that may occur during the process
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
	    }
	}
	
	
}

