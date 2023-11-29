<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD

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

    <title>Login #6</title>
  </head>
  <body>
  

  <div class="d-lg-flex half">
    <div class="bg order-1 order-md-2" style="background-image: url('/resources/users/images/bg_1.jpg');"></div>
    <div class="contents order-2 order-md-1">

      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7">
            <div class="mb-4">
              <h3>Sign In</h3>
              <p class="mb-4">Lorem ipsum dolor sit amet elit. Sapiente sit aut eos consectetur adipisicing.</p>
            </div>
            <form action="/login?${_csrf.parameterName}=${_csrf.token}" method="post">
              <div class="form-group first">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username"  name="username">

              </div>
              <div class="form-group last mb-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password">
                
              </div>
              
              <div class="d-flex mb-5 align-items-center">
                <label class="control control--checkbox mb-0"><span class="caption">Remember me</span>
                  <input type="checkbox" checked="checked"/>
                  <div class="control__indicator"></div>
                </label>
                <span class="ml-auto"><a href="/users/findId" class="forgot-pass">아이디찾기</a></span> 
                <span class="ml-auto"><a href="/users/findPw" class="forgot-pass">비밀번호 찾기</a></span> 
              </div>

              <input type="submit" value="Log In" class="btn btn-block btn-primary">

              <span class="d-block text-center my-4 text-muted">&mdash; or &mdash;</span>
              
              <div class="social-login">
                <a href="#" class="facebook btn d-flex justify-content-center align-items-center">
                  <span class="icon-facebook mr-3"></span> 네이버 로그인
                </a>
                <a href="#" class="twitter btn d-flex justify-content-center align-items-center">
                  <span class="icon-twitter mr-3"></span> 카카오 로그인
                </a>
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
=======
<!doctype html>
<html lang="en">
  <head>
  	<title>Login 10</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="/resources/logincss/style.css">

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

	</head>
	<body class="img js-fullheight" style="background-image: url(/resources/images/bg.jpg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">로그인</h3>
		      	<form class="signin-form" action="/login" method="post">
		      		<div class="form-group">
		      			<input type="text" class="form-control" name="username" placeholder="아이디" required>
		      		</div>
	            <div class="form-group">
	              <input id="password-field" type="password" name="password" class="form-control" placeholder="비밀번호" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
	            <div class="form-group">
	            	<button type="submit" class="form-control btn btn-primary submit px-3">로그인</button>
	            </div>
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	            
	            </form>
	            <div class="form-group d-md-flex">
	            	<div class="w-50 text-md-left">
									<a href="#" style="color: #fff">아이디 찾기</a>
								</div>
								<div class="w-50 text-md-right">
									<a href="#" style="color: #fff">비밀번호 찾기</a>
								</div>
	            </div>
	          
	          <p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>
	          <div class="social d-flex text-center">
	          	<a href="#" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> 카카오 로그인</a>
	          	<a href="#" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span> 구글 로그인</a>
	          </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="/resources/js/jquery.min.js"></script>
  <script src="/resources/js/popper.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/main.js"></script>

	</body>
</html>

>>>>>>> origin/sunghee
