<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<title>공지작성</title>
</head>
<body>
<div class="container">
<!-- 로그인 정보 받기 -->
<sec:authentication property="principal" var="user" />
   <div class="card shadow-none border border-300 my-4"
      data-component-card="data-component-card">
   
<div class="card-header p-4 border-bottom border-300 bg-soft">
    <div class="row justify-content-center align-items-center my-2">
        <div class="col-12 text-center">
            <h2 class="mb-4 mt-4" style="margin-top: -1cm;">공지게시판</h2>
        </div>
    </div>
</div>



      <div class="card-body p-0">
         <div class="p-4 code-to-copy">

            
            <form id="check" action="/notice/create?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
               
               <div class="row mb-3">

                  <label class="col-sm-2 col-form-label" for="inputntitle">제목</label>

                  <div class="col-sm-10">

                     <input class="form-control" id="ntitle" name="ntitle" type="text" placeholder="제목을 입력하세요" />
                  </div>
               </div>
               
               

               <div class="row mb-3">

                  <label class="col-sm-2 col-form-label" for="inputnimage">사진</label>

                  <div class="col-sm-10">

                     <input class="form-control" id="nimage" name="nimage" type="file"/>
                        <br>※ 개별 이미지의 파일 사이즈는 Mbyte를 초과할 수 없습니다.
                  </div>
               </div>
               <div class="row mb-3">

                  <textarea class="form-control" id="summernote" name="ncontent"></textarea>
               </div>
                     
                  <div class="row">
         <div class="col-md-10"></div>
         <div class="col-md">
            <button type="submit" class="btn btn-primary">등록</button>
         </div>
         <div class="col-md">
            <button onclick="location.href='/notice/readList'" class="btn btn-outline-primary">취소</button>
         </div>
      </div>
            </form>

         </div>
        mm     
      </div>

   </div>
   </div>
<script>
 $('#summernote').summernote({
        placeholder: '내용을 입력하세요',
        tabsize: 2,
        height: 300,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
 
   $('#check').on('submit', function(e) {
        if($('#summernote').summernote('isEmpty')) {
           alert("내용이 비었습니다.");
          e.preventDefault();
        }
        else {
        }
   })
 </script>

    

</body>
</html>



<%-- 
	<form action="/notice/create?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<p>공지유형 <select name="ncategory" id="ncategory"> <option selected>일반공지</option>
				<option>긴급공지</option>
				
			</select>

	<label class="col-sm-2 col-form-label" for="inputn">고정/미고정</label>
    <div class="col-sm-10">
    <div class="form-check form-check-inline">
      <input class="form-check-input" id="flexRadioDefault1" type="radio" name="npin" value="1" checked="checked"/>
      <label class="form-check-label mb-0" for="flexRadioDefault1">고정 </label>
    </div>
    <div class="form-check form-check-inline">
      <input class="form-check-input" id="flexRadioDefault2" type="radio" name="npin" value="0" />
      <label class="form-check-label mb-0" for="flexRadioDefault2">미고정</label>
    </div>
  </div>
	<p><input type="submit" value="저장"> 
	</form>
	 --%>

