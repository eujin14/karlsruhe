package com.karlsruhe.users;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.apache.commons.lang.StringUtils;
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
	
    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);

	@Autowired
	  BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private UsersService usersService;

	/*@Autowired
	private MailService mailService;*/


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
		
		return "redirect:/";

	}
	
	@GetMapping("/memberDelete")
	public String delete(@RequestParam ("username") String username) {

		usersService.memberDelete(username);
		
		return "redirect:/";
	}

	@PostMapping("/memberDelete")
	public String deletepost(@RequestParam("username") String username) {
		// POST 요청 처리 로직
		usersService.memberDelete(username);
		return "redirect:/";
	}
	
   //카카오톡 
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
	
     //아이디 찾기
	 @GetMapping({"/findId"})
	  public String FindId() {
	    return "users/findId";
	  }
	 
	 //아이디 찾기
	@ResponseBody
	  @PostMapping(value = {"/findId"}, produces = {"text/html;charset=UTF-8"})
	  public String submitFindId(@RequestParam String name, @RequestParam String tel) {
	    String username = this.usersService.findIdUser(name, tel);
	    if (username == null || username.equals(""))
	      return "<p>아이디가 존재하지 않습니다<br>이름과 전화번호를 확인해 주세요</p>";
	    return "<p>찾으시는 아이디는<span style=\"color:green\">" + username + "</span>입니다</p>";
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
		
		
		@GetMapping({"/updatePw"})
		  public String UpdatePw() {
		    return "users/updatePw";
		  }
		
		@ResponseBody
		@PostMapping("/updatePw")
		public ResponseEntity<String> SubmitUpdatePw(@RequestParam String password, @RequestParam String currentPassword, Principal principal) {
		    try {
		        String username = principal.getName();

		        // Retrieve user details as Map<String, Object>
		        Map<String, Object> user = this.usersService.memberDetail(username);

		        if (user != null) {
		            String realPassword = (String) user.get("password");

		            // Verify the current password
		            boolean matches = this.bcryptPasswordEncoder.matches(currentPassword, realPassword);

		            if (matches) {
		                // Update the password if the current password is correct
		                String encodedPassword = this.bcryptPasswordEncoder.encode(password);
		                this.usersService.updatePasswordUsers(encodedPassword, username);
		                return ResponseEntity.ok("Password updated successfully");
		            }
		        }

		        // Return an error response if there's an issue with the password update
		        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Incorrect current password");
		    } catch (Exception e) {
		        // Handle any other exceptions that may occur during the process
		        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
		    }
		}
		
		
	}
	

