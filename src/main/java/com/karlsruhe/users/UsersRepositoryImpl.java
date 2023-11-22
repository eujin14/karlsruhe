package com.karlsruhe.users;

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
	
	

	

}
