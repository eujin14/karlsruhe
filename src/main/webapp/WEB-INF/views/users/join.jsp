<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/users/join" method="post" >
<p>아이디:<input type="text" name="username"></p>
<p>비밀번호:<input type="password" name="password"></p>
<p>이름:<input type="text" name="uname"></p>
<p>전화번호<input type="text" name="utel"></p>
<p>이메일<input type="text" name="uemail"></p>
<p>주소:<input type="text" name="uaddr"></p>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

<input type="submit" value="등록">
</form>
</body>
</html>