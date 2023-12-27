package com.karlsruhe.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	
@Autowired private AdminRepository adminRepository;
    
	@Override
	public void create(Map<String, Object> map) {
		adminRepository.create(map);
	}


	@Override
	public List<Map<String, Object>> readList() {
		return adminRepository.readList();
	}

	@Override
	public String readDetail(String img) {
		return adminRepository.readDetail(img);
	}

	@Override	

	public void update(Map<String, Object> map) {
	    adminRepository.update(map);
	}

	@Override
	public void delete(String id) {
		adminRepository.delete(id);
	}


}

