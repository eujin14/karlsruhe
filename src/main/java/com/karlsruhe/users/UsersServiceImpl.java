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
	public List<Map<String, Object>> memberlist() {
		return usersRepository.memberlist();
	}

	@Override
	public Map<String, Object> memberdetail(String username) {
		return usersRepository.memberdetail(username);
	}

	@Override
	public void memberupdate(Map<String, Object> map) {
		usersRepository.memberupdate(map);
	}

	@Override
	public void memberdelete(String username) {
		usersRepository.memberdelete(username);

	}

	@Override
	public void getUpositionByUsername(String username) {
		 usersRepository.findUpositionByUsername(username);

	}

	@Override
	public UsersDTO memberexist(String uemail) {
		return usersRepository.memberexist(uemail);
	}

	@Override
	public Map<String, Object> getUserDataByUsername(String username) {
		  return usersRepository.getUserDataByUsername(username);
	}

}
