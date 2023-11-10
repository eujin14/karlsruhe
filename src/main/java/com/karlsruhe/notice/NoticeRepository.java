package com.karlsruhe.notice;

import java.util.List;
import java.util.Map;

public interface NoticeRepository {
	
	void create(Map<String, Object> map);
	
	List<Map<String, Object>> readList();
	
	Map<String, Object> readDetail(String nid);
	
	void update(Map<String, Object> map);
	
	void delete(String nid);
			
	List<NoticeDTO> readReply(String npid);

}
