package com.karlsruhe.photo;

import java.util.List;
import java.util.Map;

public interface PhotoRepository {
	
	void create(Map<String,Object>map);
	List <Map<String,Object>> readList();
	Map<String,Object> readDetail(String pno);
	void update(Map<String,Object>map);
	void delete(String pno);
	
	List<Map<String,Object>> readReply(String preply);

}
