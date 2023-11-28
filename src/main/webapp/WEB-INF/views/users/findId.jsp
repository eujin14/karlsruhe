<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* 전체적인 기본 틀 */
.find_box {
    width: 100%;
    height: 600px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 1px 4px 22px -8px #0004;
    display: flex;
    overflow: hidden;
}

.formHeader {
    display: inline-block;
    margin-bottom: 40px;
}
#findPwForm {
    float: right;
    margin-left: 15px;
}
#findIdForm {
    border-right: 1px solid #afafaf;
    padding: 20px;
}
#findPwForm {
    padding:20px;
}
hr {
    margin:0px;
}

form > div > a{
    display: inline-block;
    text-decoration: none!important;
    color: #452A5A;
    font-size: 0.9rem;
    transition: .3s;
    margin-top: 20px;
}

/* 폼 입력하는 부분 */
.find_box .contact{
    display: flex;
    align-items: center;
    justify-content: center;
    align-self: center;
    height: 100%;
    margin: auto;
}
.find_box  h3{
    text-align: center;
}
input {
    display: block;
    border: none;
    margin: 15px 0px;
    border-bottom: 1px solid #4f30677d;
    padding: 7px 9px;
    width: 100%;
    overflow: hidden;
    background: transparent;
    font-weight: 600;
    font-size: 14px;
}

.find_box{
    background: linear-gradient(-45deg, #dcd7e0, #fff);
}

.BtnGroup {
    display: flex;
    justify-content: center;
    align-items: center;
    margin: auto;
}

.submit, .button{
    width: 40%;
    border: none;
    padding: 15px;
    border-radius: 8px;
    display: inline-block;
    margin: 30px 5px 5px;
    background: #583672;
    color: #fff;
    font-weight: bold;
    box-shadow: 0px 9px 15px -11px rgba(88,54,114,1);
    text-align: center;
}

/* 모달 위치 조정 */
.modal {
    text-align: center;
}

@media screen and (min-width: 768px) {
    .modal:before {
        display: inline-block;
        vertical-align: middle;
        content: " ";
        height: 100%;
    }
}

.modal-dialog {
    display: inline-block;
    text-align: left;
    vertical-align: middle;
}

@media (max-width: 936px){
    form > div > a{
        font-size: 0.7rem;
        padding: 5px!important;
    }
    .submit {
        padding: 5px;
    }
    .button {
        font-size: 1rem;
    }
}</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
 <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

</head>
<body>
<body>
<section class="find">
    <div class="find_box">
        <div class="contact">
            <form>
                <div class="justify-content-center formHeader">
                    <a id="findIdForm" href="/users/findId"><h3>아이디 찾기</h3></a>
                    <a id="findPwForm" href="/users/findPw"><h3>비밀번호 찾기</h3></a>
                    <hr>
                </div>
                <div class="inputForm">
                    <input name="uname" type="text" id="uname" placeholder="이름">
                    <input name="utel" type="text" id="utel" placeholder="전화번호 (010-0000-0000)">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <div class="BtnGroup">
                        <button type="button" class="submit" id="findIdBtn">아이디 찾기</button>
                        <a href="/login" type="button" class="button">취소</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<!-- 모달 창 -->
<div class="modal" id="findIdModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">아이디 찾기</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modalContent">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
$('#findIdBtn').on('click', function(){
    var uname = $('#uname').val();
    var utel = $('#utel').val();
    $.ajax({
        type : "POST",
        url : "/users/findId",
        data : { name : uname,
                tel : utel },
        dataType: "text",
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
</script>
</body>
</html>