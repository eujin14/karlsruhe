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

<main id="main">
<br><br><br>
    <!-- ======= Breadcrumbs ======= -->
<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

       <div class="d-flex justify-content-between align-items-center">
          <h2>공지작성</h2>
          <ol>
            <li><a href="index.html">홈</a></li>
            <li><a href="/notice/readList">공지사항</a></li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

<div class="container">

        <div class="row mt-5 justify-content-center" >
          <div class="col-lg-10">
            <form action="/notice/update?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="ntitle" class="form-control" id="ntitle" placeholder="제목을 입력해주세요" value="${details.ntitle}" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="file" class="form-control" name="nimage" id="nimage"  value="${details.nimage}">
                </div>
              </div>
            
              <div class="form-group mt-3">
                 <textarea class="form-control" id="summernote" name="ncontent">${details.ncontent}</textarea>
              </div>
              
              <div class="form-group mt-3">
               
            
            <c:choose>
							<c:when test="${notice.npin eq '1'}">
								<div class="col-sm-10">
									<div class="form-check form-check-inline">
										<input class="form-check-input" id="flexRadioDefault1"
											type="radio" name="npin" value="1" checked="checked" /> <label
											class="form-check-label mb-0" for="flexRadioDefault1">고정
										</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" id="flexRadioDefault2"
											type="radio" name="npin" value="0" /> <label
											class="form-check-label mb-0" for="flexRadioDefault2">미고정</label>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-sm-10">
									<div class="form-check form-check-inline">

										<input class="form-check-input" id="flexRadioDefault1"
											type="radio" name="npin" value="1" /> <label
											class="form-check-label mb-0" for="flexRadioDefault1">고정
										</label>
									</div>
									<div class="form-check form-check-inline">

										<input class="form-check-input" id="flexRadioDefault2"
											type="radio" name="npin" value="0" checked="checked" /> <label
											class="form-check-label mb-0" for="flexRadioDefault2">미고정</label>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
             </div>   
              
      
    <input type="hidden" name="nid" value="${details.nid}" />
    <input type="hidden" name="nimage" value="${details.nimage}" />
	<div class="text-center"><button type="submit" class="btn" style="display: inline-block; padding: 10px 25px; border-radius: 2px; transition: 0.4s; margin: 10px; border-radius: 4px; border: 2px solid #f03c02; color: #f03c02; background: #fff;"
>수정</button></div>
          
            </form>
          </div>
         </div>
      </div>
       

      </main>  
   
<script>

 $('#summernote').summernote({
        placeholder: '공지 내용을 입력하세요',
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

