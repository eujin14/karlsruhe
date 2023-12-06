/*
    작성자 : 강세빈
    작성일 : 2023-04-04
*/

var idChk = false; //아이디 유효여부
var pwChk = false; //비밀번호 유효여부
var emailChk = true; //이메일 유효여부
var telChk = false; //전화번호 유효여부

function idValidator(args) {
    if (/^[a-zA-z0-9]/.test(args)) {
        return true;
    } //입력값이 영어, 숫자로만 이루어져 있으면 true 반환

    return false;
}

//이메일 유효성 확인 함수
function emailValidator(args) {
    if(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/.test(args)) {
        return true;
    } //입력값이 숫자or영문@숫자or영문.숫자or영문 이면 true 반환

    return false;
}

//전화번호 유효성 확인 함수
function telValidator(args) {
    if (/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/.test(args)) {
        return true;
    } //입력값이 숫자(2,3글자)-숫자(3,4글자)-숫자(4글자) 면 true 반환

    return false;
}

//아이디 중복 체크
$('#username').on("focusout", function(e) {
    var username = $(this).val();
    $.ajax({
        type : "GET",
        url : "/IdChk",
        data : { username : username },
        success : function(result) {
            if(result == true && idValidator(username)) { //중복 아이디가 없고, id가 유효값이 라면
                $('#validId').html("<div style='color:green;'>사용가능한 아이디입니다.</div>");
                idChk = true;
            } else if(!idValidator(username)) { //id가 유효값이 아니라면
                $('#validId').html("잘못된 아이디입니다.<br>아이디는 영어, 숫자만 사용 가능합니다.");
                idChk = false;
            }
            else { //중복 아이디가 존재한다면
                $('#validId').html("중복된 아이디입니다.<br> 다른 아이디를 입력해주세요.");
                idChk = false;
            }
        },
        error : function(request, status, error) {
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
});

$('#tel').on("focusout", function(e) {
    var tel = $(this).val();
    $.ajax({
        type : "GET",
        url : "/TelChk",
        data : { tel : tel },
        success : function(result) {
            if(result && telValidator(tel)) { //중복 아이디가 없고, id가 유효값이 라면
                $('#validTel').html("<div style='color:green;'>사용가능한 전화번호입니다.</div>");
                telChk = true;
            } else if(!telValidator(tel)) { //tel이 유효값이 아니라면
                $('#validTel').html("잘못된 전화번호입니다.<br>010-000-0000의 형식으로 입력해주세요");
                telChk = false;
            } else { //중복 전화번호가 존재한다면
                $('#validTel').html("중복된 전화번호입니다..<br> 다른 전화번호를 입력해주세요.");
                telChk = false;
            }
        }, error : function(request, status, error) {
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        }
    });
});


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

//이메일 입력 후 다른 곳 클릭시 이벤트 실행
$('#email').on("focusout", function(e){
    var email = $(this).val(); //이메일 입력값 가져오기
    var validate = emailValidator(email); //validate에 전화번호가 유효한 값이면 true를 아니면 false를 저장한다.
    if(validate || email == '') {
        //유효한 값이거나 이메일이 공란이면 초록색 글씨로 메시지를 출력해준다.
        $('#validEmail').html("<div style='color:green;'>사용가능한 이메일입니다.</div>");
        emailChk = true;
    } else{
        //유효하지 않은 값이면 메시지를 출력해준다.
        $('#validEmail').html("잘못된 이메일입니다.");
        emailChk = false;
    }
});

//회원 가입 폼 작성 후 제출 시 실행되는 함수
$('.submit').on('click', function(e) {
    if (!idChk) { //아이디 오류 모달
        $('#modalTitle').html('아이디 사용 불가');
        $('#modalContent').html('<p>사용할 수 없는 아이디 입니다.<br>아이디가 사용 중이거나 영어, 숫자 외의 값이 들어있습니다.</p>');
        $('#errorModal').modal('show');
    } else if(!pwChk) { //비밀번호 오류 모달
        $('#modalTitle').html('비밀번호가 일치하지 않습니다.');
        $('#modalContent').html('<p>두 비밀번호가 일치하지 않습니다.<br>비밀번호와 비밀번호 확인은 같은 값을 입력해주세요.</p>');
        $('#errorModal').modal('show');
    } else if(!emailChk) { //이메일 오류 모달
        $('#modalTitle').html('이메일 사용 불가');
        $('#modalContent').html('<p>올바른 이메일 주소를 입력해주세요.</p>');
        $('#errorModal').modal('show');
    } else if(!telChk) { //전화번호 오류 모달
        $('#modalTitle').html('전화번호 사용 불가');
        $('#modalContent').html('<p>올바른 전화번호를 입력해주세요.<br>전화번호는 000-000-0000 형식으로 작성해야합니다.</p>');
        $('#errorModal').modal('show');
    } else { //유효성이 통과하면 제출
        var email = $('#email').val();
        var name = $('#name').val();
        $('#validate').attr('value', true);
        $.ajax({
            type: "POST",
            url: "/sendEmail",
            data: {
                email: email,
                name: name
            },
            beforeSend: function (jqXHR, settings) {
                var header = $("meta[name='_csrf_header']").attr("content");
                var token = $("meta[name='_csrf']").attr("content");
                jqXHR.setRequestHeader(header, token);
            },
            success: function (result) {
            }, error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
        $('#submitForm').submit();
    }
})