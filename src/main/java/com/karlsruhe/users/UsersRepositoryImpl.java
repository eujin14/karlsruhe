package com.karlsruhe.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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
	public void memberDelete(String username) {
		sqlSessionTemplate.delete("users.memberDelete", username);
		
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


	@Override
	public String findIdUser(String uname, String utel) {
		 Map<String, Object> parameters = new HashMap<String, Object>();
	        parameters.put("uname", uname);
	        parameters.put("utel", utel);

	        return sqlSessionTemplate.selectOne("users.findIdUser", parameters);
	    }

	@Override
	public int findPwCheck(UsersDTO usersDTO) throws Exception {
		return sqlSessionTemplate.selectOne("users.findPwCheck", usersDTO);		}


	@Override
	public int findPw(@Param("password") String password, @Param("uemail") String uemail, @Param("username") String username) throws Exception {
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("uemail", uemail);
	    map.put("username", username);
	    map.put("password", password);
	    return sqlSessionTemplate.update("users.findPw", map);
	}

	@Override
	public int updatePasswordUsers(@Param("password") String password, @Param("username") String username) {
		Map<String, Object> map = new HashMap<String, Object>();
	    map.put("password", password);
	    map.put("username", username);
	   
	    return sqlSessionTemplate.update("users.updatePasswordUsers", map);
	}

	

	
	}



