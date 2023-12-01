package com.karlsruhe.photo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PhotoServiceImpl implements PhotoService {
	
@Autowired private PhotoRepository photoRepository;
    
	@Override
	public void create(Map<String, Object> map) {
		photoRepository.create(map);
	}


	@Override
	public List<Map<String, Object>> readList() {
		return photoRepository.readList();
	}

	@Override
	public Map<String, Object> readDetail(String pno) {
		return photoRepository.readDetail(pno);
	}

	@Override
	public void update(Map<String, Object> map) {
		photoRepository.update(map);
	}

	@Override
	public void delete(String pno) {
		photoRepository.delete(pno);
	}

}

