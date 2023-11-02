package com.karlsruhe.guide;

import java.util.List;
import java.util.Map;

public interface GuideService {
	
	void create(Map<String, Object> map);
	
	List<Map<String, Object>> readList();
	
	Map<String, Object> readDetail(String gid);
	
	void update(Map<String, Object> map);
	
	void delete(String gid);

}
