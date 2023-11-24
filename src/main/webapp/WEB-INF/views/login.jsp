<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en" >

<head>
<meta charset="UTF-8">
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">
<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>
<title>로그인</title>
<link rel="canonical" href="https://codepen.io/Rh2o/pen/yLgxJoG">
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css'>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> 


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
  			window.location.assign('/login2');
  		}
  		
  	})
  	window.location.assign('/main');
  }

  </script>
  

  <script>
function checkMember() {

	var regExpUsername = /^[a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
    var regExpUname = /^[가-힣]*$/;
    var regExpPasswd = /^[0-9]*$/;
    var regExpTel = /^\d{3}-\d{3,4}-\d{4}$/;
    var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    
    
    var username = document.getElementById("username").value;
    var uname = document.getElementById("uname").value;
    var password = document.getElementById("password").value;
    var password2 = document.getElementById("password2").value;
    var utel = document.getElementById("utel").value;
    var uemail = document.getElementById("uemail").value;



    if (!regExpUsername.test(username)) {
        alert("아이디는 문자로 입력하세요");
        return false;
    }
   
    if (!regExpUname.test(uname)) {
        alert("이름은 한글만 입력해주세요");
        return false;
    }
    
    if (!regExpPasswd.test(password)) {
        alert("비밀 번호는 숫자만 입력해주세요!!");
        return false;
    }
    
    if (password !== password2) {
        alert("비밀번호가 일치하지 않습니다.");
        return false;
     }

    
    if (!regExpTel.test(utel)) {
        alert("연락처를 입력해주세요");
        return false;
    }
    
    
    if (!regExpEmail.test(uemail)) {
        alert("이메일을 입력해 주세요");
        return false;
    }
    
  
    document.Member.submit();

}


</script>
  
  <link rel="stylesheet" href="/resources/users/css/login.css" type="text/css">
</head>

<body translate="no">


<!--   회원가입 -->
<div class="container" id="container">
	<div class="form-container sign-up-container">
		<form action="/users/create?${_csrf.parameterName}=${_csrf.token}" name="Member" method="post">
			<h1>회원가입</h1>
			
			<input type="text" name="uname" placeholder="이름" />
			<input type="text" name="username" placeholder="아이디 " />
			<input type="password" name="password" placeholder="비밀번호" />
            <input type="password" name="password2" placeholder="비밀번호 확인" />
            <input type="email" name="uemail" placeholder="이메일" />
			<input type="text" class="input1" name="utel" id="utel" placeholder="휴대폰번호 010-0000-0000">	
             <input type="text" name="uaddr" placeholder="주소" />
			<button class="btn btn-primary w-100 mb-3" type="submit" value="회원가입" onclick="checkMember()" >회원 가입</button>
		</form>
	</div>
	<!--로그인  -->
	<div class="form-container sign-in-container">
		<form action="/login?${_csrf.parameterName}=${_csrf.token}" method="post">
			<h1>로그인</h1>
			<div class="social-container">
				<a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
				<a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
				<a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
			</div>
			
			<input type="text" name="username" placeholder="아이디" />
			<input type="password" name="password" placeholder="비밀번호" />
			<a href="/findId">아이디 찾기</a>
			<a href="/findPw" id="findPw">비밀번호 찾기</a>
			<button>로그인</button>
			
			<div>
			<a href="/naverlogin" class="naver_id_login" id="naver_id_login"></a>
            <a href="javascript:kakaologin()" class="kakaologin-button"><img src="/images/kakao_login_medium_narrow.png" width="140" height="31"/></a>
			</div>
		</form>
	</div>
	<div class="overlay-container">
		<div class="overlay">
			<div class="overlay-panel overlay-left">
				<h1>Welcome Back!</h1>
				<p>우리와 함께 하시려면 로그인을 해주세요!</p>
				<button class="ghost" id="signIn">로그인</button>
			</div>
			<div class="overlay-panel overlay-right">
				<h1>Hello, Friend!</h1>
				<p>개인 정보를 입력하고 우리와 함께 여행을 시작하세요!</p>
				<button class="ghost" id="signUp">회원가입</button>
			</div>
		</div>
	</div>
</div>
  
<script id="rende#5fcf80-js" >
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () => {
  container.classList.add("right-panel-active");
});

signInButton.addEventListener('click', () => {
  container.classList.remove("right-panel-active");
});
//# sourceURL=pen.js
</script>

<script>
(function() {
	if ('[[${signup}]]' == 'signup') {
		container.classList.add("right-panel-active");
	}
})();

</script>


<script type="text/javascript">
  	var naver_id_login = new naver_id_login("iLOq0jmNxfE8ndYISkE4", "http://localhost:8080/naverlogin");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3, 30);
  	naver_id_login.setDomain("http://localhost:8080");
  	naver_id_login.setState(state);
  	
  	naver_id_login.init_naver_id_login();
</script>

  
<script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-44fe83e49b63affec96918c9af88c0d80b209a862cf87ac46bc933074b8c557d.js"></script>
</body>

</html>
