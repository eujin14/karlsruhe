//findId 제출 시 처리
$('#findIdBtn').on('click', function(){
    var name = $('#name').val();
    var tel = $('#tel').val();
    $.ajax({
        type : "POST",
        url : "/findId",
        data : { name : name,
                tel : tel },
        datatype : { String },
        beforeSend: function (jqXHR, settings) {
            var header = $("meta[name='_csrf_header']").attr("content");
            var token = $("meta[name='_csrf']").attr("content");
            jqXHR.setRequestHeader(header, token);
        },
        success : function(result) {
            $("#modalContent").html(result);
            $('#findIdModal').modal('show');
        },
        error : function(request, status, error) {
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
});


//findPw 제출 시 처리 (modal 생성 후 띄우기)
$('#findPwBtn').on('click', function(){
    var username = $('#username').val();
    var name = $('#name').val();
    var tel = $('#tel').val();

    $.ajax({
        type : "POST",
        url : "/findPw",
        data : { name : name,
                tel : tel,
                username : username},
        datatype : { String },
        beforeSend: function (jqXHR, settings) {
            var header = $("meta[name='_csrf_header']").attr("content");
            var token = $("meta[name='_csrf']").attr("content");
            jqXHR.setRequestHeader(header, token);
        }, //spring security 로 인한 csrf token 전송
        success : function(result) {
            if (result != null && result != ""){
                //Modal 내용을 form으로 생성
                $("#modalContent").html("<form id=\"pwUpdateForm\">\n" +
                                            "<div>새로 사용할 비밀번호를 입력해주세요.</div>" +
                                            "<input name=\"password\" type=\"password\" id=\"password\" placeholder=\"비밀번호\"><br>" +
                                            "<input name=\"ChkPassword\" type=\"password\" id=\"ChkPassword\" placeholder=\"비밀번호 확인\">" +
                                            "<input type=\"hidden\" name=\"${_csrf.parameterName}\" value=\"${_csrf.token}\" />\n" +
                                        "</form>");
                $("#modalBtn").html("<button type=\"button\" class=\"btn btn-secondary\" id=\"updatePwBtn\">비밀번호 변경</button>\n" +
                                    "<button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">닫기</button>");
            } else {
                //비밀번호 변경 실패 시
                $("#modalContent").html("<p>잘못된 정보를 입력하였습니다.<br>다시 입력해주세요.</p>");
                $("#modalBtn").html("<button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">닫기</button>");
            }
            $('#findPwModal').modal('show'); //생성한 모달 띄우기

            $('#updatePwBtn').on('click', function(){
                var password = $('#password').val();
                var ChkPassword = $('#ChkPassword').val();
                $.ajax({
                    type : "POST",
                    url : "/updatePw",
                    data : { username : username,
                            password : password,
                            Chkpassword : ChkPassword },
                    datatype : { String },
                    beforeSend: function (jqXHR, settings) {
                        var header = $("meta[name='_csrf_header']").attr("content");
                        var token = $("meta[name='_csrf']").attr("content");
                        jqXHR.setRequestHeader(header, token);
                    },
                    success : function(result) {
                        if (password == ChkPassword) {
                            //비밀 번호 변경 성공시 login 페이지로 이동
                            location.replace("/login")
                        } else {
                            //비밀번호 다시 입력받기
                            $("#modalContent").html("<form id=\"pwUpdateForm\">\n" +
                                                        "<div>새로 사용할 비밀번호를 입력해주세요.</div>" +
                                                        "<input name=\"password\" type=\"password\" id=\"password\" placeholder=\"비밀번호\"><br>" +
                                                        "<input name=\"ChkPassword\" type=\"password\" id=\"ChkPassword\" placeholder=\"비밀번호 확인\">" +
                                                        "<input type=\"hidden\" name=\"${_csrf.parameterName}\" value=\"${_csrf.token}\" />\n" +
                                                        "<div style='color:red;'>비밀번호가 일치하지 않습니다. 다시 입력해주세요. </div>" +
                                                    "</form>");
                        }
                    },
                    error : function(request, status, error) {
                        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                    }
                });
            });
        },
        error : function(request, status, error) {
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
});