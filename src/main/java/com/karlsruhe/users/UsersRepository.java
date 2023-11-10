package com.karlsruhe.users;


import java.util.List;
import java.util.Map;

public interface UsersRepository {
	
	void create(Map<String, Object> map); 

	List<Map<String, Object>>memberList();
	
	Map<String, Object> memberDetail(String uno);
	
	void memberUpdate(Map<String, Object> map);
	
	void memberDelete(String uno);
	
	
	void findUpositionByUsername(String username);
	

	UsersDTO memberExist(String uemail);
	
	Map<String, Object> getUserDataByUsername(String username);


}
