package com.karlsruhe.users;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public  class UsersServiceImpl implements UsersService {
	 @Autowired
	    private BCryptPasswordEncoder bcryptPasswordEncoder;
	
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

	


	  public String findIdUser(String uname, String utel) {
		    return this.usersRepository.findIdUser(uname, utel);
		  }

	@Override
	public String findPw(String uname, String utel, String username) {
	    return this.usersRepository.findPw(uname, utel,username);

	}
	@Override
	public void updatePasswordUsers(String password, String username) {
		this.usersRepository.updatePasswordUsers(password, username);	
		}

}


