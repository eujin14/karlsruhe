package com.karlsruhe.admin;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminRepositoryImpl implements AdminRepository {

	
	@Autowired private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void create(Map<String, Object> map) {
		 sqlSessionTemplate.insert("admin.create", map);	
	}
	
	@Override
	public void create2(Map<String, Object> map) {
		 sqlSessionTemplate.insert("admin.create2", map);	
	}
	@Override
	public void create3(Map<String, Object> map) {
		 sqlSessionTemplate.insert("admin.create3", map);	
	}

	
}

