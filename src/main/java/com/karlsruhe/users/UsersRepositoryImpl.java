package com.karlsruhe.users;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersRepositoryImpl implements UsersRepository {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;


	@Override
	public void create(Map<String, Object> map) {
		sqlSessionTemplate.insert("users.create", map);
		
	}

	@Override
	public List<Map<String, Object>> memberList() {
		return sqlSessionTemplate.selectList("users.memberList");
	}

	@Override
	public UsersDTO memberDetail(String username) {
		return sqlSessionTemplate.selectOne("users.memberDetail", username);
	}

	@Override
	public void memberUpdate(Map<String, Object> map) {
		sqlSessionTemplate.update("users.memberUpdate", map);
		
	}
	

	@Override
	public void memberDelete(String username) {
		sqlSessionTemplate.delete("users.memberDelete", username);
		
	}


	@Override
	public UsersDTO memberExist(String uemail) {
		return sqlSessionTemplate.selectOne("users.memberExist", uemail);
	}

	

	@Override
	public String findIdUser(String uname, String utel) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String findPw(String name, String tel, String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countUsers() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
    public UsersDTO telChk(String utel) {
        return sqlSessionTemplate.selectOne("users.telChk", utel);
    }


	@Override
	public String pwCheck(String memberId)throws Exception{
		return sqlSessionTemplate.selectOne("memberMapper.pwCheck", memberId);
	}
	
	@Override
	public void pwUpdate(String memberId, String hashedPw) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("memberPw", hashedPw);
		sqlSessionTemplate.update("users.memberUpdate", map);
		
	}
}
	

	
