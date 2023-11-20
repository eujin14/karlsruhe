<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 등록</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>
<body>
<div class="container">
<br><h1>사진 등록</h1><br>
	<!-- 게시물 등록 폼 -->
	<form id="check" action="/photo/create" method="post" enctype="multipart/form-data">
		<div class="mb-3">
			<label class="form-label">작성자</label> 
			<input id="bwriter" name="pwriter" type="text" class="form-control" value="${user.username}" readonly="readonly" maxlength="100" style="width:100%;" />
		</div>
		<div class="mb-3">
			<label class="form-label" >제목</label> 
			<input id="btitle" name="ptitle" type="text" class="form-control" maxlength="100" style="width:100%;" placeholder="제목을 입력하세요 " />
		</div>

		<div class="mb-3">
			<label class="form-label">첨부사진</label> 
			<input id="bimage" name="pcontent" type="file" class="form-control" />
			         <br>※ 개별 이미지의 파일 사이즈는 Mbyte를 초과할 수 없습니다.
		</div>
		<div class="row">
			<div class="col-md-10"></div>
			<div class="col-md">
				<button type="submit" class="form-control">등록</button>
			</div>
			<div class="col-md">
				<button onclick="location.href='/photo/readList'" class="form-control">취소</button>
			</div>
		</div>
</form><br>
</div>


   
   
   
   

<script>
 $('#summernote').summernote({
        placeholder: '내용을 입력하세요',
        tabsize: 2,
        height: 120,
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