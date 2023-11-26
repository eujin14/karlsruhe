<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function () {

    $("#pwUpdate").on("click", function () {
        var password = $("#password").val();
        var newPassword1 = $("#newPassword1").val();
        var newPassword2 = $("#newPassword2").val();

        // Validate current password
        if (password === "") {
            alert("현재 비밀번호를 입력해주세요");
            $("#password").focus();
            return false;
        }

        // Validate the new password
        if (newPassword1 === "") {
            alert("변경 비밀번호를 입력해주세요");
            $("#newPassword1").focus();
            return false;
        }

        // Validate confirm password
        if (newPassword2 === "") {
            alert("변경 비밀번호를 입력해주세요");
            $("#newPassword2").focus();
            return false;
        }

        // Check if new passwords match
        if (newPassword1 !== newPassword2) {
            alert("변경 비밀번호가 일치하지 않습니다.");
            $("#newPassword2").focus();
            return false;
        }

        var pwUpdateForm = {
        		
                password: password,
                newPassword1: newPassword1,
                newPassword2: newPassword2
            };
       

        $.ajax({
            type: "POST",
            url: "/users/pwCheck",
            data: JSON.stringify(pwUpdateForm),
            contentType: "application/json",
            beforeSend: function (xhr) {
                xhr.setRequestHeader('${_csrf.headerName}', '${_csrf.token}');
            },
            success: function (data) {
                if (data === 1) {
                	 // Password is correct, show confirmation alert
                      if (confirm("변경하시겠습니까?")) {
                        // If user confirms, submit the form
                        $("#pwUpdateForm").submit();
                    }
                } else {
                    // Password is incorrect, show alert
                    alert("현재 비밀번호가 올바르지 않습니다.");
                }
            },
            error: function (xhr, status, error) {
                // Handle other errors, if needed
                alert("서버 오류: " + status + " - " + error);
            }
        });
    });
});
</script>
</head>
<body>
  <form action="/users/pwUpdate?${_csrf.parameterName}=${_csrf.token}" method="post" id="pwUpdateForm" name="pwUpdateForm">
    <input type="hidden" id="username" name="username" value="${member.username}">
    <div class="col-sm-8 col-sm-offset-2">
      <div class="panel panel-default panel-margin-10">
        <div class="panel-body panel-body-content text-center">
          <p class="lead">Please enter the password you want to change.</p>
          <div class="form-group">
            <input type="password" name="password" id="password" class="form-control form-control-inline text-center" placeholder="현재 비밀번호" />
          </div>
          <div class="form-group">
            <input type="password" name="newPassword1" id="newPassword1" class="form-control form-control-inline text-center" placeholder="새로운 비밀번호" />
          </div>
          <div class="form-group">
            <input type="password" name="newPassword2" id="newPassword2" class="form-control form-control-inline text-center" placeholder="새로운비밀번호 확인" />
          </div>
          <button type="button" id="pwUpdate" name="pwUpdate" class="btn btn-primary">Change password</button> <a href="/member/memberDetail" class="btn btn-default" >Cancel</a>
        </div>
      </div>
    </div>
  </form>
</body>
</html>