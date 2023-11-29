package com.karlsruhe.users;

<<<<<<< HEAD
import java.util.HashMap;
=======
>>>>>>> origin/sunghee
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersRepositoryImpl implements UsersRepository {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void create(Map<String, Object> map) {
		sqlSessionTemplate.insert("users.create", map);
		
	}

	@Override
	public List<Map<String, Object>> memberList() {
		return sqlSessionTemplate.selectList("users.memberList");
	}

	@Override
	public Map<String, Object> memberDetail(String username) {
		return sqlSessionTemplate.selectOne("users.memberDetail", username);
	}

	@Override
	public void memberUpdate(Map<String, Object> map) {
		sqlSessionTemplate.update("users.memberUpdate", map);
		
	}

	@Override
<<<<<<< HEAD
	public void memberDelete(String username) {
		sqlSessionTemplate.delete("users.memberDelete", username);
=======
	public void memberDelete(String uno) {
		sqlSessionTemplate.delete("users.memberDelete", uno);
>>>>>>> origin/sunghee
		
	}

	@Override
	public void findUpositionByUsername(String username) {
		 sqlSessionTemplate.selectOne("users.findUpositionByUsername", username);
		
	}

	@Override
	public UsersDTO memberExist(String uemail) {
		return sqlSessionTemplate.selectOne("users.memberExist", uemail);
	}

	@Override
	public Map<String, Object> getUserDataByUsername(String username) {
		 return sqlSessionTemplate.selectOne("users.getUserDataByUsername", username);
	}
<<<<<<< HEAD


	@Override
	public String findIdUser(String uname, String utel) {
		 Map<String, Object> parameters = new HashMap<String, Object>();
	        parameters.put("uname", uname);
	        parameters.put("utel", utel);

	        return sqlSessionTemplate.selectOne("users.findIdUser", parameters);
	    }

	@Override
	public String findPw(String uname, String utel, String username) {
		 Map<String, Object> parameters = new HashMap<String, Object>();
	        parameters.put("uname", uname);
	        parameters.put("utel", utel);
	        parameters.put("username", username);

	        return sqlSessionTemplate.selectOne("users.findIdUser", parameters);
	    }

	@Override
	public void updatePasswordUsers(String password, String username) {
		// TODO Auto-generated method stub
		
	}
	
	}



=======
	
	

	

}
>>>>>>> origin/sunghee
