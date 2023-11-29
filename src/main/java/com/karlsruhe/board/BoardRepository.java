package com.karlsruhe.board;

import java.util.List;
import java.util.Map;

public interface BoardRepository {
	
	void create(Map<String,Object>map);
	List <Map<String,Object>> readList();
	Map<String,Object> readDetail(String bno);
	void update(Map<String,Object>map);
	void delete(String bno);
	
<<<<<<< HEAD
	/*
	 * List<Map<String,Object>> readreply(String breply);
	 */	
=======
	
	  List<Map<String,Object>> readreply(String breply);
	 	
>>>>>>> origin/sunghee
	void count(Map<String,Object>map);

}
