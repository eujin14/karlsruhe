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
				<h2>자유게시판</h2>
				<ol>
					<li><a href="/">홈</a></li>
					<li><a href="/board/readList">자유게시판</a></li>
					<li>${board.btitle}</li>
				</ol>
			</div>

		</div>
	</section>
	<!-- End Breadcrumbs -->




		
									<c:forEach items="${admin}" var="admin" >
										<a href="/admin/readDetail?id=${admin.id}">이미지 등록을 하시겠습니까?</a>
									</c:forEach>
								

	<!-- Template Main JS File -->
	<script src="/resources/assets/js/main.js"></script>
</body>
</html>