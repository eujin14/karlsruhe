<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/header.css" type="text/css">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
            
            
            
            
            
  <!-- Vendor CSS Files -->
   <link href="/resources/vendor/simple-datatables/style.css" rel="stylesheet">

  
  
  
  
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authentication property="principal" var="users" />
<div class="container">

<section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h1 class="card-title">자유게시판</h1>
 <h5 class="card-title">글과 의견을 자유롭게 제시할 수 있는 게시판입니다.</h5>
              <p>
비방성 글, 광고, 명예훼손의 우려가 있는 글 등 게시판 성격에 부합되지 않는 게시물은 관리자 권한으로 통보없이 이동, 삭제될 수 있습니다.</p>

              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th data-sort="bno">번호</th>
                    <th data-sort="btitle">제목</th>
                    <th data-sort="bdate">작성일</th>
                  </tr>
                </thead>
                <tbody>
<c:forEach items="${boards}" var="board">
                  <tr>
                    <td>${board.bno}</td>
                    <td><a href="/board/readDetail?bno=${board.bno}">${board.btitle}</a></td>
                    <td>${board.bdate}</td>
                  </tr>
	</c:forEach>
   </tbody>
              </table>
              <!-- End Table with stripped rows -->

            </div>
          </div>

        </div>
      </div>
    </section>

	</div>
	  <!-- Vendor JS Files -->
  <script src="/resources/vendor/simple-datatables/simple-datatables.js"></script>


</body>
</html>