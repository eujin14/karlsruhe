package com.karlsruhe.users;

import lombok.Data;

@Data
public class UsersDTO {
	
	private String uno, username, password, authority, enabled, uname, utel, uemail, uaddr, udate;

	 public String getUsername() {
	        // 사용자 이름을 반환하는 코드 작성
	        return this.username;
	    }

}
