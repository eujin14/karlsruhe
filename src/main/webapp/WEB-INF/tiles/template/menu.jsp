<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

      <div class="logo">
        <h1 class="text-light"><a href="index.html">Flattern</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a class="active" href="index.html">Home</a></li>
          
          <li class="dropdown"><a href="#"><span>교회소개</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">목사님의 인사말</a></li>
                <ul>
                </ul>
              <li><a href="#">교회연혁</a></li>
              <li><a href="#">섬기는 이</a></li>
              <li><a href="#">예배장소와 시간</a></li>
            </ul>
          </li>
        <li><a href="services.html">공지사항</a></li>
        <li><a href="services.html">주보</a></li>
          <li><a href="services.html">게시판</a></li>
          <li><a href="testimonials.html">갤러리</a></li>
          
           <sec:authorize access="hasRole('ROLE_ADMIN')">
           <a class="nav-link" href="admin/admin" role="button"  aria-haspopup="true"><span class="uil fs-0 me-2" data-feather="user"></span>관리자전용</a>
         </sec:authorize>
          
        <li><sec:authentication property="principal" var="user" />
            <sec:authorize access="isAnonymous()">
             <div class="d-grid gap-2 d-md-flex justify-content-md-end">
              <button type="button" class="btn btn-outline-primary"><a href="/users/create">회원가입</a></button>
              <button type="button" class="btn btn-outline-danger"><a href="/login">로그인</a></button>
              </div>
      </sec:authorize>   
      <sec:authorize access="isAuthenticated()">
        <div id="name" class="d-grid gap-2 d-md-flex justify-content-md-end" ><a href="/users/memberDetail?username=${user.username}">[${user.username} ]님 로그인 중입니다.</a></div>
      </sec:authorize></li>
          
        </ul>
        
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->
</body>
</html>