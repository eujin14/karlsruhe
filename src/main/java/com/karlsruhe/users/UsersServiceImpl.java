package com.karlsruhe.users;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.karlsruhe.karlsruhe.MailService;
import com.karlsruhe.karlsruhe.TempKey;

@Service
public  class UsersServiceImpl implements UsersService {
	 @Autowired
	    private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	 @Autowired
	 private MailService mailService;
	 
	@Autowired
	private UsersRepository usersRepository;

	@Override
	public void create(Map<String, Object> map) {
		usersRepository.create(map);
	}

	@Override
	public List<Map<String, Object>> memberList() {
		return usersRepository.memberList();
	}

	@Override
	public Map<String, Object> memberDetail(String username) {
		
		return usersRepository.memberDetail(username);
	}

	@Override
	public void memberUpdate(Map<String, Object> map) {
		usersRepository.memberUpdate(map);
	}

	@Override
	public void memberDelete(String username) {
		usersRepository.memberDelete(username);

	}

	@Override
	public void getUpositionByUsername(String username) {
		 usersRepository.findUpositionByUsername(username);

	}

	@Override
	public UsersDTO memberExist(String uemail) {
		return usersRepository.memberExist(uemail);
	}

	@Override
	public Map<String, Object> getUserDataByUsername(String username) {
		  return usersRepository.getUserDataByUsername(username);
	}

	

	  @Override
	  public String findIdUser(String uname, String utel) {
		    return this.usersRepository.findIdUser(uname, utel);
		  }

	@Override
	public int findPwCheck(UsersDTO usersDTO) throws Exception {
		return usersRepository.findPwCheck(usersDTO);
	}

	@Override
	public void findPw(String uemail, String username) throws Exception {
	    // Check if the username and email exist in the database
	    UsersDTO user = usersRepository.memberExist(uemail);

	    if (user != null && user.getUsername().equals(username)) {
	        // Generate and send the temporary password
	        String memberKey = new TempKey().getKey(6, false);
	        String memberPw = bcryptPasswordEncoder.encode(memberKey);

	        // Update the password in the database
	        usersRepository.findPw(memberPw, uemail, username);

	        // Send the temporary password via email
	        String subject = "[임시 비밀번호 발급]";
	        String body = "<h1>임시비밀번호 발급</h1>" +
	                "<br/>" + username + "님  " +
	                "<br/>비밀번호 찾기를 통한 임시 비밀번호입니다." +
	                "<br/>임시비밀번호: <h2>" + memberKey + "</h2>" +
	                "<br/>로그인 후 비밀번호 변경을 해주세요." +
	                "<a href='http://localhost:8080/login'>Login page</a>";

	        mailService.sendMail(uemail, subject, body);
	    } else {
	        throw new Exception("Invalid username or email.");
	    }
	}
	
	@Override
	public void updatePasswordUsers(String password, String username) {
		// TODO Auto-generated method stub
		
	}
	
}


