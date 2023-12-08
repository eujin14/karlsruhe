<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
 <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

<style>
        body {
            background-color: #f8f9fa;
        }

        .find {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .find_box {
            background-color: white;
            padding: 223px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .contact form {
            max-width: 400px;
            margin: auto;
        }

        .formHeader {
            text-align: center;
            margin-bottom: 20px;
        }

        .inputForm input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .BtnGroup {
            display: flex;
            justify-content: space-between;
        }

        .submit {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }

        .button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }

        .modal-content {
            border-radius: 10px;
        }
        
        
    </style>

</head>
<body>
<body>
    <div class="find_box">
        <div class="contact">
            <form>
                <div class="justify-content-center formHeader">
                    <a id="findIdForm" ><h3>아이디 찾기</h3></a>
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