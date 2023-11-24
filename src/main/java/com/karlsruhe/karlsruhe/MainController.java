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
	  
	  @ResponseBody
	  @PostMapping(value = {"/findId"}, produces = {"text/html;charset=UTF-8"})
	  public String submitFindId(@RequestParam String name, @RequestParam String tel) {
	    String username = this.usersService.findIdUser(name, tel);
	    if (username == null || username.equals(""))
	    	 return "<p>아이디가 존재하지 않습니다<br>이름과 전화번호를 확인해주세요</p>"; 
	    	return "<p>찾으시는 아이디<span style=\"color:green\">"+username +"</span>입니다.</p>";
	  }
	  
	  @GetMapping({"/findPw"})
	  public String FindPw(Model model) {
	    return "findPw";
	  }
	  
	  @ResponseBody
	  @PostMapping({"/findPw"})
	  public String submitFindPw(@RequestParam String name, @RequestParam String tel, @RequestParam String username) {
	    return this.usersService.findPw(name, tel, username);
	  }
	  
	  @ResponseBody
	  @RequestMapping({"/IdChk"})
	  public Boolean IdChk(@RequestParam String username) {
		  UsersDTO member = this.usersService.memberDetail(username);
	    if (member == null)
	      return Boolean.valueOf(true); 
	    return Boolean.valueOf(false);
	  }
	  
	  @ResponseBody
	  @RequestMapping({"/TelChk"})
	  public Boolean TelChk(@RequestParam String tel, @RequestParam(value = "username", required = false) String username) {
	    if (username != null) {
	    	UsersDTO member = this.usersService.memberDetail(username);
	      String oldTel = member.getUtel();
	      if (oldTel.equals(tel))
	        return Boolean.valueOf(true); 
	    } 
	    UsersDTO member =  this.usersService.telChk(tel);
	    return (member == null) ? Boolean.valueOf(true) : Boolean.valueOf(false);
	  }
	
	  
	
	  @GetMapping({"/updatePw"})
	  public String UpdatePw() {
	    return "/updatePw";
	  }
	  
	 
	  @ResponseBody
	  @PostMapping({"/updatePw"})
	  public boolean SubmitUpdatePw(@RequestParam String password, @RequestParam String currentPassword, Principal principal) {
	    String username = principal.getName();
	    
	    UsersDTO member = this.usersService.memberDetail(username);
	    String realPassword = member.getPassword();
	    boolean matches = this.bcryptPasswordEncoder.matches(currentPassword, realPassword);
	    if (matches) {
	      String encodedPassword = this.bcryptPasswordEncoder.encode(password);
	      this.usersService.updatePasswordUsers(encodedPassword, username);
	      return true;
	    } 
	    return false;
	  }
	  
	  
	  
	}


