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

${member.uname} <br><br> 

${member.utel} <br><br> 

${member.uemail} <br><br> 

${member.uaddr} <br><br>

${member.udate} <br><br>

<br><br> <br><br> 
<a href="/users/memberUpdate?username=${member.username}">수정</a>
<br><br> 
<a href="/users/memberDelete?username=${member.username}">삭제</a>
</body>
</html>