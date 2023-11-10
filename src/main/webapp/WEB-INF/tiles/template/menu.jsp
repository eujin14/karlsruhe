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
      <h1 class="logo">
      <div class="d-grid gap-2 d-md-flex justify-content-md-end">
          <button type="button" class="btn btn-outline-primary"><a href="/user/join">회원가입</a></button>
            <button type="button" class="btn btn-outline-danger"><a href="/login">로그인</a></button>
         </div>
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
               <li class="current"><a href="index.html">홈</a></li>
               <li><a href="about.html">교회 소개</a></li>
               <li><a href="mission.html">교회 소식</a></li>
               <li><a href="membership.html">게시판</a></li>
               <li><a href="contacts.html">오시는 길</a></li>
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