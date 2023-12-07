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
<br><br><br>
    <!-- ======= Breadcrumbs ======= -->
   <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>사진함</h2>
          <ol>
            <li><a href="/main">홈</a></li>
            <li><a href="/photo/readList">사진함</a></li>
            <li>${photo.ptitle}</li>
          </ol>
        </div>

      </div>
    </section>


<br><br>
<div class="container">
<div class="card shadow-none border border-300 mb-3"
		data-component-card="data-component-card">
<div class="card-body p-0">
<div class="p-4 code-to-copy">
<div id="tableExample3" data-list='{"valueNames":["pno","ptitle","pdate"],"page":5,"pagination":true,"filter":{"key":"ptitle"}}'>
  <div class="row justify-content-end g-0">
  <div class="search-box mb-3 mx-auto">
    <form class="position-relative" data-bs-toggle="search" data-bs-display="static">
      <input class="form-control search-input search form-control-sm" type="search" placeholder="Search" aria-label="Search" />
      <span class="fas fa-search search-box-icon"></span>
    </form>
  </div>
  </div>
  <div class="table-responsive">
    <table class="table table-hover">
      <thead>
        <tr>
          <th class="sort border-top ps-3" data-sort="pno">번호</th>
          <th class="sort border-top" data-sort="ptitle">제목</th>
          <th class="sort border-top" data-sort="pdate">작성일</th>
          <th class="sort border-top text-end pe-3" scope="col">ACTION</th>
         </tr>
      </thead>
      <tbody class="list" id="table-regions-by-revenue">
      <c:forEach items="${photos}" var="photo">
        <tr>
          <td class="align-middle ps-3 bno">${photo.pno}</td>
          <td class="align-middle btitle"><a href="/photo/readDetail?pno=${photo.pno}">${photo.ptitle}</a></td>
          <td class="align-middle bdate">${photo.pdate}</td>
          <td class="align-middle text-end py-3 pe-3">
          <sec:authorize access="hasAuthority('USER_ADMIN')">
            <div class="font-sans-serif btn-reveal-trigger position-static">
              <button class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal fs--2" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="fas fa-ellipsis-h fs--2"></span></button>
              <div class="dropdown-menu dropdown-menu-end py-2"><a class="dropdown-item" href="/photo/update?pno=${photo.pno}"">수정</a>
                <div class="dropdown-divider"></div><a class="dropdown-item text-danger"  href="/photo/delete?pno=${photo.pno}">삭제</a>
              </div>
            </div>
            </sec:authorize>
          </td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
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

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>