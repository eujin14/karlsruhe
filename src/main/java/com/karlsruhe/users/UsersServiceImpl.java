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
	public UsersDTO memberDetail(String username) {
		
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
	public UsersDTO memberExist(String uemail) {
		return usersRepository.memberExist(uemail);
	}


	@Override
	public String findIdUser(String name, String tel) {
		 return this.usersRepository.findIdUser(name, tel);
	}

	@Override
	public String findPw(String name, String tel, String username) {
	    return this.usersRepository.findPw(name, tel, username);
	  }

	@Override
	 public int totalCount() {
	    return this.usersRepository.totalCount();
	  }
	@Override
	public int countUsers() {
	    return this.usersRepository.countUsers();
	  }

	@Override
	public UsersDTO telChk(String utel) {
		return this.usersRepository.telChk(utel);
	}

	@Override
	public String pwCheck(String memberId)throws Exception{
		return usersRepository.pwCheck(memberId);
	}
	
	@Override
	public void pwUpdate(String memberId, String hashedPw)throws Exception{
		usersRepository.pwUpdate(memberId, hashedPw);
	}


	
	

	

	}

