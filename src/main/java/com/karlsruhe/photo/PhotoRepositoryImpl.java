package com.karlsruhe.photo;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PhotoRepositoryImpl implements PhotoRepository {

	
	@Autowired private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void create(Map<String, Object> map) {
		 sqlSessionTemplate.insert("photo.create", map);
		
	}

	@Override
	public List<Map<String, Object>> readList() {
		return sqlSessionTemplate.selectList("photo.readList");
	}

	@Override
	public Map<String, Object> readDetail(String pno) {
         return sqlSessionTemplate.selectOne("photo.readDetail",pno);

	}

	@Override
	public void update(Map<String, Object> map) {
		sqlSessionTemplate.update("photo.update",map);
		
	}
	@Override
	public void delete(String pno) {
		sqlSessionTemplate.delete("photo.delete",pno);

	}

}

