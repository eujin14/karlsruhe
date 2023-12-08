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
          <h2>Testimonials</h2>
          <ol>
            <li><a href="index.html">Home</a></li>
            <li>Testimonials</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials">
      <div class="container">

        <div class="row">

          <div class="col-lg-6" data-aos="fade-up">
            <div class="testimonial-item">
              <img src="assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
              <h3>2017년 – 현재 Knielingenkirche 교회</h3>
              <p>
              <ul>
                 <li>﻿2022년 10월 코로나 이후 간략화된 예전 복원</li>
                <li>﻿2021년 6월 김두식 목사 담임목사 취임</li>
                <li>﻿2021년 2월 김두식 목사 주일 설교 전담</li>
                <li>﻿2020년 11월30일 김성호 목사 사임</li>
                <li>﻿2017년 10월 예배처소를 ﻿Knielingen Kirche Gemeindezentrum으로 옮김.</li>
             </ul>
              </p>
            </div>
          </div>

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
            <div class="testimonial-item mt-4 mt-lg-0">
              <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
              <h3>2000년 – 2016년 Jacobuskirche 교회</h3>
              <p>
                <ul>
                <li>﻿2010년 11월 18일 E.V. 등록</li>
                <li>﻿2010년 4월 대한기독교장로회 김성호 목사 담임목사 취임</li>
                <li>﻿2010년 3월  손창근 목사 사임</li>
                <li>﻿2004년 1월 손창근 목사 담임목사 취임</li>
                <li>﻿2003년 12월 손창근 목사 주일설교 전담</li>
                <li>﻿﻿2001년 1월  강태영 목사 담임목사 취임</li>
                <li>﻿﻿﻿2000년 3월 예배처소를 Jacobus Kirche로 옮김</li>
              </ul>
              </p>
            </div>
          </div>

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
            <div class="testimonial-item mt-4">
              <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
              <h3>﻿1992년 – 1999년 Lukaskirche 교회</h3>

              <p>
               <ul>
                <li>﻿1999년 11월  강태영 목사 주일설교 전담 </li>
                <li>﻿1996년 12월 기독교대한감리회 임재훈 목사 부임 </li>
                <li>﻿1996년 지역 한인교회인 경향교회와 통합</li>
                <li>﻿1992년 8월 예배처소를 미군부대 Chapel에서 Lukaskirche로 옮김 </li>
                <li>﻿992년 3월 신성국 목사 부임</li>
              </ul>
              </p>
            </div>
          </div>

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="300">
            <div class="testimonial-item mt-4">
              <img src="assets/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
              <h3>﻿﻿1975-1991년 칼스루에 한인교회 설립 및 정착기</h3>
              <p>
                <ul>
                <li>﻿1991년 10월 대한예수교장로회 통합측 이성휘 목사 부임</li>
                <li>﻿﻿1989년 3월 대한예수교장로회 통합측 김도훈 목사 부임</li>
                <li>﻿1988년 4월 대한예수교장로회 통합측 문성호 목사 부임</li>
                <li>﻿﻿1987년 11월 조병하 목사 부임</li>
                <li>﻿﻿1985년 5월 오재성 전도사 부임</li>
                </ul>
              </p>
            </div>
          </div>

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="400">
            <div class="testimonial-item mt-4">
              <img src="assets/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
              <h3>1975-1991년 칼스루에 한인교회 설립 및 정착기</h3>
              <p>
              <ul>
                <li>﻿1984년 지역 한인 학생교회와 통합</li>
                <li>﻿1983년 12월  이신건 전도사 부임</li>
                <li>﻿﻿1981년 11월 김희성 목사 부임</li>
                <li>﻿﻿﻿﻿1981년 11월 예배처소로 미군부대 Chapel을 사용 </li>
                </ul>
              </p>
            </div>
          </div>

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="500">
            <div class="testimonial-item mt-4">
              <img src="assets/img/testimonials/testimonials-6.jpg" class="testimonial-img" alt="">
              <h3>EKGKARLSRUHE</h3>
              <p>
                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
				   1975년 6월 20일 하이델베르크 주둔 미군 군목인 이정일 목사님을 모시고 가정교회로 시작               
				 <i class="bx bxs-quote-alt-right quote-icon-right"></i>
              </p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Testimonials Section -->

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