<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <form action="/users/memberupdate?${_csrf.parameterName}=${_csrf.token}" method="post">
<p>아이디<input type="text" name="username" value="${member.username}" readonly>
<p>패스워드<input type="password" name="password" value="${member.password}">
<p>연락처<input type="text" name="utel" value="${member.utel}" readonly >
<p>이메일<input type="text" name="uemail" value="${member.uemail}" >
<p>주소<input type="text" name="uaddr" value="${member.uaddr}" >
<input type="hidden" name="username" value="${member.username }">

<input type="submit" value="회원정보 수정">
	

</form>

</body>
</html>