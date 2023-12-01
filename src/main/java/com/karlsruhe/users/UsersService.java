package com.karlsruhe.users;

import java.util.List;
import java.util.Map;

public interface UsersService {
	
   void create(Map<String, Object> map); 
	
	List<Map<String, Object>>memberList();
	
	Map<String, Object> memberDetail(String username);
	
	void memberUpdate(Map<String, Object> map);
	
	void memberDelete(String username);
	

	
	void getUpositionByUsername(String username);

	UsersDTO memberExist(String uemail);

	Map<String, Object> getUserDataByUsername(String username);

	
	int findPwCheck(UsersDTO usersDTO)throws Exception; 
	 
	void  findPw(String uemail,String username)throws Exception;
	 
	 String findIdUser(String paramString1, String paramString2);


	  void updatePasswordUsers(String password, String username);
	 
}
