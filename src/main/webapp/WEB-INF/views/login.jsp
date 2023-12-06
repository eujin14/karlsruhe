<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

  </head>
  <body>
  

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
                <span class="ml-auto"><a href="/users/findPwView" class="forgot-pass">비밀번호 찾기</a></span> 
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