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

<!--     <link href="/resources/public/assets/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl">
 -->
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
            <li><a href="/main">홈</a></li>
            <li><a href="/board/readList">자유게시판</a></li>
            <li>${board.btitle}</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->


<br><br>
<div class="card">
            <div class="card-body" style="text-align: center;">
 <h5 class="card-title">글과 의견을 자유롭게 제시할 수 있는 게시판입니다.</h5>
              <p>비방성 글, 광고, 명예훼손의 우려가 있는 글 등 게시판 성격에 부합되지 않는 게시물은</p><p> 관리자 권한으로 통보없이 이동,삭제될 수 있습니다.</p>
<div class="container">
<div id="tableExample3" data-list='{"valueNames":["bno","btitle","bdate"],"page":10,"pagination":true}'>
  <div class="search-box mb-3 mx-auto">
    <form class="position-relative" data-bs-toggle="search" data-bs-display="static">
      <input class="form-control search-input search form-control-sm" type="search" placeholder="Search" aria-label="Search" />
      <span class="fas fa-search search-box-icon"></span>

    </form>
  </div>
  <div class="table-responsive">
    <table class="table table-striped table-sm fs--1 mb-0">
      <thead>
        <tr>
          <th class="sort border-top ps-3" data-sort="bno">번호</th>
          <th class="sort border-top" data-sort="btitle">제목</th>
          <th class="sort border-top" data-sort="bdate">작성일</th>
          <th class="sort text-end align-middle pe-0 border-top" scope="col">ACTION</th>
        </tr>
      </thead>
      <tbody class="list">
      <c:forEach items="${boards}" var="board">
        <tr>
          <td class="align-middle ps-3 bno">${board.bno}</td>
          <td class="align-middle btitle"><a href="/board/readDetail?bno=${board.bno}">${board.btitle}</a></td>
          <td class="align-middle bdate">${board.bdate}</td>
          <td class="align-middle white-space-nowrap text-end pe-0">
          <sec:authorize access="hasAuthority('USER_ADMIN')">
            <div class="font-sans-serif btn-reveal-trigger position-static">
              <button class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal fs--2" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="fas fa-ellipsis-h fs--2"></span></button>
              <div class="dropdown-menu dropdown-menu-end py-2"><a class="dropdown-item" href="/board/update?bno=${board.bno}"">수정</a>
                <div class="dropdown-divider"></div><a class="dropdown-item text-danger"  href="/board/delete?bno=${board.bno}">삭제</a>
              </div>
            </div>
            </sec:authorize>
          </td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
    </div>
<div class="d-flex justify-content-between mt-3"><span class="d-none d-sm-inline-block" data-list-info="data-list-info"></span>
    <div class="d-flex">
      <button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
      <ul class="mb-0 pagination"></ul>
      <button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
    </div>
  </div>    
  </div>
  </div>
 
</div>
</div>


    <script src="/resources/public/vendors/fontawesome/all.min.js"></script>

</body>
</html>