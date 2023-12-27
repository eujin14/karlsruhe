package com.karlsruhe.admin;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

public interface AdminRepository {
	
	void create(Map<String,Object>map);
	List <Map<String,Object>> readList();
	String readDetail(String img);
	void update(Map<String,Object>map);
	void delete(String pno);


}
