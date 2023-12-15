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
 
    
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    
        <link rel="stylesheet" href="/resources/users/css/create.css" type="text/css">
    
    
  </head>


  <body>
 <br><br>
 
 <main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>로그인</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>로그인</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    
    <br>
         <div class="content d-flex justify-content-center align-items-center">
       
          <div class="col-sm-10 col-md-8 col-lg-5 col-xl-5 col-xxl-3">
              <div class="d-flex align-items-center fw-bolder fs-5 d-inline-block">
              </div>
            
            <div class="text-center mb-7">
              <div class="position-relative">
              <div class="divider-content-center"><h2>로그인</h2></div>
            </div>
              <!-- <p class="text-700">Get access to your account</p> -->
            </div>
             
           <form class="form-signin" action="/login" method="post">
      
            <div class="mb-3 text-start">
              <label class="form-label" for="username"><span class="fas fa-user text-900 fs--1 form-icon"></span>아이디</label>
              <div class="form-icon-container">
                <input class="form-control form-icon-input" id="username" type="text" name="username" placeholder="아이디를 입력하세요" />
              </div>
            </div>
            <div class="mb-3 text-start">
              <label class="form-label" for="password"><span class="fas fa-key text-900 fs--1 form-icon"></span>비밀번호</label>
              <div class="form-icon-container">
                <input class="form-control form-icon-input" id="password" type="password" name="password" placeholder="비밀 번호를 입력하세요" />
              </div>
            </div>
              <a href="/users/findId" >아이디찾기</a>
               &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
              <a href="/findPwView" >비밀번호 찾기</a>
             <br><br>
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button class="btn btn-primary w-100 mb-3">로그인</button>
            <a href="/" >
			<button type="button" class="btn btn-outline-success btn-sm w-100 mb-3">취소</button>
			</a>
            <p><a href="javascript:kakaologin()"><img src="/resources/images/kakao.png" class=" w-100 mb-3 h-20"></a>
            </form>
      
      </div>
      </div>
</div>
</main>
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
  			window.location.assign('/create');
  		}
  		
  	})
  	window.location.assign('/');
  }

  </script>
  <br><br>
      <script src="/resources/assets/js/main.js"></script>

  </body>

</html>