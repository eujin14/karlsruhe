package com.karlsruhe.user;


import java.util.List;
import java.util.Map;

public interface UserRepository {
	
   void create(Map<String, Object> map); 
	
	List<Map<String, Object>>memberlist();
	
	Map<String, Object> memberdetail(String uno);
	
	void memberupdate(Map<String, Object> map);
	
	void memberdelete(String username);
	

	
	void getUpositionByUsername(String username);

	UserDTO memberexist(String uemail);

	Map<String, Object> getUserDataByUsername(String username);


}
