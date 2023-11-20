<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문작성</title>

<body>
	<form action="/notice/create?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<p>제목 : <input type="text" name="ntitle" id= "ntitle" maxlength="100" style="width:100%;" placeholder="제목을 입력하세요 "><p>
	<p>작성자 : <input type="text" name="nwriter" id= "nwriter" maxlength="100" style="width:100%;"></p>
	<p>공지유형 <select name="ncategory" id="ncategory"> <option selected>일반</option>
				<option>2공지</option>
				<option>3공지</option>
			</select>
	<p>내용<textarea id="summernote" name="ncontent"></textarea>
	<p>첨부사진
			<input type="file" name="nimage" id="nimage">
			<br>※ 개별 이미지의 파일 사이즈는 Mbyte를 초과할 수 없습니다.
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
	
<script>
 $('#summernote').summernote({
        placeholder: '공지 내용을 입력하세요',
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
 </script>