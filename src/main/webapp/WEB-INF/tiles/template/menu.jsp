<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between">

     <div class="logo d-flex align-items-center">
    <a href="/" class="d-flex align-items-center text-decoration-none">
        <img src="/resources/images/logo3.png" width="98px" alt="" class="img-fluid me-2">
        <h1 class="text-dark mb-0">ekgkarlsruhe</h1>
    </a>
     </div>

      <nav id="navbar" class="navbar">
        <ul>
          
          
          <li class="dropdown"><a href="#"><span>교회소개</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="/greetings">목사님의 인사말</a></li>
              <li><a href="/history">교회연혁</a></li>
              <li><a href="/time">예배시간</a></li>
              <li><a href="location">예배장소</a></li>
            </ul>
          </li>
        <li><a href="/notice/readList">공지사항</a></li>
        <li><a href="/weekly/readList">주보</a></li>
          <li><a href="/board/readList">게시판</a></li>
          <li><a href="/photo/readList">갤러리</a></li>
          <br><br>
           <sec:authorize access="hasRole('ROLE_ADMIN')">
           <a class="nav-link" href="/admin/admin" role="button"  aria-haspopup="true"><span class="uil fs-0 me-2" data-feather="user"></span>관리자전용</a>
         </sec:authorize>
          
        <li><sec:authentication property="principal" var="user" />
            <sec:authorize access="isAnonymous()">
             
             <div class="d-grid gap-2 d-md-flex justify-content-md-end">
			    <br><br>
			    <a href="/create" >
			        <button type="button" class="btn btn-outline-primary btn-sm">Sign up</button>
			    </a>
			    <a href="/login" >
			        <button type="button" class="btn btn-outline-danger btn-sm">Login</button>
			    </a>
            </div>
              </sec:authorize> 
              
		                
		     <sec:authorize access="isAuthenticated()">
		       <div class="d-flex align-items-center">
		        <div id="name"><a href="/users/memberDetail?username=${user.username}">[${user.username} ]님 로그인 중입니다.</a></div>
		        <form:form method="post" action="/logout" cssStyle="display: inline-block;">
		            <button type="submit" class="btn btn-link">로그아웃</button>
		        </form:form>
		    </div>
		</sec:authorize>
		          
        </ul>
        
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
</body>
</html>