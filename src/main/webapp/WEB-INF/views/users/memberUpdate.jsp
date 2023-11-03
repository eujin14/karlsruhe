<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form action="/users/memberUpdate" method="post">
<p>아이디:<input type="text" name="username" value="${member.username}" readonly>
<p>패스워드:<input type="password" name="password" value="${member.password}" readonly>
<p>이름:<input type="text" name="uname" value="${member.uname}">
<p>연락처:<input type="text" name="utel" value="${member.utel}"  >
<p>이메일:<input type="text" name="uemail" value="${member.uemail}" >
<p>주소:<input type="text" name="uaddr" value="${member.uaddr}" >
<input type="hidden" name="username" value="${member.username }">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 <input type="hidden" name="uno" value="${member.uno}">

<input type="submit" value="회원정보 수정">
	

</form>

</body>
</html>