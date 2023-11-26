package com.karlsruhe.users;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersServiceImpl implements UsersService {
	
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

	
	 @Override public String pwCheck(String username) throws Exception { return
	  usersRepository.pwCheck(username); }
	  
	  @Override public void pwUpdate(String username, String hashedPw) throws
	   Exception { usersRepository.pwUpdate(username, hashedPw);
	  
	 
	  }
}
