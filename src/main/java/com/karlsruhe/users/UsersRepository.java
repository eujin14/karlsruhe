package com.karlsruhe.users;


import java.util.List;
import java.util.Map;

public interface UsersRepository {
	
	void create(Map<String, Object> map); 

	List<Map<String, Object>>memberList();
	
	 UsersDTO memberDetail(String username);
	
	void memberUpdate(Map<String, Object> map);
	
	void updatePasswordUsers(String password, String username);
	
	void memberDelete(String username);
	
	UsersDTO memberExist(String uemail);
	

	
	String findIdUser(String name, String tel);
	  
    String findPw(String uname, String utel, String username);
    
    int totalCount();
    
    int countUsers();

    UsersDTO telChk(String utel);
	




	


}
