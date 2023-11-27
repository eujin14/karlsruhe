package com.karlsruhe.users;

import java.util.List;
import java.util.Map;


public interface UsersService {
	
   void create(Map<String, Object> map); 
	
	List<Map<String, Object>>memberList();
	
	 UsersDTO memberDetail(String username);
	
	void memberUpdate(Map<String, Object> map);
	
	void memberDelete(String username);
	
	UsersDTO memberExist(String uemail);


	
	String findIdUser(String paramString1, String paramString2);
	  
    String findPw(String paramString1, String paramString2, String paramString3);
    
    int totalCount();
    
    int countUsers();

    UsersDTO telChk(String utel);
    
    String pwCheck(String memberId)throws Exception;

    void pwUpdate(String memberId, String hashedPw)throws Exception;

    



}
