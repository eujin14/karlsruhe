package com.karlsruhe.board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardRepositoryImpl implements BoardRepository {

	
	@Autowired private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void create(Map<String, Object> map) {
		 sqlSessionTemplate.insert("board.create", map);
		
	}

	@Override
	public List<Map<String, Object>> readList() {
		return sqlSessionTemplate.selectList("board.readList");
	}

	@Override
	public Map<String, Object> readDetail(String bno) {
         return sqlSessionTemplate.selectOne("board.readDetail",bno);

	}

	@Override
	public void update(Map<String, Object> map) {
		sqlSessionTemplate.update("board.update",map);
		
	}
	@Override
	public void delete(String bno) {
		sqlSessionTemplate.delete("board.delete",bno);

	}


	/*
	 * @Override public List<Map<String, Object>> readreply(String breply) { return
	 * sqlSessionTemplate.selectList("board.breply",breply); }
	 */

	
	  @Override 
	  public List<Map<String, Object>> readreply(String breply) { return
	  sqlSessionTemplate.selectList("board.breply",breply); }
	 

	


}

