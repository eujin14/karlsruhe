<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- Spring security로 인한 csrf 토큰 -->
    <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
    <title>비밀번호 변경</title>

  <link href="/resources/assets/css/style.css" rel="stylesheet">


    <!-- jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- 페이지 개별 적용 css -->
    <link rel="stylesheet" href="/resources/users/css/updatePw.css" type="text/css">


</head>
<body>
<br><br>
<main id="main">
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>비밀번호 변경</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>비밀번호 변경</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->


<section class="section">
    <div class="section_box">
        <div class="contact">
            <form id="submitForm" class="userForm" action="/users/updatePw?${_csrf.parameterName}=${_csrf.token}" method="post">
                <h3>비밀번호 변경</h3>
                <div class="container">
                    <div class="row g-3 align-items-center">
                        <div class="col">
                            <label for="currentPassword" class="col-form-label">현재 비밀번호 : </label>
                        </div>
                        <div class="col-6">
                            <input name="currentPassword" id="currentPassword" type="password" placeholder="현재 비밀번호"/>
                        </div>
                        <div class="col">
                        </div>
                    </div>
                    <div class="row g-3 align-items-center">
                        <div class="col">
                            <label for="password" class="col-form-label">새로운 비밀번호 : </label>
                        </div>
                        <div class="col-6">
                            <input name="password" id="password" type="password" placeholder="비밀번호"/>
                        </div>
                        <div class="col">
                        </div>
                    </div>
                    <div class="row g-3 align-items-center">
                        <div class="col">
                            <label for="ChkPassword" class="col-form-label">비밀번호 확인 : </label>
                        </div>
                        <div class="col-6">
                            <input name="ChkPassword" id="ChkPassword" type="password" placeholder="비밀번호 확인"/>
                        </div>
                        <div class="col">
                            <div id="validPassword" class="valid"></div>
                        </div>
                    </div>
                    <div class="BtnGroup">
                        <button type="button" class="submit">비밀번호 변경</button>
                        <a href="/users/memberDetail" type="button" class="button">취소</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<!-- 오류 모달 -->
<div class="modal" id="errorModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">모달 제목</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modalContent">
                모달 본문
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
</main>
<script type="text/javascript">
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
      url : "/users/updatePw",
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
                  location.replace("/")
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

</script>

  <script src="/resources/assets/js/main.js"></script>

</body>
</html>