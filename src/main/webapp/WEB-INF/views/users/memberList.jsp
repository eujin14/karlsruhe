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
<c:forEach items="${members}" var="member">


<<<<<<< HEAD
<a href="/users/memberDetail?username=${member.username}">${member.username}</a>
=======
<a href="/users/memberDetail?uno=${member.uno}">${member.username}</a>
>>>>>>> origin/sunghee

/ ${member.uname} / ${member.uemail}/ ${member.udate}
<br>
</c:forEach>
</body>
</html>