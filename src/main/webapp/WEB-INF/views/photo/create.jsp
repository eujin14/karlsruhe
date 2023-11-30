<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
 
<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
   
   
</head>
<meta charset="UTF-8">
<title>공지 사항C</title>
</head>
<body>
<div class="card shadow-none border border-300 my-4" data-component-card="data-component-card">
                  <div class="card-header p-4 border-bottom border-300 bg-soft">
                    <div class="row g-3 justify-content-between align-items-center">
<div class="col-12 col-md">
 <h2 class="text-900 mb-0 text-center fs-6" data-anchor="data-anchor">자유 게시판 </h2>
</div>
</div>
                  </div>
   

 <div class="card-body p-0">         
<div class="p-4 code-to-copy">

<!-- 토큰 때문에 전송이 되지 않아 액션에 토큰 심음 -->
<form action="/photo/create"method="post" enctype="multipart/form-data">
<%--          <sec:authentication property="principal" var="users" /> 
 --%>  <div class="row mb-3">

    <label class="col-sm-2 col-form-label" for="inputntitle">제목</label>

    <div class="col-sm-10">

      <input class="form-control" id="ptitle" name="ptitle" type="text" placeholder="제목을 입력하세요" />
    </div>
  </div>
   <div class="row mb-3">

    <label class="col-sm-2 col-form-label" for="aanwriter" >작성자</label>

    <div class="col-sm-10">

      <input class="form-control" id="pwriter" name="pwriter" type="text"  value="${users.username}" readonly/>
    </div>
  </div>
  <div class="row mb-3">

    <label class="col-sm-2 col-form-label" for="inputncate">종류</label>
        <div class="col-sm-10">
    
            <select class="form-select" id="ncate" name="ncate"
               aria-label="Default select example">
               <option selected="selected" value="긴급공지">긴급공지</option>
               <option value="공지">공지</option>
            </select>
            </div>
  </div>
  
   <div class="row mb-3">

    <label class="col-sm-2 col-form-label" for="inputnimage">사진</label>

    <div class="col-sm-10">

      <input class="form-control" id="pimage" name="pimage" type="file"  />
    </div>
  </div>
    <div class="row mb-3">

<textarea class="form-control" id="summernote" name="pcontent"
               rows="3" placeholder="내용을 입력하세요"></textarea>
  </div>

<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 --%><br><br>
<div class="vstack gap-2 col-md-5 mx-auto">
 <button class="btn btn-primary" type="submit">등록</button>   
</div>
</form>

</div>

                  </div>
                  
                </div>
<script>
      $('#summernote').summernote({
         placeholder : '내용을 입력하세요',
         tabsize : 5,
         height : 200
      });
   </script>
</body>
</html>