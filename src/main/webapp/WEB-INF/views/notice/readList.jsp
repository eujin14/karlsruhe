<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  

<body>
<sec:authentication property="principal" var="users" />
 <main id="main" style="background-color: white;">
<br><br>
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
    
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>공지게시판</h2>
          <ol>
            <li><a style="text-decoration: none;" href="/">홈</a></li>
            <li><a style="text-decoration: none;" href="/notice/readList">공지사항</a></li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
   
     <div class="container" style="padding-left:150px; padding-right:150px;">
     	<div class="card shadow-none border border-0 mb-3" style="background-color: white;"
		data-component-card="data-component-card">

			<div class="p-4 code-to-copy">
			
    <div class="card-body p-0">
<div class="p-4 code-to-copy">
<div id="tableExample3" data-list='{"valueNames":["nid","ntitle","ndate"],"page":10,"pagination":true,"filter":{"key":"ntitle"}}'>
  <div class="row justify-content-end g-0">
  <div class="search-box mb-3 mx-auto">
    <form class="position-relative" data-bs-toggle="search" data-bs-display="static">
      <input class="form-control search-input search form-control-sm" type="search" placeholder="Search" aria-label="Search" />
      <span class="fas fa-search search-box-icon"></span>
    </form>
  </div>
  </div>
  <div class="table-responsive">
    <table class="table table-sm fs--1 mb-0">
      <thead>
        <tr>
        <th class="sort border-top text-center ps-3" data-sort="nid">번호</th>
		<th class="sort border-top text-center" style=" padding-right:60px;" data-sort="ntitle">제목</th>
		<th class="sort border-top text-center" data-sort="ntitle">작성자</th>
		<th class="sort border-top text-center pe-3" data-sort="ndate">작성일</th>
		
        </tr>
      </thead>
      <tbody class="list" id="table-regions-by-revenue">
      <c:forEach items="${lists}" var="notice" varStatus="i">
        <tr>
        <td class="align-middle text-center ps-3 nid" style="width:100px;">${totalRecordCount - ((currentPage * recordsPerPage) - i.index) + 1}</td>
		<td class="align-middle ntitle" style="width:300px;"><a style="text-decoration: none; color: black;" href="/notice/readDetail?nid=${notice.nid}">${notice.ntitle}</a></td>
		<td class="align-middle text-center nwriter" style="width:150px;">관리자</td>
		<td class="align-middle text-center ndate py-3 pe-3" style="width:200px;">${notice.ndate}</td>
		
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
    </div>
    
    
    </main>
      <script src="/resources/assets/js/main.js"></script>
    
</body>

</html>
    
