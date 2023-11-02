<%@page import="com.karlsruhe.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A 게시판</title>

</head>
<body>
<div class="card flex-1 h-100 phoenix-offcanvas-container" style="padding:20px;">

<br>
	<div id="tableExample3"
		data-list='{"valueNames":["nid","ncategory","ntitle","nwriter","ndate"],"page":10,"pagination":true, "filter":{"key":"ncategory"}}'>
		<div class="row justify-content-end g-0">
				<div class="col-auto px-3">
					<select class="form-select form-select-sm mb-3"
						data-list-filter="data-list-filter">
						<option selected="" value="">일반</option>
						<option value="warning">1공지</option>
						<option value="success">2공지</option>
					</select>
				</div>
			</div>
		<div class="table-responsive">
			<table class="table table-sm fs--1 mb-0">
				<thead>
					<tr>
						<th class="sort border-top ps-3" data-sort="nid">번호</th>
						<th class="sort border-top" data-sort="ncategory">카테고리</th>
						<th class="sort border-top" data-sort="ntitle">제목</th>
						<th class="sort border-top" data-sort="nwriter">작성자</th>
						<th class="sort border-top" data-sort="ndate">작성일</th>
						
					</tr>
				</thead>
				<tbody class="list">
					<c:forEach items="${notice}" var="notice" varStatus="i">
						<tr>
							<td class="align-middle ps-3 nid">${totalRecordCount - (totalRecordCount - ((currentPage-1) * recordsPerPage + i.index)-1)}</td>
							<td class="align-middle ncategory">${notice.ncategory}</td>
							<td class="align-middle ntitle"><a href="/notice/readDetail?nid=${notice.nid}">${notice.ntitle}</a></td>
							<td class="align-middle nwriter">${notice.nwriter}</td>
							<td class="align-middle ndate">${notice.ndate}</td>
							<td class="align-middle ncategory text-end py-3 pe-3">
							
						<%-- <!-- 접수중이면 주황색뱃지 답변완료면 초록색뱃지 -->
						<c:choose>
						<c:when test="${qnab.qstate eq '접수중'}">
								<div class="badge badge-phoenix fs--2 badge-phoenix-warning">
									<span class="fw-bold">${notice.ncategory}</span>
									<span class="ms-1 fas fa-check"></span>
								</div>
						</c:when>		
						<c:otherwise>		
								<div class="badge badge-phoenix fs--2 badge-phoenix-success">
									<span class="fw-bold">${notice.ncategory}</span>
									<span class="ms-1 fas fa-check"></span>
								</div>
						</c:otherwise>
						</c:choose>					 --%>				
								
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
		<div class="search-box mb-3 mx-auto">
			<form class="position-relative" data-bs-toggle="search"
				data-bs-display="static">
				<input class="form-control search-input search form-control-sm"
					type="search" placeholder="Search" aria-label="Search" /> <span
					class="fas fa-search search-box-icon"></span>

			</form>
		</div>
		</div>
	

	
	

	
	<a href="/notice/create" class="btn btn-outline-primary me-1 mb-1 position-absolute bottom-0 end-0">작성</a>
</div>



</body>

</html>