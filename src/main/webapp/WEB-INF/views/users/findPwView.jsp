<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Services - Flattern Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/resources/assets/img/favicon.png" rel="icon">
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Muli:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/resources/assets/css/style.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/resources/users/css/findPwView.css" type="text/css">

</head>

<body>


  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between">

      <div class="logo">
        <h1 class="text-light"><a href="/">ekgkarlsruhe</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav id="navbar" class="navbar">
        <ul>
          
          
          <li class="dropdown"><span>교회소개</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
               <li><a href="/greetings">목사님의 인사말</a></li>
              <li><a href="/history">교회연혁</a></li>
              <li><a href="/time">예배시간</a></li>
              <li><a href="/location">예배장소</a></li>
            </ul>
          </li>
        <li><a href="services.html">공지사항</a></li>
        <li><a href="services.html">주보</a></li>
          <li><a href="services.html">게시판</a></li>
          <li><a href="testimonials.html">갤러리</a></li>
          <br><br>
           <sec:authorize access="hasRole('ROLE_ADMIN')">
           <a class="nav-link" href="/admin/admin" role="button"  aria-haspopup="true"><span class="uil fs-0 me-2" data-feather="user"></span>관리자전용</a>
         </sec:authorize>
          
        <li><sec:authentication property="principal" var="user" />
            <sec:authorize access="isAnonymous()">
             
             <div class="d-grid gap-2 d-md-flex justify-content-md-end">
             <br><br>
              <button type="button" class="btn btn-outline-primary btn-sm""><a href="/users/create">회원가입</a></button>
              <button type="button" class="btn btn-outline-danger btn-sm""><a href="/login">로그인</a></button>
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
  

<div class="find_box">
    <div class="contact">
        <div class="justify-content-center formHeader">
                    <a id="findIdForm" ><h3>비밀번호 찾기</h3></a>
                </div>
       <div class="inputForm">    
        <form class="user" action="/users/findPw?${_csrf.parameterName}=${_csrf.token}" method="post">
                <input type="text" id="username"  name="username" placeholder="Enter ID....">
                <input type="email"  id="uemail"  name="uemail" placeholder="Enter Email Address...">
        <div class="BtnGroup">
            <button type="submit" id="myButton" class="btn btn-primary btn-user btn-block">전송하기</button>
        <a href="/login" type="button" class="button">로그인</a>
        </div>
        </form>
        </div>
         <div class="text-center">
            <a class="small" href="/">메인페이지</a>
        </div>
    </div>
    </div>
    <!-- Move the script to the end of the body or use DOMContentLoaded -->
     <!-- jQuery script -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!-- Your custom script -->
        
        <script type="text/javascript" th:inline="javascript">
            $(document).ready(function() {
                $("#findPwButton").click(function() {
                    var username = $("#username").val();
                    var uemail = $("#uemail").val();
                    var csrfToken = $("#_csrf").attr("content");

                    $.ajax({
                        type: "POST",
                        url: "/users/findPw",
                        data: {
                            username: username,
                            uemail: uemail
                        },
                        headers: {
                            "X-CSRF-TOKEN": csrfToken
                        },
                        success: function(data) {
                            // Handle success
                        },
                        error: function(xhr, status, error) {
                            // Handle error
                        }
                    });
                });
            });
        </script>
 <!-- ======= Footer ======= -->
  <footer id="footer">

   
    
    <div class="container d-md-flex py-4">

      <div class="me-md-auto text-center text-md-start">
        <div class="copyright">
          &copy; Copyright <strong><span>Flattern</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
          <!-- All the links in the footer should remain intact. -->
          <!-- You can delete the links only if you purchased the pro version. -->
          <!-- Licensing information: https://bootstrapmade.com/license/ -->
          <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/ -->
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div>
      <div class="social-links text-center text-md-right pt-3 pt-md-0">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="/resources/assets/vendor/aos/aos.js"></script>
  <script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="/resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>

</body>

</html>