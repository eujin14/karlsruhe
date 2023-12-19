<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>주보 등록</title>
<main id="main">
<br><br>
    <!-- ======= Breadcrumbs ======= -->
<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

       <div class="d-flex justify-content-between align-items-center">
          <h2>주보</h2>
          <ol>
            <li><a href="/">홈</a></li>
            <li><a href="/weekly/readList">주보</a></li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
    <br>
     <div class="container">
   <!-- 게시물 등록 폼 -->
   <div class="card shadow-none border border-300 my-4">
            <div class="card-header p-4 border-bottom border-300 bg-soft">
                <div class="row g-3 justify-content-between align-items-center">
                    <div class="col-12 col-md">
                        <h4 class="text-900 mb-0">주보 수정</h4>
                    </div>
                </div>
            </div>
    <div class="card-body p-0">
                <div class="p-4 code-to-copy">

   <form action="/weekly/update?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
       <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="gtitle">제목</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="gtitle" name="gtitle" type="text" placeholder="제목을 입력하세요" value="${details.gtitle}" required />
                            </div>
                        </div>
                         
                         <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="gcontent">내용</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" id="summernote" name="gcontent" placeholder="내용을 입력하세요" >${details.gcontent}</textarea>
                            </div>
                        </div>
                        
      
                            
                       
      <br><br>
                        <div class="vstack gap-2 col-md-5 mx-auto">
                         <input type="hidden" name="gid" value="${details.gid}" />
    
                            <button class="btn btn-primary" type="submit">수정</button>
                        </div>
                    </form>
                </div>
            </div>
            </div>
        </div>
        </main>  
<script>
 $('#summernote').summernote({
        placeholder: '내용을 입력하세요',
        tabsize: 2,
        height: 400,
        toolbar: [
        	['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link']],
		    ['view', ['fullscreen', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
        
      });
 
 </script>
 
</body>
</html>

	
