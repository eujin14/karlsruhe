package com.karlsruhe.users;


import java.util.List;
import java.util.Map;

<<<<<<< HEAD
import org.apache.ibatis.annotations.Param;

=======
>>>>>>> origin/sunghee
public interface UsersRepository {
	
	void create(Map<String, Object> map); 

	List<Map<String, Object>>memberList();
	
	Map<String, Object> memberDetail(String username);
	
	void memberUpdate(Map<String, Object> map);
	
<<<<<<< HEAD
	void memberDelete(String username);
=======
	void memberDelete(String uno);
>>>>>>> origin/sunghee
	
	
	void findUpositionByUsername(String username);
	

	UsersDTO memberExist(String uemail);
	
	Map<String, Object> getUserDataByUsername(String username);
<<<<<<< HEAD
	
	
	 String findIdUser(String uname, String utel);

	 String findPw(String uname, String utel,  String username);

	void updatePasswordUsers(String password, String username);
	 
=======

>>>>>>> origin/sunghee

}
