<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 등록</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<body>
<!-- 로그인 정보 받기 -->
<sec:authentication property="principal" var="user" />
<br><br>
    <!-- 메인 -->
     <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Gallery</h2>
          <ol>
            <li><a href="/">홈</a></li>
            <li><a href="/photo/readList">Gallery</a></li>
            <li>${photo.ptitle}</li>
          </ol>
        </div>

      </div>
    </section>
<br>
    <div class="container">
   <!-- 게시물 등록 폼 -->
   <div class="card shadow-none border border-300 my-4" data-component-card="data-component-card">
            <div class="card-header p-4 border-bottom border-300 bg-soft">
                <div class="row g-3 justify-content-between align-items-center">
                    <div class="col-12 col-md">
                        <h4 class="text-900 mb-0" data-anchor="data-anchor">사진 등록</h4>
                    </div>
                </div>
            </div>
    <div class="card-body p-0">
                <div class="p-4 code-to-copy">

   <form id="check" action="/admin/create?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
   
   
                          <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="pimage">첨부사진</label>
                            <div class="col-sm-10">
                                <input  class="form-control" id="pimage" name="pimage" type="file"  required />
                                <br>※ 개별 이미지의 파일 사이즈는 Mbyte를 초과할 수 없습니다.
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="pimage">첨부사진</label>
                            <div class="col-sm-10">
                                <input  class="form-control" id="pimage" name="pimage" type="file"  required />
                                <br>※ 개별 이미지의 파일 사이즈는 Mbyte를 초과할 수 없습니다.
                            </div>
                        </div>

                         <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="pimage">첨부사진</label>
                            <div class="col-sm-10">
                                <input  class="form-control" id="pimage" name="pimage" type="file"  required />
                                <br>※ 개별 이미지의 파일 사이즈는 Mbyte를 초과할 수 없습니다.
                            </div>
                        </div>
      <br><br>
                        <div class="vstack gap-2 col-md-5 mx-auto">
                            <button class="btn btn-primary" type="submit">등록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>  


    </div>
</body>
</html>