package com.karlsruhe.weekly;

import java.util.List;
import java.util.Map;

public interface WeeklyRepository {
	
	void create(Map<String, Object> map);
	
	List<Map<String, Object>> readList();
	
	Map<String, Object> readDetail(String gid);
	
	void update(Map<String, Object> map);
	
	void delete(String gid);

}
