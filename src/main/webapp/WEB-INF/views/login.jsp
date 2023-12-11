<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/resources/users/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/users/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/users/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="/resources/users/css/style.css">

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Services - Flattern Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

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

  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <script>
  //발급 받은 키
  Kakao.init("9002a0b32ca8640494bf321fdd462010");

  function kakaologin() {
  	window.Kakao.Auth.login({
  		// 개발자 사이트에서 체크한 항목들과 반드시 일치해야 한다. 
  		scope:'profile_nickname, account_email, gender',
  		success: function (authObj) 
  			{window.Kakao.API.request({url:'/v2/user/me',
  			success:res => {
  				
  				const nickname = res.kakao_account.profile.nickname;
  				const email = res.kakao_account.email;
  				const gender = res.kakao_account.gender;
  				
  				console.log(nickname);
  				console.log(email);
  				console.log(gender);
  				
  				kakaoprocess(nickname, email, gender);
  				
  			}
  		});
  	}
  });
  }

  function kakaoprocess(nickname, email, gender) {

  	$.ajax({
  		type:"POST",
  		url:"/users/kakaocheck",
  		data:{
  			  uemail:email
  		},
  		beforeSend : function(xhr){
  			/* 스프링 시큐리티 설정으로 인해 전송 전에 헤더에 csrf값을 넣어야만한다.  */
  			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
  		},
  		success : function(result) {
  			alert("카카오 로그인 성공, 메인 화면으로 이동합니다.");
  		},
  		error : function(request, status, error){
  			alert("카카오 로그인 실패, 최초 한번 사이트 회원 가입을 하셔야 합니다.");
  			window.location.assign('/users/join');
  		}
  		
  	})
  	window.location.assign('/');
  }

  </script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
    <div class="bg order-1 order-md-2" style="background-image: url('/resources/users/images/bg_1.jpg');"></div>
    <div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <div class="mb-4">
              <h3>로그인</h3>
            </div>
            <form action="/login?${_csrf.parameterName}=${_csrf.token}" method="post">
              <div class="form-group first">
                <label for="username"></label>
                <input type="text" class="form-control" id="username"  name="username" placeholder="아이디">

              </div>
              <div class="form-group last mb-3">
                <label for="password"></label>
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
                
              </div>
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                  <input type="checkbox" checked="checked"/>
                  <div class="control__indicator"></div>
                </label>
                <span class="ml-auto"><a href="/users/findId" class="forgot-pass">아이디찾기</a></span> 
                <span class="ml-auto"><a href="/users/findPwView" class="forgot-pass">비밀번호 찾기</a></span> 
              </div>

              <input type="submit" value="Log In" class="btn btn-block btn-primary">

              <span class="d-block text-center my-4 text-muted">&mdash; or &mdash;</span>
              
              <div class="social-login">
               <a href="javascript:kakaologin()"><img src="/resources/images/kakao.png" class=" w-100 mb-3 h-20"></a>			   
                <a href="#" class="google btn d-flex justify-content-center align-items-center">
                  <span class="icon-google mr-3"></span> 구글 로그인
                </a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  
  
  </body>
</html>