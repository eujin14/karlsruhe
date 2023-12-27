<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<br>
	<br>
	<!-- ======= Breadcrumbs ======= -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center">
				<h2>메인 사진 </h2>
				<ol>
					<li><a href="/">홈</a></li>
					<li><a href="/board/readList">자유게시판</a></li>
					<li>${board.btitle}</li>
				</ol>
			</div>

		</div>
	</section>
	<!-- End Breadcrumbs -->


	<div class="container">
		<div class="sidebar-item tags"
			style="display: flex; justify-content: flex-end;">
			<a href="/board/create"
				style="display: inline-block; padding: 10px 25px; border-radius: 4px; transition: 0.4s; margin: 10px; border: 2px solid #f03c02; color: #f03c02; background: #fff; margin-left: auto;"
				role="button">사진 목록</a>
		</div>
		<br>
		<div class="card shadow-none border border-300 mb-3"
			data-component-card="data-component-card">

			<div class="card-header p-4 border-bottom border-300 bg-soft">

				<div class="row g-3 justify-content-between align-items-center">
					<div class="col-12 col-md">
						<h5 class="card-title">글과 의견을 자유롭게 제시할 수 있는 게시판입니다.</h5>
						<p>비방성 글, 광고, 명예훼손의 우려가 있는 글 등 게시판 성격에 부합되지 않는 게시물은</p>
						<p>관리자 권한으로 통보없이 이동,삭제될 수 있습니다.</p>
					</div>
				</div>
			</div>

			<div class="card-body p-0">
				<div class="p-4 code-to-copy">
					<div id="tableExample3">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th class="sort border-top text-center ps-3" >번호</th>
										<th class="sort border-top text-center" >이미지이름</th>
									
									</tr>
								</thead>
								<tbody class="list" id="table-regions-by-revenue">
									<c:forEach items="${admin}" var="admin" varStatus="i">
										<tr>
											<td class="align-middle text-center ps-3 ">${admin.id}</td>
											<td class="align-middle text-center "><a href="/admin/readDetail?img=${admin.image}">${admin.image}</a></td>

										</tr>
									</c:forEach>
								</tbody>
							</table>
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