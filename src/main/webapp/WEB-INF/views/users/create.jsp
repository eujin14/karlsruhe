<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
   <head>
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
  

  <div class="d-lg-flex half">
   <div class="bg order-1 order-md-2" style="background-image: url('/resources/users/images/bg_1.jpg');"></div> 
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