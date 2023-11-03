<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
</head>
<body>
<h1> 회원 로그인</h1>
<form action="/login" method="post">
<p>id : <input type="text" name="username">
<p>pw : <input type="password" name="password">

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<p><input type="submit" value="가입">
</form>
</body>
</html>