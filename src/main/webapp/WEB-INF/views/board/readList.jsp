<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   
</head>
<body>
<sec:authentication property="principal" var="users" />
<br><br>
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>자유게시판</h2>
          <ol>
            <li><a href="/">홈</a></li>
            <li><a href="/board/readList">자유게시판</a></li>
            <li>${board.btitle}</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->


<div class="container">
<div class="sidebar-item tags" style="display: flex; justify-content: flex-end;">
    <a href="/board/create" style="display: inline-block; padding: 10px 25px; border-radius: 4px; transition: 0.4s; margin: 10px; border: 2px solid #f03c02; color: #f03c02; background: #fff; margin-left: auto;" role="button">게시물 등록</a>
</div>
<br>
<div class="card shadow-none border border-300 mb-3"
		data-component-card="data-component-card">

		<div class="card-header p-4 border-bottom border-300 bg-soft">
		
		<div class="row g-3 justify-content-between align-items-center">
		<div class="col-12 col-md">
<h5 class="card-title">글과 의견을 자유롭게 제시할 수 있는 게시판입니다.</h5>
              <p>비방성 글, 광고, 명예훼손의 우려가 있는 글 등 게시판 성격에 부합되지 않는 게시물은</p><p> 관리자 권한으로 통보없이 이동,삭제될 수 있습니다.</p>
              </div>
			</div>
		</div>
	
<div class="card-body p-0">
<div class="p-4 code-to-copy">
<div id="tableExample3" data-list='{"valueNames":["bno","btitle","bdate"],"page":5,"pagination":true,"filter":{"key":"btitle"}}'>
  <div class="table-responsive">
    <table class="table table-hover">
      <thead>
        <tr>
          <th class="sort border-top text-center ps-3" data-sort="bno">번호</th>
          <th class="sort border-top text-center" data-sort="btitle">제목</th>
          <th class="sort border-top text-center" data-sort="bwriter">작성자</th>
          <th class="sort border-top text-center text-end pe-3" scope="col" data-sort="bdate">작성일</th>
         </tr>
      </thead>
      <tbody class="list" id="table-regions-by-revenue">
      <c:forEach items="${boards}" var="board" varStatus="i">
        <tr>          
        <td class="align-middle text-center ps-3 bno">${totalRecordCount - ((currentPage * recordsPerPage) - i.index) + 1}</td>
          <td class="align-middle text-center btitle"><a href="/board/readDetail?bno=${board.bno}">${board.btitle}</a></td>
          <td class="align-middle text-center bwriter">${board.bwriter}</td>
          <td class="align-middle text-center text-end py-3 pe-3">${board.bdate}</td>
        
        </tr>
        </c:forEach>
      </tbody>
    </table>
    </div>
      <div class="row justify-content-end g-0">
  <div class="search-box mb-3 mx-auto">
    <form class="position-relative" data-bs-toggle="search" data-bs-display="static">
      <input class="form-control search-input search form-control-sm" type="search" placeholder="Search" aria-label="Search" />
      <span class="fas fa-search search-box-icon"></span>
    </form>
  </div>
  </div>
   
<div class="d-flex justify-content-between mt-3">
         <span class="d-none d-sm-inline-block"
            data-list-info="data-list-info"></span>
         <div class="d-flex">
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
</div>
</div>
<!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>
</body>
</html>