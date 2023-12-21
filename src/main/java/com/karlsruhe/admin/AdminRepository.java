package com.karlsruhe.admin;

import java.util.List;
import java.util.Map;

public interface AdminRepository {
	
	void create(Map<String,Object>map);
	void create2(Map<String,Object>map);
	void create3(Map<String,Object>map);
	void update(Map<String,Object>map);
	void update2(Map<String,Object>map);
	void update3(Map<String,Object>map);
	Map<String,Object> readDetail(String id);
	List <Map<String,Object>> readList();

}
