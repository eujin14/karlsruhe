package com.karlsruhe.guide;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GuideRepositoryImpl implements GuideRepository {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void create(Map<String, Object> map) {
		sqlSessionTemplate.insert("guide.create", map);

	}

	@Override
	public List<Map<String, Object>> readList() {
		return sqlSessionTemplate.selectList("guide.readList");
	}

	@Override
	public Map<String, Object> readDetail(String gid) {
		return sqlSessionTemplate.selectOne("guide.readDetail", gid);
	}

	@Override
	public void update(Map<String, Object> map) {
		sqlSessionTemplate.update("guide.update", map);

	}

	@Override
	public void delete(String gid) {
		sqlSessionTemplate.delete("guide.delete", gid);

	}

}
