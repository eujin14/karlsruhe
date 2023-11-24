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

<div class="col-3">
    <div id="password" name="password">****</div>
</div>
<div class="col-6 updatePwBtn">
  <a href="/updatePw" class="button" id="updatePwBtn">수정</a>
 </div>

${member.uname} <br><br> 

${member.utel} <br><br> 

${member.uemail} <br><br> 

${member.uaddr} <br><br>

${member.udate} <br><br>

<br><br> <br><br> 
<a href="/users/memberUpdate?username=${member.username}">수정</a>
<br><br> 

<a href="/logout">로그아웃</a>
</body>
</html>