<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


</head>
<body>

  <form action="/users/memberUpdate?${_csrf.parameterName}=${_csrf.token}" method="post" >
           <input type="hidden" name="username" value="${member.username}">
           <input type="hidden" name="password" value="${member.password}">
           <br><br><br>
              <div class="mb-3 text-start">
                <label class="form-label" for="username">아이디: ${member.username}</label>
              </div>
              <div class="mb-3 text-start">
                <label class="form-label" for="password">암호:******</label>
              </div>

              <div class="mb-3 text-start">
                <label class="form-label" for="uname">이름</label>
             <input class="form-control" id="uname" type="text" name="uname"  value="${member.uname}" />
              </div>
              <div class="mb-3 text-start">
                <label class="form-label" for="utel">연락처</label>
                <input class="form-control" id="utel" name="utel" type="text" placeholder="010-1234-5678" value="${member.utel}"/>
              </div>
              <div class="mb-3 text-start">
                <label class="form-label" for="uemail">E-Mail</label>
                <input class="form-control" id="uemail" name="uemail" type="email" value="${member.uemail}"  />
              </div>
              <div class="mb-3 text-start">
                <label class="form-label" for="uaddr">주소</label>
                <input class="form-control" id="uaddr" type="text" name="uaddr"  value="${member.uaddr}"/>
              </div>
              <button class="btn btn-primary w-100 mb-3" type="submit" value="회원수정" >회원정보 수정</button>              
            </form>
<br><br><br><br><br>

  <script src="/resources/assets/js/main.js"></script>

</body>
</html>