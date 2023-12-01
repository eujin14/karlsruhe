<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <div class="card o-hidden border-0 shadow-lg my-5">
        
               
                    
                           <div class="jumbotron">
  <h2> 임시 비밀번호가 전송되었습니다. </h2><br/>
  		
  	<h1>${users}</h1><br/>
  	<h2>를 확인해주세요.</h2>
  <button type="button" class="btn btn-primary" onclick="location.href='/login'">로그인페이지</button>
  <button type="button" class="btn btn-primary" onclick="location.href='/main'">메인페이지</button>
  
  
</div>
</body>
</html>