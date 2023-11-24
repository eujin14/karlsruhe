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

<title>질문작성</title>
</head>
<body>
<div class="container">
<!-- 로그인 정보 받기 -->
<sec:authentication property="principal" var="user" />
	<div class="card shadow-none border border-300 my-4"
		data-component-card="data-component-card">
		<div class="card-header border-bottom border-300 bg-soft">
			<div class="row g-3 justify-content-between align-items-center">
				<div class="col-12 col-md">
					<h2 class="text-900 mb-0 text-center"
						data-anchor="data-anchor">게시판 수정</h2>
				</div>
			</div>
		</div>


		<div class="card-body p-0">
			<div class="p-4 code-to-copy">

				<!-- 토큰 때문에 전송이 되지 않아 액션에 토큰 심음 -->
<%-- 				<form action="update?${_csrf.parameterName}=${_csrf.token}"
				method="post" enctype="multipart/form-data"> --%>	
				
				<form id="check" action="/board/update" method="post" enctype="multipart/form-data">
					<input type="hidden" name="bwriter" id="bwriter" value="${board.bwriter}" /> 
						<input type="hidden" name="bno" id="bno" value="${board.bno}" />

					<div class="row mb-3">

						<label class="col-sm-2 col-form-label" for="inputntitle">제목</label>

						<div class="col-sm-10">

							<input class="form-control" id="btitle" name="btitle" type="text"
								value="${board.btitle}" placeholder="제목을 입력하세요" />
						</div>
					</div>
					
					

					<div class="row mb-3">

						<label class="col-sm-2 col-form-label" for="inputnimage">사진</label>

						<div class="col-sm-10">

							<input class="form-control" id="bimage" name="bimage" type="file"
								value="${board.bimage}" />
								<br>※ 개별 이미지의 파일 사이즈는 Mbyte를 초과할 수 없습니다.
						</div>
					</div>
					<div class="row mb-3">

						<textarea class="form-control" id="summernote" name="bcontent">${board.bcontent}</textarea>
					</div>

	<%-- 				<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <br> <br> --%>
						
						<div class="row">
			<div class="col-md-10"></div>
			<div class="col-md">
				<button type="submit" class="btn btn-primary">수정</button>
			</div>
			<div class="col-md">
				<button onclick="location.href='/board/readList'" class="btn btn-outline-primary">취소</button>
			</div>
		</div>
				</form>

			</div>

		</div>

	</div>
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