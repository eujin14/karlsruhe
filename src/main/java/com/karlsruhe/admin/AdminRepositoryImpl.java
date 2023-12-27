package com.karlsruhe.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

@Repository
public class AdminRepositoryImpl implements AdminRepository {

	
	@Autowired private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void create(Map<String, Object> map) {
		 sqlSessionTemplate.insert("admin.create", map);
		
	}

	@Override
	public List<Map<String, Object>> readList() {
		return sqlSessionTemplate.selectList("admin.readList");
	}

	@Override
	public String readDetail(String img) {
         return sqlSessionTemplate.selectOne("admin.readDetail",img);

	}

	@Override
	public void update(Map<String, Object> map) {
		
		System.out.println("리파지토리 전 최종 확인  filename : " + map.get("image"));
		System.out.println("리파지토리 전 최종 확인 img : " + map.get("img"));
		
		

	    sqlSessionTemplate.update("admin.update", map);
	    
		
	}
	@Override
	public void delete(String pno) {
		sqlSessionTemplate.delete("admin.delete",pno);

	}

	


}

