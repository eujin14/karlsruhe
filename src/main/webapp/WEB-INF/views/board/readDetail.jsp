<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>

</head>
<body>
	<sec:authentication property="principal" var="users" />
	<br>
	<br>
	<main id="main">
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
	<br>
	<br>
	<!-- ======= Blog Single Section ======= -->
<section id="portfolio-details" class="portfolio-details">
			<div class="container">
				<div class="row gy-4">
					<div class="col-lg-11">
						<div class="portfolio-info">
							<h3 style="padding-left: 1cm;">${board.btitle}</h3>
							<ul>
								<li class="d-flex align-items-center"><i
									class="bi bi-person" style="padding-left: 1cm;"></i>${board.bwriter}
									<i class="bi bi-clock" style="margin-left: 1cm;"></i>${board.bdate}
									<i class="bi bi-chat-dots" style="margin-left: 1cm;"></i>댓글
									${replyListsSize}</li>
							</ul>
							<div style="padding-left: 1cm;">
								<c:choose>
									<c:when test="${not empty board.bimage}">
										<br>
										<div class="entry-img">
											<img
												src="https://ekgkarlsruhe.cdn1.cafe24.com/board/${board.bimage}"
												style="width: 800px; height: auto;" class="img-fluid">
										</div>
									</c:when>
								</c:choose>
							</div>
							<br>
							<div class="entry-content" style="padding-left: 1cm;">
								<p>${board.bcontent}</p>
							</div>
							<br>
							<sec:authorize access="isAuthenticated()">
								<sec:authorize
									access="hasAuthority('ROLE_ADMIN') or ${board.bwriter == users.username}">
									<ul>
										<li class="d-flex align-items-center"
											style="padding-left: 1cm;"><i
											class="bi bi-pencil-square"></i><a
											href="/board/update?bno=${board.bno}">수정</a> <i
											class="bi bi-trash3" style="margin-left: 1cm;"></i><a
											href="/board/delete?bno=${board.bno}">삭제</a></li>
									</ul>
								</sec:authorize>
							</sec:authorize>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section style="padding: 0px" id="blog" class="blog">
			<div class="container" data-aos="fade-up">
				<div class="row">
					<div class="col-lg-11 entries">
						<div class="blog-comments">
							<h4 class="comments-count">댓글 ${replyListsSize}</h4>
							<c:forEach items="${replyList}" var="reply">
								<div id="comment-1" class="comment">
									<div class="d-flex">

										<div>
											<h5>${reply.bwriter}</h5>
											<time datetime="2020-01-01">${reply.bdate}</time>
											<p>${reply.bcontent}</p>
											<sec:authorize access="isAuthenticated()">

												<sec:authorize
													access="hasAuthority('ROLE_ADMIN') or ${reply.bwriter == users.username}">
													<h6>
														<a
															href="/board/deleteReply?bno=${reply.bno}&boardbno=${board.bno}"
															class="reply"
															style="text-decoration: none; color: #f03c02;"><i
															class="bi bi-trash3"></i>삭제</a>
													</h6>
												</sec:authorize>
											</sec:authorize>
										</div>
									</div>

								</div>
								<!-- End comment #1-->
							</c:forEach>
							<sec:authorize access="isAnonymous()">
								<p>*로그인 하셔야 댓글을 입력할 수 있습니다.
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<div class="reply-form">

									<form action="">

										<div class="row">
											<div class="col form-group">
												<textarea id="rbcontent" class="form-control"
													placeholder="댓글을 남겨주세요"></textarea>
											</div>
										</div>
										<input type="hidden" id="breply" name="breply"
											value="${board.bno}"> <input type="hidden"
											id="bwriter" name="bwriter" value="${users.username}">
										<a href="javascript:createReply()" class="btn btn-primary">등록
										</a>
									</form>
								</div>
							</sec:authorize>
						</div>
					</div>
				</div>
			</div>
		</section>
	<!-- End Blog Single Section -->
</main>

	<script>
		function createReply() {

			var breply = $("#breply").val();
			var bcontent = $("#rbcontent").val();
			var bwriter = $("#bwriter").val();

			var requestData = {
				breply : breply,
				bcontent : bcontent,
				bwriter : bwriter
			};

			$.ajax({
				type : "post",
				url : "/board/createReply",
				data : requestData,
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(result) {
					alert("댓글이 등록되었습니다.");
					window.location.reload();
				},
				error : function(request, status, error) {
				}
			});
		}
	</script>

	<!-- Template Main JS File -->
	<script src="/resources/assets/js/main.js"></script>
</body>

</html>