<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>로그 아웃 하시겠습니까???</h2>
<form action="/logout" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="submit" value="로그아웃">
</form>
</body>
</html>