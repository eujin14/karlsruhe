package com.karlsruhe.weekly;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WeeklyRepositoryImpl implements WeeklyRepository {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void create(Map<String, Object> map) {
		sqlSessionTemplate.insert("weekly.create", map);

	}

	@Override
	public List<Map<String, Object>> readList() {
		return sqlSessionTemplate.selectList("weekly.readList");
	}

	@Override
	public Map<String, Object> readDetail(String gid) {
		return sqlSessionTemplate.selectOne("weekly.readDetail", gid);
	}

	@Override
	public void update(Map<String, Object> map) {
		sqlSessionTemplate.update("weekly.update", map);

	}

	@Override
	public void delete(String gid) {
		sqlSessionTemplate.delete("weekly.delete", gid);

	}

}
