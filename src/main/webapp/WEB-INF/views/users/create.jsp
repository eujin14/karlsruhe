<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
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

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  

    <link rel="stylesheet" href="/resources/users/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/users/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/users/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="/resources/users/css/style.css">
    
    <style>
  /* Add this style block to your HTML, either in the head or in a separate stylesheet */

  .form-group.last {
    margin-bottom: 1rem; /* You can adjust this margin to control the vertical space between form groups */
  }

  input.form-control {
    height: 2rem; /* Adjust the height to your preference */
  }

  button.btn.btn-primary {
    height: 2rem; /* Adjust the height of the button to match the input fields */
  }
</style>
    
  <script>
function checkMember() {
    var regExpUsername = /^[a-zA-Z가-힣]+$/;
    var regExpUname = /^[가-힣]+$/;
    var regExpPasswd = /^[0-9]+$/;
    var regExpTel = /^\d{3}-\d{3,4}-\d{4}$/;
    var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

    var username = document.getElementById("username").value.trim();
    var uname = document.getElementById("uname").value.trim();
    var password = document.getElementById("password").value.trim();
    var password2 = document.getElementById("password2").value.trim();
    var utel = document.getElementById("utel").value.trim();
    var uemail = document.getElementById("uemail").value.trim();

    if (!regExpUsername.test(username)) {
        alert("아이디는 영문과 한글로만 입력해주세요.");
        return false;
    }

    if (!regExpUname.test(uname)) {
        alert("이름은 한글로만 입력해주세요.");
        return false;
    }

    if (!regExpPasswd.test(password)) {
        alert("비밀번호는 숫자만 입력해주세요.");
        return false;
    }

    if (password !== password2) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
    }

    if (!regExpTel.test(utel)) {
        alert("올바른 연락처를 입력하세요. (XXX-XXXX-XXXX).");
        return false;
    }

    if (!regExpEmail.test(uemail)) {
        alert("유효한 이메일 주소를 입력하세요.");
        return false;
    }

    document.forms["Member"].submit();
}
</script>
  
    
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

  <div class="d-lg-flex half">
   <div class="bg order-1 order-md-2 " style="background-image: url('/resources/users/images/bg_1.jpg');"></div> 
    <div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <div class="mb-4">
              <h3>회원가입</h3>
              <p class="mb-4">회원가입을 환영합니다</p>
            </div>
            <form action="/users/create?${_csrf.parameterName}=${_csrf.token}"  name="Member" method="post" onsubmit="return checkMember()">
            
            <div class="form-group last mb-3">
                <input type="text" class="form-control" id="username" name="username" placeholder="아이디">
              </div>

              <div class="form-group last mb-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
                
              </div>
    
             <div class="form-group last mb-3">
                <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
                
              </div>
               <div class="form-group last mb-3">
                <input type="text" class="form-control" id="uname" name="uname" placeholder="이름">
                
              </div>
              
              <div class="form-group last mb-3">
                <input type="email" class="form-control" id="uemail" name="uemail" placeholder="이메일">
                
              </div>
              
              <div class="form-group last mb-3">
                <input type="text" class="form-control" id="utel" name="utel" placeholder="전화번호">
                
              </div>
              
                <div class="form-group last mb-3">
                <input type="text" class="form-control" id="uaddr" name="uaddr" placeholder="주소">
                
              </div>
              <button class="btn btn-primary w-100 mb-3" type="submit" value="회원가입" onclick="checkMember()" >회원 가입</button>

            </form>
          </div>
        </div>
      </div>
    </div>

    
  </div>
    
     
  </body>
</html>