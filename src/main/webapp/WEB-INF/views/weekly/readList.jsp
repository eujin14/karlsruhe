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
            <li><a style="text-decoration: none;" href="index.html">홈</a></li>
            <li><a style="text-decoration: none;" href="/weekly/readList">주보</a></li>
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
<div id="tableExample3" data-list='{"valueNames":["gid","gtitle","gdate"],"page":10,"pagination":true,"filter":{"key":"gtitle"}}'>
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
        <th class="sort border-top text-center ps-3" data-sort="gid">번호</th>
		<th class="sort border-top text-center" style=" padding-right:60px;" data-sort="gtitle">제목</th>
		<th class="sort border-top text-center" data-sort="gtitle">작성자</th>
		<th class="sort border-top text-center pe-3" data-sort="gdate">작성일</th>
		
        </tr>
      </thead>
      <tbody class="list" id="table-regions-by-revenue">
      <c:forEach items="${lists}" var="weekly">
        <tr>
        <td class="align-middle text-center ps-3 gid" style="width:100px;">${weekly.gid}</td>
		<td class="align-middle gtitle" style="width:300px;"><a style="text-decoration: none; color: black;" href="/weekly/readDetail?gid=${weekly.gid}">${weekly.gtitle}</a></td>
		<td class="align-middle text-center gwriter" style="width:150px;">관리자</td>
		<td class="align-middle text-center gdate py-3 pe-3" style="width:200px;">${weekly.gdate}</td>
		
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
</body>

</html>
    




	
