<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <!-- Spring security로 인한 csrf 토큰 -->
    <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

    <title>비밀번호 찾기</title>

    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <!-- jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

 
<!-- 페이지 개별 적용 css -->
    <link rel="stylesheet" href="/resources/users/css/find.css" type="text/css">
</head>
<body>
<section class="find">
    <div class="find_box">
        <div class="contact">
            <form class="userForm">
                <div class="justify-content-center formHeader">
                    <a id="findIdForm" href="/users/findId"><h3>아이디 찾기</h3></a>
                    <a id="findPwForm" href="/users/findPw"><h3>비밀번호 찾기</h3></a>
                    <hr>
                </div>
                <div class="inputForm">
                    <input name="username" type="text" id="username" placeholder="아이디">
                    <input name="uname" type="text" id="uname" placeholder="이름">
                    <input name="utel" type="text" id="utel" placeholder="전화번호 (010-0000-0000)">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <div class="BtnGroup">
                        <button type="button" class="submit" id="findPwBtn">비밀번호 찾기</button>
                        <a href="/login" type="button" class="button">취소</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<!-- 모달 창 -->
<div class="modal" id="findPwModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">비밀번호 찾기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modalContent">
            </div>
            <div class="modal-footer" id="modalBtn">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<!-- 페이지 개별 적용 js -->
<script type="text/javascript">
    //findPw 제출 시 처리 (modal 생성 후 띄우기)
    $('#findPwBtn').on('click', function () {
        var username = $('#username').val();
        var name = $('#uname').val();
        var tel = $('#utel').val();

        $.ajax({
            type: "POST",
            url: "/users/findPw",
            data: {
                name: name,
                tel: tel,
                username: username
            },
            dataType: 'text',
            beforeSend: function (jqXHR, settings) {
                var header = $("meta[name='_csrf_header']").attr("content");
                var token = $("meta[name='_csrf']").attr("content");
                jqXHR.setRequestHeader(header, token);
            },
            success: function (result) {
                if (result != null && result != "") {
                    // Modal 내용을 form으로 생성
                    $("#modalContent").html("<form id=\"pwUpdateForm\">\n" +
                        "<div>새로 사용할 비밀번호를 입력해주세요.</div>" +
                        "<input name=\"password\" type=\"password\" id=\"password\" placeholder=\"비밀번호\"><br>" +
                        "<input name=\"ChkPassword\" type=\"password\" id=\"ChkPassword\" placeholder=\"비밀번호 확인\">" +
                        "<input type=\"hidden\" name=\"${_csrf.parameterName}\" value=\"${_csrf.token}\" />\n" +
                        "</form>");
                    $("#modalBtn").html("<button type=\"button\" class=\"btn btn-secondary\" id=\"updatePwBtn\">비밀번호 변경</button>\n" +
                        "<button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">닫기</button>");

                    // Move the following block outside the 'click' event handler
                    // Bind the 'click' event handler for the "Change Password" button
                    $('#updatePwBtn').on('click', function () {
                        var newPassword = $('#password').val();
                        var confirmedPassword = $('#ChkPassword').val();

                        // Ensure that newPassword is not empty before proceeding
                        if (newPassword.trim() === "") {
                            // Handle the case where newPassword is empty
                            console.log("New password is empty");
                            return;
                        }

                        if (newPassword === confirmedPassword) {
                            // Proceed with the password change
                            $.ajax({
                                type: "POST",
                                url: "/users/updatePw",
                                data: {
                                    username: username,
                                    password: newPassword,
                                    Chkpassword: confirmedPassword
                                },
                                dataType: 'text',
                                beforeSend: function (jqXHR, settings) {
                                    var header = $("meta[name='_csrf_header']").attr("content");
                                    var token = $("meta[name='_csrf']").attr("content");
                                    jqXHR.setRequestHeader(header, token);
                                },
                                success: function (updateResult) {
                                    if (updateResult === "success") {
                                        // 비밀 번호 변경 성공시 login 페이지로 이동
                                        location.replace("/login");
                                    } else {
                                        // Show an error message
                                        $("#modalContent").html("<p>비밀번호 변경에 실패했습니다. 다시 시도해주세요.</p>");
                                    }
                                },
                                error: function (request, status, error) {
                                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                                }
                            });
                        } else {
                            // Passwords do not match
                            $("#modalContent").html("<p>입력한 비밀번호가 일치하지 않습니다. 다시 확인해주세요.</p>");
                        }
                    });
                } else {
                    // 비밀번호 변경 실패 시
                    $("#modalContent").html("<p>잘못된 정보를 입력하였습니다.<br>다시 입력해주세요.</p>");
                    $("#modalBtn").html("<button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">닫기</button>");
                }
                $('#findPwModal').modal('show'); // 생성한 모달 띄우기
            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    });
</script>
</body>
</html>

</body>
</html>