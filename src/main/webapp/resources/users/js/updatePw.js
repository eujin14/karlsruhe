
var pwChk = false; //비밀번호 유효여부

//비밀번호 확인 이벤트(비밀번호 확인 입력 후 다른 곳 클릭시 이벤트 실행)
$('#ChkPassword').on("keypress keyup", function(e) {
    var password = $('#password').val(); //비밀번호 값
    var ChkPassword = $('#ChkPassword').val(); //비밀번호 확인 값

    if(password == ChkPassword) {
        //비밀번호와 비밀번호 확인 값이 같다면
        $('#validPassword').html("<div style='color:green;'>비밀번호가 일치합니다.</div>");
        pwChk = true;
    } else{
        //유효하지 않은 값이면 msg를 출력해준다.
        $('#validPassword').html("비밀번호가 일치하지 않습니다.");
        pwChk = false;
    }
});

//비밀번호 수정 폼 작성 후 제출 시 실행되는 함수
$('.submit').on('click', function(e) {
    var password = $('#password').val();
    var currentPassword = $('#currentPassword').val();
    $.ajax({
        type : "POST",
        url : "/updatePw",
        data : { currentPassword : currentPassword,
                password : password },
        beforeSend: function (jqXHR, settings) {
            var header = $("meta[name='_csrf_header']").attr("content");
            var token = $("meta[name='_csrf']").attr("content");
            jqXHR.setRequestHeader(header, token);
        },
        success : function(result) {
            if(!pwChk) { //비밀번호 오류 모달
                $('#modalTitle').html('비밀번호가 일치하지 않습니다.');
                $('#modalContent').html('<p>두 비밀번호가 일치하지 않습니다.<br>비밀번호와 비밀번호 확인은 같은 값을 입력해주세요.</p>');
                $('#errorModal').modal('show');
            } else { //유효성이 통과하면
                if(result) { //현재 비밀번호가 로그인한 유저의 비밀번호와 일치하면
                    location.replace("users/memberDetail")
                } else {
                    $('#modalTitle').html('비밀번호가 일치하지 않습니다.');
                    $('#modalContent').html('<p>로그인 한 계정과 비밀번호가 일치하지 않습니다.<br>현재 비밀번호를 확인해주세요.</p>');
                    $('#errorModal').modal('show');
                }
            }
        },
        error : function(request, status, error) {
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
})