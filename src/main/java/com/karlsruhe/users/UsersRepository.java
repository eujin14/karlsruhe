package com.karlsruhe.users;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface UsersRepository {
	
	void create(Map<String, Object> map); 

	List<Map<String, Object>>memberList();
	
	Map<String, Object> memberDetail(String username);
	
	void memberUpdate(Map<String, Object> map);
	
	void memberDelete(String username);
	
	
	void findUpositionByUsername(String username);
	

	UsersDTO memberExist(String uemail);
	
	Map<String, Object> getUserDataByUsername(String username);
	
	/*
	 * String pwCheck(String username)throws Exception;
	 * 
	 * public void pwUpdate(String username, String hashedPw)throws Exception;
	 */
	 String findIdUser(String uname, String utel);

	 String findPw(String uname, String utel,  String username);
	 

}
