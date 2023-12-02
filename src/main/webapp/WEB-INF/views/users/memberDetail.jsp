<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

${member.uno} <br><br>

${member.username} <br><br> 


 <div class="row g-3 align-items-center">
                <div class="col-3">
                            <label for="password" class="col-form-label">비밀번호 : ******** </label>
                        </div>
                        
                    </div>


${member.uname} <br><br> 

${member.utel} <br><br> 

${member.uemail} <br><br> 

${member.uaddr} <br><br>

${member.udate} <br><br>

<br><br> <br><br> 

<a href="/users/memberUpdate?username=${member.username}">수정</a>
<br><br> 
<a href="/users/memberDelete?username=${member.username}">삭제</a>


<a href="/logout">로그아웃</a>
</body>
</html>