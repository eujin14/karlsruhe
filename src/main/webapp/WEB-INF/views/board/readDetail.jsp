<<<<<<< HEAD
<!-- name:sunghee kim
date:2023/09/12
mail: inew3w@gmail.com  -->

=======
>>>>>>> origin/sunghee
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
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>

<script>

function createreply() {

	breply = $("#breply").val();
	bcontent = $("#rbcontent").val();
	bwriter = $("#bwriter").val();

	$.ajax({
		type : "post",
		url : "/board/createreply",
		data : {
			breply : breply,
			bcontent : bcontent,
			bwriter : bwriter
		},
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result) {
		},
		error : function(request, status, error) {
		}
	});
	location.reload(); 
	/* window.opener.location.href = "/main"; */
}

<<<<<<< HEAD
function count(nno) {
=======
function count(bno) {
>>>>>>> origin/sunghee
	
	$.ajax({
		type : "post",
		url : "/board/count",
		data : {
			bno : bno
		},
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result) {
		},
		error : function(request, status, error) {
		}
	});
	location.reload(); 
	/* window.opener.location.href = "/main"; */
}

	</script>
</head>
<<<<<<< HEAD
	
	<br><h3>${board.btitle}</h3><br>
=======
<div class="container">
<sec:authentication property="principal" var="users" />
	<br><h3 style="color: white">${board.btitle}</h3><br>
>>>>>>> origin/sunghee
	<table class="table">
		<thead class="table-light">
			<tr>
				<th>작성자 <b>${board.bwriter}</b>&nbsp;
					${board.bdate}&nbsp;
					<a href="" onclick="count('${board.bno}')"><span
				class="text-900 fs-1 uil uil-thumbs-up"></span>${board.bcount}</a> 
				</th>
<<<<<<< HEAD
				<th></th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<th><img src="https://tjdgml789.cdn1.cafe24.com/board/${board.bimage}"
				width="1200" height="200"></th>
				<td>${board.bcontent}</td>
			</tr>
=======

			</tr>
		</thead>
		<tbody>        
         <tr>
			<tr>
			<td><img src="https://tjdgml789.cdn1.cafe24.com/board/${board.bimage}"  width="500" height="auto"></td>
			</tr>
			 <tr> <td>${board.bcontent}</td></tr>

>>>>>>> origin/sunghee
			<tr>
				<td>
					<div class="row">
						<div class="col-md">
							<button onclick="location.href='/board/readList'" class="form-control">목록</button>
						</div>
						<div class="col-md-9">
						</div>
						<div class="col-md">
						<button onclick="location.href='/board/update?bno=${board.bno}'" class="form-control">수정</button>
						</div>
						<div class="col-md">
                        <button onclick="location.href='/board/delete?bno=${board.bno}'" class="form-control">삭제</button>						
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
<!-- 질문내용 -->








<<<<<<< HEAD
<!-- 질문내용 -->
<sec:authentication property="principal" var="users" />
=======

>>>>>>> origin/sunghee



<!-- 댓글시작 -->
<<<<<<< HEAD
<div class="card flex-1 h-100 phoenix-offcanvas-container">
=======
<%-- <div class="card flex-1 h-100 phoenix-offcanvas-container">
>>>>>>> origin/sunghee
	<br>
	<c:forEach items="${replylist}" var="reply">
		<!-- 	댓글을 작성한 사람이 등록된 사람이면 오른쪽에 파란색으로 글이 나타남 -->
		<c:choose>
			<c:when test="${reply.bwriter == users.username}">
				<div class="d-flex chat-message">
					<div class="d-flex mb-2 justify-content-end flex-1">
						<div class="w-90 w-xxl-50">
							<div class="d-flex flex-end-center hover-actions-trigger">

								<div class="chat-message-content me-2">
									<div
										class="mb-1 sent-message-content light bg-primary rounded-2 p-2 text-white">
										<p class="mb-0">${reply.bcontent}</p>

									</div>

								</div>

							</div>
							<p class="mb-0 fs--2 text-600 fw-semi-bold">${reply.bdate}</p>
						</div>
					</div>
				</div>

			</c:when>
			<c:otherwise>
				<!-- 위와 반대일 경우에는 왼쪽에 댓글이 달림 - 이경우에는 작성자의 정보도 나오나 현재는 bran의 정보를 못가져와 모달을 숨김 ㅠ  -->
				<div class="d-flex chat-message">
					<div class="d-flex mb-2 flex-1">
						<div class="w-90 w-xxl-50">
							<div class="d-flex hover-actions-trigger">
								<div class="avatar avatar-m me-3 flex-shrink-0">
									<img class="rounded-circle"
										src="/resources/public/assets/img/team/20.webp" alt="" /> <span
										class="direct-chat-name float-left">${reply.bwriter}</span>
								</div>
								<div class="chat-message-content received me-2">
									<div class="mb-1 received-message-content border rounded-2 p-3">
										<p class="mb-0">${reply.bcontent}</p>
									</div>
								</div>



<<<<<<< HEAD
								<%-- <button class="btn btn-secondary me-1 mb-1" type="button"
=======
								<button class="btn btn-secondary me-1 mb-1" type="button"
>>>>>>> origin/sunghee
									data-bs-toggle="modal" data-bs-target="#verticallyCentered">${reply.nwriter}</button>
								<div class="modal fade" id="verticallyCentered" tabindex="-1"
									aria-labelledby="verticallyCenteredModalLabel"
									aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="verticallyCenteredModalLabel">${reply.btitle}&nbsp;&nbsp;점장</h5>
											</div>
											<div class="modal-body">
												<p class="text-700 lh-lg mb-0">
													댓글 작성자의 <a href="/bran/readdetail?bno=${reply.bno}">지점</a>의
													위치로 이동하시겠습니까?
												</p>
												<p class="text-700 lh-lg mb-0">이메일 ${reply.bmail}</p>
												<p class="text-700 lh-lg mb-0">phone ${reply.btel}</p>
											</div>
											<div class="modal-footer">
												<button class="btn btn-outline-danger" type="button"
													data-bs-dismiss="modal">취소</button>
											</div>
										</div>
									</div>
<<<<<<< HEAD
								</div> --%>
=======
								</div>
>>>>>>> origin/sunghee




							</div>
							<div class="text-end">
								<p class="mb-0 fs--2 text-600 fw-semi-bold ms-7">${reply.bdate}</p>

							</div>
						</div>




					</div>
				</div>

			</c:otherwise>
		</c:choose>

	</c:forEach>
	<!-- 댓글 입력하라는 칸 -->
	<div class="card-footer">

		<input type="hidden" id="breply" name="breply" value="${board.bno}">
		<input type="hidden" id="bwriter" name="bwriter"
			value="${users.username}">
		<div class="hstack gap-3">


			<input class="form-control me-auto" type="text" id="rbcontent"
				placeholder="댓글을 작성하세요" /> <a href="javascript:createreply()"
				class="btn btn-success">댓글 작성<span
				class="fa-solid fa-paper-plane ms-1"></span></a>

		</div>
	</div>




<<<<<<< HEAD
</div>




=======
</div> --%>



</div>
>>>>>>> origin/sunghee
</body>
</html>