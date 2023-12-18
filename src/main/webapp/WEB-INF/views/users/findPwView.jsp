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

    <link rel="stylesheet" href="/resources/users/css/findPwView.css" type="text/css">

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
  
  <main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>비밀번호 찾기</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>비밀번호 찾기</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

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
        <a href="/" type="button" class="button">취소</a>
        </div>
        </form>
        </div>
         <div class="text-center">
            <a class="small" href="/">메인페이지</a>
        </div>
    </div>
    </div>
    </main>
    <!-- Move the script to the end of the body or use DOMContentLoaded -->
     <!-- jQuery script -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!-- Your custom script -->
        
   <script type="text/javascript">
    $(document).ready(function() {
        $(".user").submit(function(event) {
            // Prevent the form from submitting in the default way
            event.preventDefault();

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
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function(result) {
                    alert("이메일 전송 성공");
                    
                    //로그인 페이지 이동
                    window.location.href = "/login";
                },
                error: function(request, status, error) {
                    alert("이메일 전송 실패: " + request.responseText);
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