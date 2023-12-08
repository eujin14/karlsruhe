package com.karlsruhe.weekly;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WeeklyServiceImpl implements WeeklyService {
	
	@Autowired
	private WeeklyRepository weeklyRepository;

	@Override
	public void create(Map<String, Object> map) {
		weeklyRepository.create(map);

	}

	@Override
	public List<Map<String, Object>> readList() {
		return weeklyRepository.readList();
	}

	@Override
	public Map<String, Object> readDetail(String gid) {
		return weeklyRepository.readDetail(gid);
	}

	@Override
	public void update(Map<String, Object> map) {
		weeklyRepository.update(map);	
	}

	@Override
	public void delete(String gid) {
		weeklyRepository.delete(gid);

	}

}
