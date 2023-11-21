<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="/resources/joinfonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="/resources/joincss/style.css">
    
</head>
<body>

    <div class="main">

        <div class="container">
            <form action="/users/join?${_csrf.parameterName}=${_csrf.token}" name="Member" method="POST" class="appointment-form" id="appointment-form">
                <h2>회원가입</h2>
                <div class="form-group-1"> 
                    <input type="text" name="username" id="username" placeholder="아이디" required />
                    <input type="text" name="password" id="password" placeholder="비밀번호" required />
                    <input type="password" name="password1" id="password1" placeholder="비밀번호 확인" required />
                    <input type="text" name="uname" id="uname" placeholder="이름"  />
                    <input type="email" name="uemail" id="uemail" placeholder="이메일을 작성해 주세요"  />
                    <input type="text" name="utel" id="utel" placeholder="전화번호"  />
                    <input type="text" name="utel" id="utel" placeholder="인증번호"  />
                    <input type="text" name="uaddr" id="uaddr" placeholder="주소"  />
                    
                </div>
                <div class="form-submit">
                    <input type="submit" name="submit" id="submit" class="submit" value="회원가입" />
                </div>
            </form>
        </div>

    </div>

    <!-- JS -->
    <script src="/resourcesvendor/jquery/jquery.min.js"></script>
    <script src="/resources/joinjs/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>