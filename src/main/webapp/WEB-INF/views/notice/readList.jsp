<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  

<body>

 <main id="main">
<br><br><br>
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>공지게시판</h2>
          <ol>
            <li><a href="index.html">홈</a></li>
            <li><a href="/notice/readList">공지사항</a></li>
            
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
    
    <div class="container">



	<div class="card shadow-none border border-300 mb-3"
		data-component-card="data-component-card">
		
		<div class="card-body p-0">
		
			<!-- 공지사항중 내용과 카테고리를 검색어로 원하는 내용만 확인 할 수 있게함  -->
			<div class="p-4 code-to-copy">
			
		
		<div id="tableExample3"
		data-list='{"valueNames":["nid","ntitle","ncategory","ndate"],"page":10,"pagination":true}'>
		
		<div class="table-responsive">
			<table class="table table-sm fs--1 mb-0">
				<thead>
					<tr class="be-light">
									<th class="sort border-top ps-3" data-sort="nid">번호</th>
									<th class="sort border-top" data-sort="ntitle">제목</th>
									<th class="sort border-top text-end pe-3" data-sort="ndate">작성일</th>
								</tr>
				</thead>
				<tbody class="list">
								<c:forEach items="${lists}" var="notice">

									<tr>
										<td class="align-middle ps-3 nid">${notice.nid}</td>
										<td class="align-middle ntitle"><a href="/notice/readDetail?nid=${notice.nid}">${notice.ntitle}</a></td>
										<td class="align-middle ndate text-end py-3 pe-3">${notice.ndate}</td>
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
		<div class="search-box mb-3 mx-auto">
			<form class="position-relative" data-bs-toggle="search"
				data-bs-display="static">
				<input class="form-control search-input search form-control-sm"
					type="search" placeholder="Search" aria-label="Search" /> <span
					class="fas fa-search search-box-icon"></span>

			</form>
		</div>
		</div>
		
	
			</div>
		</div>
	</div>
	</div>
</body>



</html>
    
