package com.karlsruhe.users;

import java.util.List;
import java.util.Map;

public interface UsersService {
	
   void create(Map<String, Object> map); 
	
	List<Map<String, Object>>memberList();
	
	Map<String, Object> memberDetail(String uno);
	
	void memberupdate(Map<String, Object> map);
	
	void memberdelete(String uno);
	

	
	void getUpositionByUsername(String username);

	UsersDTO memberexist(String uemail);

	Map<String, Object> getUserDataByUsername(String username);

	


}
