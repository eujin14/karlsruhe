package com.karlsruhe.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeRepository noticeRepository;

	@Override
	public void create(Map<String, Object> map) {
		noticeRepository.create(map);
	}

	@Override
	public List<Map<String, Object>> readList() {
		return noticeRepository.readList();
	}

	@Override
	public Map<String, Object> readDetail(String nid) {
		return noticeRepository.readDetail(nid);
	}

	@Override
	public List<NoticeDTO> readReply(String npid) {
		return noticeRepository.readReply(npid);
	}
	
	@Override
	public void update(Map<String, Object> map) {
		noticeRepository.update(map);

	}

	@Override
	public void delete(String nid) {
		noticeRepository.delete(nid);
	}
	
}

