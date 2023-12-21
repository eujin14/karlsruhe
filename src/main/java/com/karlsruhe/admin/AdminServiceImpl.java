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
public void create2(Map<String, Object> map) {
	adminRepository.create2(map);
}

@Override
public void create3(Map<String, Object> map) {
	adminRepository.create3(map);
}

@Override
public void update(Map<String, Object> map) {
	adminRepository.update(map);
}

@Override
public void update2(Map<String, Object> map) {
	adminRepository.update2(map);
}

@Override
public void update3(Map<String, Object> map) {
	adminRepository.update3(map);
}

@Override
public Map<String, Object> readDetail(String id) {
	return adminRepository.readDetail(id);
}

@Override
public List<Map<String, Object>> readList() {
	return adminRepository.readList();
}

}

