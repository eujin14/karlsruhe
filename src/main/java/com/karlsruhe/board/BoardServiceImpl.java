package com.karlsruhe.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
@Autowired private BoardRepository boardRepository;
    
	@Override
	public void create(Map<String, Object> map) {
		boardRepository.create(map);
	}


	@Override
	public List<Map<String, Object>> readList() {
		return boardRepository.readList();
	}

	@Override
	public Map<String, Object> readDetail(String bno) {
		return boardRepository.readDetail(bno);
	}

	@Override
	public void update(Map<String, Object> map) {
		boardRepository.update(map);
	}

	@Override
	public void delete(String bno) {
		boardRepository.delete(bno);
	}

	/*
	 * @Override public List<Map<String, Object>> readreply(String breply) { return
	 * boardRepository.readreply(breply); }
	 */

	
	  @Override public List<Map<String, Object>> readreply(String breply) { return
	  boardRepository.readreply(breply); }


	@Override
	public void count(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}
	 


	
}

