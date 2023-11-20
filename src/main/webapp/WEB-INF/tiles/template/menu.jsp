<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
  <div class="container_12">
    <div class="grid_12">
    <sec:authentication property="principal" var="user" />
      <sec:authorize access="isAnonymous()">
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
          <button type="button" class="btn btn-outline-primary"><a href="/users/join">회원가입</a></button>
          <button type="button" class="btn btn-outline-danger"><a href="/login">로그인</a></button>
        </div>
      </sec:authorize>   
      <sec:authorize access="isAuthenticated()">
        <div id="name" class="d-grid gap-2 d-md-flex justify-content-md-end" ><a href="/users/memberDetail?username=${user.username}">[${user.username} ]님 로그인 중입니다.</a></div>
      </sec:authorize>
      <h1 class="logo">
        <a href="index.html">
         KARLSRUHE
          <span>칼스루에 한인교회</span>
        </a>
      </h1>
    </div>
    <div class="clear"></div>
  </div>
  <section id="stuck_container">
  <!--==============================
              Stuck menu
  =================================-->
    <div class="container_12">
        <div class="grid_12">          
          <div class="navigation">
            <nav>
              <ul class="sf-menu">
               <li class="current"><a href="index.html">교회 소개</a></li>
               <li><a href="about.html">예배 안내</a></li>
               <li><a href="mission.html">갤러리</a></li>
               <li><a href="membership.html">게시판</a></li>
             </ul>
            </nav>
            <div class="clear"></div>
          </div>       
         <div class="clear"></div>  
     </div> 
     <div class="clear"></div>
    </div> 
  </section>
</header>
<section class="slider_wrapper">
  <div id="camera_wrap" class="">
    <div data-src="/resources/images/1.jpg"></div>
    <div data-src="/resources/images/2.jpg"></div>
    <div data-src="/resources/images/3.jpg"></div>  
  </div>  
</section>
</body>
</html>