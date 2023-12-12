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

  <!-- =======================================================
  * Template Name: Flattern
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>


  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex justify-content-between">

       <div class="logo d-flex align-items-center">
    <a href="/" class="d-flex align-items-center text-decoration-none">
        <img src="/resources/images/logo3.png" width="95px" alt="" class="img-fluid me-2">
        <h1 class="text-dark mb-0">ekgkarlsruhe</h1>
    </a>
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
			    <a href="/users/create" >
			        <button type="button" class="btn btn-outline-primary btn-sm">Sign up</button>
			    </a>
			    <a href="/login" >
			        <button type="button" class="btn btn-outline-danger btn-sm">Login</button>
			    </a>
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
  
  

<br><br><br>
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>관리자 페이지</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>관리자 페이지</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up">
              <div class="icon"><i class="bi bi-briefcase"></i></div>
              <h4 class="title"><a href="">메인 사진 관리</a></h4>
              <p class="description">메인 화면 사진 수정 가능합니다</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
              <div class="icon"><i class="bi bi-card-checklist"></i></div>
              <h4 class="title"><a href="/users/memberList">회원 목록</a></h4>
              <p class="description">회원 목록/삭제/수정</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
              <div class="icon"><i class="bi bi-bar-chart"></i></div>
              <h4 class="title"><a href="/notice/create">공지사항</a></h4>
              <p class="description">공지사항 등록/수정 /삭제 가능합니다</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
              <div class="icon"><i class="bi bi-binoculars"></i></div>
              <h4 class="title"><a href="/weekly/create">주보 </a></h4>
              <p class="description">주보  등록/수정 /삭제 가능합니다</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
              <div class="icon"><i class="bi bi-brightness-high"></i></div>
              <h4 class="title"><a href="/board/readList">자유 게시판</a></h4>
              <p class="description">가입한 회원들이 자유롭게 이용하는 게시판</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
              <div class="icon"><i class="bi bi-calendar4-week"></i></div>
              <h4 class="title"><a href="/photo/readList">포토 게시판</a></h4>
              <p class="description">교회 활동사진 등록 /수정/삭제 가능합니다</p>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Services Section -->
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

 