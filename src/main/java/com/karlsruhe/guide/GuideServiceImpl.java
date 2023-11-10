package com.karlsruhe.guide;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GuideServiceImpl implements GuideService {
	
	@Autowired
	private GuideRepository guideRepository;

	@Override
	public void create(Map<String, Object> map) {
		guideRepository.create(map);

	}

	@Override
	public List<Map<String, Object>> readList() {
		return guideRepository.readList();
	}

	@Override
	public Map<String, Object> readDetail(String gid) {
		return guideRepository.readDetail(gid);
	}

	@Override
	public void update(Map<String, Object> map) {
		guideRepository.update(map);	
	}

	@Override
	public void delete(String gid) {
		guideRepository.delete(gid);

	}

}
