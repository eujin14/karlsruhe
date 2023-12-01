<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <!-- Spring security로 인한 csrf 토큰 -->
    <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

    <title>비밀번호 찾기</title>

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
             Find PW
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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <!-- <script type="text/javascript">
    $(document).ready(function() {
        $("#findPwForm").submit(function(event) {
            event.preventDefault(); // Prevent the form from submitting

            var formData = $("#findPwForm").serialize();
            
            $.ajax({
                type: "POST",
                url: "/users/findPw",
                data: formData,
                success: function(data) {
                    // Handle the success response, e.g., show a success message
                    alert("임시메일이 전송되었습니다.!");
                },
                error: function(error) {
                    // Handle the error response, e.g., show an error message
                    alert("Error: " + error.responseText);
                }
            });
        });
    });
</script> -->
</body>
</html>