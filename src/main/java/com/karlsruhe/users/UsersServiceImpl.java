package com.karlsruhe.users;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
<<<<<<< HEAD
import org.springframework.stereotype.Service;

@Service
public  class UsersServiceImpl implements UsersService {
=======
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class UsersServiceImpl implements UsersService {
>>>>>>> origin/sunghee
	
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
		
<<<<<<< HEAD
=======
	
		
>>>>>>> origin/sunghee
		return usersRepository.memberDetail(username);
	}

	@Override
	public void memberUpdate(Map<String, Object> map) {
		usersRepository.memberUpdate(map);
	}

	@Override
<<<<<<< HEAD
	public void memberDelete(String username) {
		usersRepository.memberDelete(username);
=======
	public void memberDelete(String uno) {
		usersRepository.memberDelete(uno);
>>>>>>> origin/sunghee

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

<<<<<<< HEAD
	
	/*
	 * @Override public String pwCheck(String username) throws Exception { return
	 * usersRepository.pwCheck(username); }
	 * 
	 * @Override public void pwUpdate(String username, String hashedPw) throws
	 * Exception { usersRepository.pwUpdate(username, hashedPw); }
	 */

	  public String findIdUser(String uname, String utel) {
		    return this.usersRepository.findIdUser(uname, utel);
		  }

	@Override
	public String findPw(String uname, String utel, String username) {
	    return this.usersRepository.findPw(uname, utel,username);

	}
	
	public void updatePasswordUsers(String password, String username) {
	    this.usersRepository.updatePasswordUsers(password, username);
	  }

	}




=======
}
>>>>>>> origin/sunghee
