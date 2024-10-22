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
          <h2>주보</h2>
          <ol>
            <li><a style="text-decoration: none;" href="/">홈</a></li>
            <li><a style="text-decoration: none;" href="/weekly/readList">주보</a></li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
   
      
    
    <div class="container">

<br>
<div class="card shadow-none border border-300 mb-3"
		data-component-card="data-component-card">

		<div class="card-header p-4 border-bottom border-300 bg-soft">
		
		<div class="row g-3 justify-content-between align-items-center">
		<div class="col-12 col-md">
<h5 class="card-title"> 매주 주보가 업데이트되는 주보게시판입니다.</h5>
              <p>다가오는 주일 예배 안내 및 교회 소식을 확인해 주시기 바랍니다.</p>
              </div>
			</div>
		</div>
	
<div class="card-body p-0">
<div class="p-4 code-to-copy">
<div id="tableExample3" data-list='{"valueNames":["gid","gtitle","gdate"],"page":10,"pagination":true,"filter":{"key":"gtitle"}}'>
  <div class="table-responsive">
    <table class="table table-hover">
      <thead>
        <tr>
          <th class="sort border-top text-center ps-3" data-sort="gid">번호</th>
          <th class="sort border-top text-center" data-sort="gtitle">제목</th>
          <th class="sort border-top text-center" data-sort="gwriter">작성자</th>
          <th class="sort border-top text-center text-end pe-3" scope="col" data-sort="gdate">작성일</th>
         </tr>
      </thead>
      <tbody class="list" id="table-regions-by-revenue">
      <c:forEach items="${lists}" var="weekly" varStatus="i">
        <tr>          
        <td class="align-middle text-center ps-3 gid">${totalRecordCount - ((currentPage * recordsPerPage) - i.index) + 1}</td>
          <td class="align-middle text-center gtitle"><a href="/weekly/readDetail?gid=${weekly.gid}">${weekly.gtitle}</a></td>
          <td class="align-middle text-center gwriter">관리자</td>
          <td class="align-middle text-center text-end py-3 pe-3 gdate">${weekly.gdate}</td>
        
        </tr>
        </c:forEach>
      </tbody>
    </table>
    </div>
    <br>
      <div class="row justify-content-end g-0">
  <div class="search-box d-flex justify-content-center">
    <form class="position-relative" data-bs-toggle="search" data-bs-display="static">
      <input class="form-control search-input search form-control-sm" type="search" placeholder="검색" aria-label="Search"style="width: 350px;"/>
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
</main>
<!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>
</body>
</html>
    
    
    
    
   
   
   
