package com.karlsruhe.users;

import java.util.List;
import java.util.Map;

public interface UsersService {
	
void create(Map<String, Object> map); 
	
	List<Map<String, Object>>memberlist();
	
	Map<String, Object> memberdetail(String bid);
	
	void memberupdate(Map<String, Object> map);
	
	void memberdelete(String username);
	

	
	void getUpositionByUsername(String username);

	UsersDTO memberexist(String uemail);

	Map<String, Object> getUserDataByUsername(String username);


}
