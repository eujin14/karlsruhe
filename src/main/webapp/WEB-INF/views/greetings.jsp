<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>About - Flattern Bootstrap Template</title>
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

      <div class="logo">
        <h1 class="text-light"><a href="/main">ekgkarlsruhe</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="/resources/assets/img/logo.png" alt="" class="img-fluid"></a>-->
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
           <a class="nav-link" href="admin/admin" role="button"  aria-haspopup="true"><span class="uil fs-0 me-2" data-feather="user"></span>관리자전용</a>
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

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>인사말</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>인사말</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= About Us Section ======= -->
    <section id="about-us" class="about-us">
      <div class="container">

        <div class="row no-gutters">
          <div class="image col-xl-5 d-flex align-items-stretch justify-content-center justify-content-lg-start" data-aos="fade-right"></div>
          <div class="col-xl-7 ps-0 ps-lg-5 pe-lg-1 d-flex align-items-stretch">
            <div class="content d-flex flex-column justify-content-center">
              <h3 data-aos="fade-up">목사님의 인사말</h3>
              <p data-aos="fade-up">
              <br>
					               샬롯!  <br><br>
					칼스루에 한인교회를 방문하여 주셔서 감사합니다.<br>
					칼스루에 한인교회는 1975년 칼스루에 도시에 뿌리를 내리신
					한인분들의 믿음과 헌신을 통해 세워진 공동체입니다.
					하나님의 은혜로 지난 50여년간 칼스루에 지역의 한인사회를
					복음으로 섬기는 믿음의 공동체로 성장해 왔습니다.
					우리 교회는 하나님을 향한 예배와 이웃을 향한 섬김을 통해, 
					세상의 빛과 소금의 역할을 감당하는 아름다운 교회입니다.
					이제는 코로나라는 고난의 시간을 지나서,
					다음세대를 위한 교회학교와, 내가 받은 달란트를 드리는 헌신으로, 
					아름다운 예배를 드리기 위하여 온성도가 한 마음으로 충성하고 있습니다.
					하나님을 예배하기 원하는 모든 사람들을
					진심으로 환영합니다.<br>
					<br>
					담임목사 김두식
					              </p>
            </div><!-- End .content-->
          </div>
        </div>

      </div>
    </section><!-- End About Us Section -->


  </main><!-- End #main -->

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