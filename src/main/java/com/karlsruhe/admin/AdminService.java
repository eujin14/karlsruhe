package com.karlsruhe.admin;

import java.util.List;
import java.util.Map;

public interface AdminService {
	
	void create(Map<String,Object>map);
	List <Map<String,Object>> readList();
	String readDetail(String img);
	void update(Map<String,Object>map);
	void delete(String id);
	

}
