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
  
    <link rel="stylesheet" href="/resources/users/css/create.css" type="text/css">
  

  <script>
function checkMember() {
	var regExpUsername = /^[a-zA-Z가-힣0-9]+$/;
    var regExpUname = /^[a-zA-Z가-힣]+$/;
    var regExpPasswd = /^[a-zA-Z가-힣0-9]+$/;
    var regExpTel = /^(\+\d{1,4}-)?(\d{1,4}-)?\d{1,14}$/;
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
  <br><br>
  <main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>회원가입</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>회원가입</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
  
<br>
    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
       <div class="content d-flex justify-content-center align-items-center">
       
          <div class="col-sm-10 col-md-8 col-lg-5 col-xl-5 col-xxl-3">
              <div class="d-flex align-items-center fw-bolder fs-5 d-inline-block">
              </div>
            
            <div class="text-center mb-7">
              <div class="position-relative">
              <div class="divider-content-center"><h2><span class="fas fa-user text-900 fs--1 form-icon"></span>회원가입</h2></div>
            </div>
              <!-- <p class="text-700">Get access to your account</p> -->
            </div>
             
            <br>
            <form action="/create?${_csrf.parameterName}=${_csrf.token}"  name="Member" method="post" onsubmit="return checkMember()">
            <div class="mb-3 text-start">
              <div class="form-icon-container">
                <input class="form-control form-icon-input" id="username" type="text" name="username" placeholder="아이디를 입력하세요" />
              </div>
            </div>
            <div class="row">
                <div class="col-md-6 text-start">
                <input class="form-control" id="password" name="password" type="password" placeholder="비밀번호" />
                </div>

                <div class="col-md-6 text-start">
                 <input class="form-control" id="password2" name="password2" type="password" placeholder="비밀번호 확인" />
                 </div>
            </div>
            
            <br>
	             <div class="mb-3 text-start">
	             <div class="form-icon-container">
	                 <input class="form-control" id="uname" type="text" name="uname" placeholder="이름을 입력하세요" />
	             </div>
                 </div> 				                     
                        
                 <div class="mb-3 text-start">
                 <div class="form-icon-container">
                    <input class="form-control" id="utel" name="utel" type="text" placeholder="연락처를 입력하세요" />
                  </div>
                  </div> 
                     
                   <div class="mb-3 text-start">
                      <input class="form-control" id="uemail" name="uemail" type="text" placeholder="카카오 연동된 이메일을 작성해 주세요" />
                    </div>
                    <div class="mb-3 text-start">
                       <input class="form-control" id="uaddr" name="uaddr" type="text" placeholder="주소를 입력하세요" />
                     </div>
                     
                      <button class="btn btn-primary w-100 mb-3" type="submit" value="회원가입" onclick="checkMember()" >회원 가입</button>
                       <a href="/" >
			          <button type="button" class="btn btn-outline-success btn-sm w-100 mb-3">취소</button>
			         </a>
                      </form>
      
      </div>
      </div>

<br>
</main>
      <script src="/resources/assets/js/main.js"></script>

  </body>

</html>