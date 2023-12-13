<!-- 
name : yu jin KIM
date : 2023/09/29
mail : gkdlel9254 @ gmail.com 
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>

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
  
  

  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>login</title>


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="resources/public/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="resources/public/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="resources/public/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/images/logo8.ico">
    <link rel="manifest" href="resources/public/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="resources/public/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="resources/public/vendors/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="resources/public/vendors/simplebar/simplebar.min.js"></script>
    <script src="resources/public/assets/js/config.js"></script>


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link href="resources/public/vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link href="resources/public/assets/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl">
    <link href="resources/public/assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
    <link href="resources/public/assets/css/user-rtl.min.css" type="text/css" rel="stylesheet" id="user-style-rtl">
    <link href="resources/public/assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
    <script>
      var phoenixIsRTL = window.config.config.phoenixIsRTL;
      if (phoenixIsRTL) {
        var linkDefault = document.getElementById('style-default');
        var userLinkDefault = document.getElementById('user-style-default');
        linkDefault.setAttribute('disabled', true);
        userLinkDefault.setAttribute('disabled', true);
        document.querySelector('html').setAttribute('dir', 'rtl');
      } else {
        var linkRTL = document.getElementById('style-rtl');
        var userLinkRTL = document.getElementById('user-style-rtl');
        linkRTL.setAttribute('disabled', true);
        userLinkRTL.setAttribute('disabled', true);
      }
    </script>
    
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    
  </head>


  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <form class="form-signin" action="/login" method="post">
    <main class="main" id="top">
      <div class="container">
        <div class="row flex-center min-vh-100 py-5">
          <div class="col-sm-10 col-md-8 col-lg-5 col-xl-5 col-xxl-3"><a class="d-flex flex-center text-decoration-none mb-4" href="resources/public/index.html">
              <div class="d-flex align-items-center fw-bolder fs-5 d-inline-block"><img src="/resources/images/logo7.png" alt="phoenix" class=" w-100 mb-3" />
              </div>
            </a>
            <div class="text-center mb-7">
              
              <!-- <p class="text-700">Get access to your account</p> -->
            </div>
             
             <div class="social-content">
        		<div class="naverFrm">
        			<div id="naverIdLogin" style="text-align: center;"></div>
        		</div>
        	</div>

<!-- <!-- 	  네이버 로그인 버튼 노출 영역
  <div id="naver_id_login"></div>
  //네이버 로그인 버튼 노출 영역
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("oZr42e9Araza1IjScqwg", "http://localhost:8080/callback");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 1,50);
  	naver_id_login.setDomain("http://localhost:8080/login");
  	naver_id_login.setState(state);
  	
  	naver_id_login.init_naver_id_login();
  </script> --> 
		 
	 
            <div class="position-relative">
              <hr class="bg-200 mt-5 mb-4" />
              <div class="divider-content-center">로그인</div>
            </div>
            <div class="mb-3 text-start">
              <label class="form-label" for="username">아이디</label>
              <div class="form-icon-container">
                <input class="form-control form-icon-input" id="username" type="text" name="username" placeholder="아이디를 입력하세요" /><span class="fas fa-user text-900 fs--1 form-icon"></span>
              </div>
            </div>
            <div class="mb-3 text-start">
              <label class="form-label" for="password">비밀번호</label>
              <div class="form-icon-container">
                <input class="form-control form-icon-input" id="password" type="password" name="password" placeholder="비밀 번호를 입력하세요" /><span class="fas fa-key text-900 fs--1 form-icon"></span>
              </div>
            </div>
             <br><br>
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button class="btn btn-primary w-100 mb-3">로그인</button>
            <p><a href="javascript:kakaologin()"><img src="/resources/images/kakao.png" class=" w-100 mb-3 h-20"></a>
            </form>
            <div class="text-center"><a class="fs--1 fw-bold" href="/users/join">회원 가입</a></div>
          </div>
        </div>
      </div>
     
     
    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->


     


    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="resources/public/vendors/popper/popper.min.js"></script>
    <script src="resources/public/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="resources/public/vendors/anchorjs/anchor.min.js"></script>
    <script src="resources/public/vendors/is/is.min.js"></script>
    <script src="resources/public/vendors/fontawesome/all.min.js"></script>
    <script src="resources/public/vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="resources/public/vendors/list.js/list.min.js"></script>
    <script src="resources/public/vendors/feather-icons/feather.min.js"></script>
    <script src="resources/public/vendors/dayjs/dayjs.min.js"></script>
    <script src="resources/public/assets/js/phoenix.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

  </body>

</html>