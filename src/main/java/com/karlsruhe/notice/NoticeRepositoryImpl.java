package com.karlsruhe.notice;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeRepositoryImpl implements NoticeRepository {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void create(Map<String, Object> map) {
		sqlSessionTemplate.insert("notice.create", map);
	}
	
	@Override
	public List<Map<String, Object>> readList() {
		return sqlSessionTemplate.selectList("notice.readList");
	}

	@Override
	public Map<String, Object> readDetail(String nid) {
		return sqlSessionTemplate.selectOne("notice.readDetail", nid);
	}

	@Override
	public List<NoticeDTO> readReply(String npid) {
		return sqlSessionTemplate.selectList("notice.readReply", npid);
	}
	
	@Override
	public void update(Map<String, Object> map) {
		sqlSessionTemplate.update("notice.update", map);
	}

	@Override
	public void delete(String nid) {
		sqlSessionTemplate.delete("notice.delete", nid);

	}
	


}

