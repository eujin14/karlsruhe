package com.karlsruhe.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
	
@Autowired private AdminRepository boardRepository;
    
	@Override
	public void create(Map<String, Object> map) {
		boardRepository.create(map);
	}
	
	@Override
	public void create2(Map<String, Object> map) {
		boardRepository.create2(map);
	}
	
	@Override
	public void create3(Map<String, Object> map) {
		boardRepository.create3(map);
	}

}

