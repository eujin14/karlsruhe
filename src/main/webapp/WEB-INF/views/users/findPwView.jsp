<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
   
    <title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
    <div class="p-5">
        <div class="text-center">
            <h1 class="h4 text-gray-900 mb-2">비밀번호 찾기</h1>
            <p class="mb-4">아이디와 이메일을 입력해주세요!</p>
        </div>
        <form class="user" action="/users/findPw?${_csrf.parameterName}=${_csrf.token}" method="post">
            <div class="form-group">
                <input type="text" class="form-control form-control-user"
                    id="username" aria-describedby="IdHelp" name="username"
                    placeholder="Enter ID....">
            </div>
            <div class="form-group">
                <input type="email" class="form-control form-control-user"
                    id="uemail" aria-describedby="emailHelp" name="uemail"
                    placeholder="Enter Email Address...">
            </div>
            <button type="submit" id="myButton" class="btn btn-primary btn-user btn-block">
             전송하기
            </button>
        </form>
        <hr>
        <a href="/login" class="btn btn-google btn-user btn-block">
            Login
        </a>
        <hr>
        <div class="text-center">
            <a class="small" href="/main">메인페이지</a>
        </div>
    </div>

    <!-- Move the script to the end of the body or use DOMContentLoaded -->
     <!-- jQuery script -->
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <!-- Your custom script -->
        <script type="text/javascript" th:inline="javascript">
            $(document).ready(function() {
                $("#findPwButton").click(function() {
                    var username = $("#username").val();
                    var uemail = $("#uemail").val();
                    var csrfToken = $("#_csrf").attr("content");

                    $.ajax({
                        type: "POST",
                        url: "/users/findPw",
                        data: {
                            username: username,
                            uemail: uemail
                        },
                        headers: {
                            "X-CSRF-TOKEN": csrfToken
                        },
                        success: function(data) {
                            // Handle success
                        },
                        error: function(xhr, status, error) {
                            // Handle error
                        }
                    });
                });
            });
        </script>
    </div>
</body>
</html>