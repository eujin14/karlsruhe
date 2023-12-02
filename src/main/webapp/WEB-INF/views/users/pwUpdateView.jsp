<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

 <script type="text/javascript">
$(document).ready(function(){
    $("#pwUpdate").on("click", function(){
        if ($("#password").val() == "") {
            alert("Please enter your current password");
            $("#password").focus();
            return false;
        }
        if ($("#password1").val() == "") {
            alert("Please enter the change password");
            $("#password1").focus();
            return false;
        }
        if ($("#password2").val() == "") {
            alert("Please enter the change password");
            $("#password2").focus();
            return false;
        }
        if ($("#password").val() !== $("#password2").val()) {
            alert("Change password does not match.");
            $("#password2").focus();
            return false;
        }

        $.ajax({
            url: "/users/pwCheck",
            type: "POST",
            dataType: "json",
            data: $("#pwUpdateForm").serializeArray(),
            success: function(data) {
                if (data == 0) {
                    alert("The password is incorrect.");
                    return;
                } else {
                    if (confirm("Do you want to change it?")) {
                        $("#pwUpdateForm").submit();
                    }
                }
            }
        });
    });
});
</script>
</head>
<body>
 <form action="/users/pwUpdate?${_csrf.parameterName}=${_csrf.token}" method="post" id="pwUpdateForm" name="pwUpdateForm">
                        <input type="hidden" name="username" value="${member.username}">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
                <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control form-control-inline text-center" placeholder="현재 비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" name="password1" class="form-control form-control-inline text-center" placeholder="새 비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" name="password2" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인" />
                </div>
                <button type="button" id="pwUpdate" name="pwUpdate" class="btn btn-primary">비밀번호 변경</button> <a href="/users/memberDetail" class="btn btn-default">취소</a>
            </div>
        </div>
    </div>
    </form>
</body>
</html>