<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
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

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<br><h1>자유게시판</h1><br>

<!-- 게시물 목록 -->
   <table class="table table-hover">
         <tr>
            <th class="col-md">번호</th>
            <th class="col-md-8">제목</th>
            <th class="col-md-2">작성일</th>
         </tr>
         <c:forEach items="${photos}" var="photo">
         <tr>
            <td>${photo.pno}</td>
            <td><a class="title" href="/photo/readDetail?pno=${photo.pno}">${photo.ptitle}</a></td>
            <td>${photo.pdate}</td>
         </tr>
      </c:forEach>         
   </table>
   <!-- END 게시물 목록 -->
   <!-- paging -->
   <div align="center">
   
   
      <span> 
          
         
            &nbsp;<b class="text-primary">1</b>&nbsp;
         
      </span>
   
   
   </div>
   <!-- END paging -->
   <br>
   <div class="row">
      <!-- 검색 -->
      <div class="col-md-2">
         <select name="searchType" class="form-select">
            <option value="title" selected>제목</option>
            <option value="content" >내용</option>
            <option value="writer" >작성자</option>
         </select> 
      </div>
      <div class="col-md-3">
         <input type="text" name="keyword" class="form-control" value="" placeholder="검색어를 입력해주세요."/>
      </div>
      <div class="col-md">
         <button type="button" class="form-control" id="searchBtn">검색</button>
      </div>
      <!-- END 검색 -->
      <!-- 글작성버튼 -->
      <div class="col-md-4"></div>
      <div class="col-md-2">
      </div>
      <button onclick="location.href='/photo/create'" class="form-control">글작성</button>
		</div>
      <!-- END 글작성버튼 -->
      
   </div><br>
   <!-- END 메인 -->
   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script>
/* 검색 */
document.getElementById("searchBtn").onclick = function () {
   let searchType = document.getElementsByName("searchType")[0].value;
   let keyword =  document.getElementsByName("keyword")[0].value;
   
   location.href = "/photos/readList?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
};
/* window 특정 크기 이하일때(모바일) title 줄여서 뿌리기 */
window.onload = function() {
   if ($(window).width() < 770) {
      for(var i = 0; i < 10; i++){
         if(document.getElementsByClassName("title")[i].innerText.length>5){
            var title = document.getElementsByClassName("title")[i].innerText.slice(0,3);
            document.getElementsByClassName("title")[i].innerText= title + '...';
         }
      }
   }
}
</script>
=======
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
  

</head>
<body>
	<div class="card shadow-none border border-300 mb-3"
		data-component-card="data-component-card">
		<div class="card-header p-4 border-bottom border-300 bg-soft">
			<div class="row g-3 justify-content-between align-items-center">
				<div class="col-12 col-md">
					<h4 class="text-900 mb-0" data-anchor="data-anchor">자유 게시판</h4>
				</div>
			</div>
		</div>
		<div class="card-body p-0">
		
			<!-- 공지사항중 내용과 카테고리를 검색어로 원하는 내용만 확인 할 수 있게함  -->
			<div class="p-4 code-to-copy">
				<div id="tableExample4"
					data-list='{"valueNames":["pno","ptitle","pcate","pdate"],"page":10,"pagination":true,"filter":{"key":"pcategory"}}'>
					<div class="row justify-content-end g-0">

						<div class="search-box mb-3 mx-auto">
							<form class="position-relative" data-bs-toggle="search"
								data-bs-display="static">
								<input class="form-control search-input search form-control-sm"
									type="search" placeholder="검색어를 입력하세요" aria-label="Search" />
								<span class="fas fa-search search-box-icon"></span>

							</form>
						</div>
						<div class="col-auto px-3">
							<select class="form-select form-select-sm mb-3" id="pcategory"
								name="ncate" data-list-filter="data-list-filter">

								<option selected="selected" value="warning">유아부</option>
								<option value="success">청년부</option>
								<option value="secondary">부</option>
								
							</select>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table table-sm fs--1 mb-0 table-hover">
							<thead>
								<tr class="be-light">
									<th class="sort border-top ps-3" data-sort="pno">번호</th>
									<th class="sort border-top" data-sort="ptitle">제목</th>
									<th class="sort border-top text-end pe-3" data-sort="pdate">작성일</th>
								</tr>
							</thead>

							<tbody class="list">
								<c:forEach items="${photos}" var="photo">

									<tr>
										<td class="align-middle ps-3 pno">${photo.pno}</td>
										<td class="align-middle ptitle"><a
											href="/photo/readDetail?pno=${photo.pno}">${photo.ptitle}</a></td>
										<td class="align-middle ndate text-end py-3 pe-3">${photo.pdate}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<sec:authentication property="principal" var="users" />

						<!-- 관리자일 경우에만 나타나는 메뉴 -->
						<sec:authorize access="hasAuthority('USER_ADMIN')">
							<a href="/photo/create">작성</a>
						</sec:authorize>

					</div>
					<div class="d-flex justify-content-between mt-3">
						<button class="page-link" data-list-pagination="prev">
							<span class="fas fa-chevron-left"></span>
						</button>
						<ul class="mb-0 pagination"></ul>
						<button class="page-link pe-0" data-list-pagination="next">
							<span class="fas fa-chevron-right"></span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>

   

>>>>>>> origin/sunghee
</body>
</html>