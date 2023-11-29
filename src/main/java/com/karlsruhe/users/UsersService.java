package com.karlsruhe.users;

import java.util.List;
import java.util.Map;

public interface UsersService {
	
   void create(Map<String, Object> map); 
	
	List<Map<String, Object>>memberList();
	
	Map<String, Object> memberDetail(String username);
	
	void memberUpdate(Map<String, Object> map);
	
<<<<<<< HEAD
	void memberDelete(String username);
=======
	void memberDelete(String uno);
>>>>>>> origin/sunghee
	

	
	void getUpositionByUsername(String username);

	UsersDTO memberExist(String uemail);

	Map<String, Object> getUserDataByUsername(String username);

	
<<<<<<< HEAD
	/*
	 * String pwCheck(String username)throws Exception;
	 * 
	 * void pwUpdate(String username, String hashedPw)throws Exception;
	 */
	 
	 String findIdUser(String paramString1, String paramString2);
	 
	 String findPw(String paramString1, String paramString2, String paramString3);
	   

	 void updatePasswordUsers(String paramString1, String paramString2);
=======


>>>>>>> origin/sunghee
}
