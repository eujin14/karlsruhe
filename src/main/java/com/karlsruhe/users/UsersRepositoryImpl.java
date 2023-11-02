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
	public List<Map<String, Object>> memberlist() {
		return sqlSessionTemplate.selectList("users.memberlist");
	}

	@Override
	public Map<String, Object> memberdetail(String username) {
		return sqlSessionTemplate.selectOne("users.memberdetail", username);
	}

	@Override
	public void memberupdate(Map<String, Object> map) {
		sqlSessionTemplate.update("users.memberupdate", map);
		
	}

	@Override
	public void memberdelete(String username) {
		sqlSessionTemplate.delete("users.memberdelete", username);
		
	}

	@Override
	public void findUpositionByUsername(String username) {
		 sqlSessionTemplate.selectOne("users.findUpositionByUsername", username);
		
	}

	@Override
	public UsersDTO memberexist(String uemail) {
		return sqlSessionTemplate.selectOne("users.memberexist", uemail);
	}

	@Override
	public Map<String, Object> getUserDataByUsername(String username) {
		 return sqlSessionTemplate.selectOne("users.getUserDataByUsername", username);
	}
	
	

	

}
