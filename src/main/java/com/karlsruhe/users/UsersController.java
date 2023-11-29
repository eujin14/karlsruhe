package com.karlsruhe.users;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@RequestMapping("/users")
@Controller
public class UsersController {


	@Autowired
	private UsersService usersService;
	private Object bcryptPasswordEncoder;

	/*@Autowired
	private MailService mailService;*/

	@GetMapping("/create")
	public String join() {
		return "/users/create";
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
		 * map.get("uname"); String body = uname + "님의 방문이 저희에게는 큰 위로와 감사가 되었습니다.";
		 * String subject = uname + "님 방문해주셔서 대단히 감사드립니다.";
		 * 
		 * mailService.sendMail(to, subject, body);
		 */

		return "redirect:/main";
	}

	@GetMapping("/memberList")
	public String memberList(Model model) {

		model.addAttribute("members", usersService.memberList());

		return "users/memberList";
	}

	

	@GetMapping("/memberDetail")
	public String memberdetail(String username, Model model) {
	    model.addAttribute("member", usersService.memberDetail(username));
	    return "users/memberDetail";  
	}

	

	@GetMapping("/memberUpdate")
	public String update(@RequestParam ("username") String username, Model model) {

		model.addAttribute("member", usersService.memberDetail(username));

		return "users/memberUpdate";
	}

	@PostMapping("/memberUpdate")
	public String updatepost(@RequestParam Map<String, Object> map) {
		
		usersService.memberUpdate(map);
		
		return "redirect:/users/memberDetail";

	}

	@GetMapping("/memberDelete")
	public String delete(@RequestParam ("username") String username) {

		usersService.memberDelete(username);
		
		return "redirect:/main";
	}


	

	@PostMapping("/kakaocheck")
	public String ajaxkakao(HttpServletRequest req, @RequestParam("uemail") String uemail) {
		System.out.println("컨트롤러로 넘어온 데이터 값 : " + uemail);

		UsersDTO user = this.usersService.memberExist(uemail);

		if (user != null) {
			System.out.println("디비에 회원정보 있음 즉 이미 회원임");
			// 디비에 있는 사용자이므로 로그인 세션처리
			// 독자적인 처리가 아니라 스프링 시큐리티 규격에 맞게 세션처리
			List<GrantedAuthority> list = new ArrayList<GrantedAuthority>();
			list.add(new SimpleGrantedAuthority("ROLE_USER"));

			SecurityContext sc = SecurityContextHolder.getContext();

			sc.setAuthentication(new UsernamePasswordAuthenticationToken(user, null, list));
			// user 회원정보 객체, null 패스워드 , list 권한 설정

			HttpSession session = req.getSession(true);

			session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, sc);

			return "/login";
		} else {
			System.out.println("디비에 회원정보 없음 즉 회원이 아님");
			return "";
		}

	}
	

		 @GetMapping({"/findId"})
		  public String FindId() {
		    return "users/findId";
		  }
		
		@ResponseBody
		  @PostMapping(value = {"/findId"}, produces = {"text/html;charset=UTF-8"})
		  public String submitFindId(@RequestParam String name, @RequestParam String tel) {
		    String username = this.usersService.findIdUser(name, tel);
		    if (username == null || username.equals(""))
		      return "<p>아이디가 존재하지 않습니다<br>이름과 전화번호를 확인해 주세요</p>";
		    return "<p>찾으시는 아이디는<span style=\"color:green\">" + username + "</span>입니다</p>";
		  }
		
		@GetMapping({"/findPw"})
		  public String FindPw(Model model) {
		    return "users/findPw";
		  }
		  
		  @ResponseBody
		  @PostMapping({"/findPw"})
		  public String submitFindPw(@RequestParam String name, @RequestParam String tel, @RequestParam String username) {
		    return this.usersService.findPw(name, tel, username);
		  }
		  
		  @GetMapping({"/updatePw"})
		  public String UpdatePw() {
		    return "users/updatePw";
		  }
		  
		  @ResponseBody
		  @PostMapping("/updatePw")
		  public boolean submitUpdatePw(@RequestParam String password, @RequestParam String Chkpassword, Principal principal) {
		      String username = principal.getName();
		      Map<String, Object> user = this.usersService.memberDetail(username);
		      String realPassword = ((UsersDTO) user).getPassword();
		      boolean matches = ((BCryptPasswordEncoder) this.bcryptPasswordEncoder).matches(Chkpassword, realPassword);
		      if (matches) {
		          String encodedPassword = ((BCryptPasswordEncoder) this.bcryptPasswordEncoder).encode(password);
		          this.usersService.updatePasswordUsers(encodedPassword, username);
		          return true;
		      } 
		      return false;
		  }
}


