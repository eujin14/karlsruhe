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

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<sec:authentication property="principal" var="users" />
<div class="container">
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
					data-list='{"valueNames":["bno","btitle","bdate"],"page":10,"pagination":true,"filter":{"key":"btitle"}}'>
					<div class="row justify-content-end g-0">

						<div class="search-box mb-3 mx-auto">
							<form class="position-relative" data-bs-toggle="search"
								data-bs-display="static">
								<input class="form-control search-input search form-control-sm"
									type="search" placeholder="검색어를 입력하세요" aria-label="Search" />
								<span class="fas fa-search search-box-icon"></span>

							</form>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table table-sm fs--1 mb-0 table-hover">
							<thead>
								<tr class="be-light">
									<th class="sort border-top ps-3" data-sort="bno">번호</th>
									<th class="sort border-top" data-sort="btitle">제목</th>
									<th class="sort border-top text-end pe-3" data-sort="bdate">작성일</th>
								</tr>
							</thead>

							<tbody class="list">
								<c:forEach items="${boards}" var="board">

									<tr>
										<td class="align-middle ps-3 bno">${board.bno}</td>
										<td class="align-middle btitle"><a
											href="/board/readDetail?bno=${board.bno}">${board.btitle}</a></td>
										<td class="align-middle bdate text-end py-3 pe-3">${board.bdate}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
							<a href="/board/create">작성</a>
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
	</div>
</body>
</html>