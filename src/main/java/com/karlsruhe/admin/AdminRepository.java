package com.karlsruhe.admin;

import java.util.List;
import java.util.Map;

public interface AdminRepository {
	
	void create(Map<String,Object>map);
	void create2(Map<String,Object>map);
	void create3(Map<String,Object>map);
	
	List <Map<String,Object>> readList1();
	List <Map<String,Object>> readList2();
	List <Map<String,Object>> readList3();
	

}