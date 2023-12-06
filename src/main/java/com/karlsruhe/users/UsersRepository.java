package com.karlsruhe.users;


import java.util.HashMap;
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
	
	
	 String findIdUser(String uname, String utel);
	 
	 
	 int findPwCheck(UsersDTO usersDTO)throws Exception; 
	 
	 int findPw(@Param("password") String password, @Param("uemail") String uemail, @Param("username") String username) throws Exception;

	 int updatePasswordUsers(@Param("password") String password, @Param("username") String username);

  }
