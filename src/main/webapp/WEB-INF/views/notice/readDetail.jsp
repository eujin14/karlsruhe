<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
=======
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

>>>>>>> origin/sunghee
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<<<<<<< HEAD
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>

<!-- 댓글 생성 -->
	<script>
		function createReply() {

			npid = $("#npid").val();
			ncontent = $("#rncontent").val();
			nwriter = $("#nwriter").val();

			$.ajax({
				type : "POST",
				url : "/notice/createReply",
				data : {
					npid : npid,
					ncontent : ncontent,
					nwriter : nwriter
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(result) {
					alert("답변 등록 성공");
				},
				error : function(request, status, error) {
					alert("답변 등록 실패");
				}
			});
			location.reload();
		}
	</script>


=======
<link rel="stylesheet"
	href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>

<script>

function createReply() {

	npid = $("#npid").val();
	ncontent = $("#rncontent").val();
	nwriter = $("#nwriter").val();

	$.ajax({
		type : "post",
		url : "/notice/createReply",
		data : {
			npid : npid,
			ncontent : ncontent,
			nwriter : nwriter
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
<body>
<sec:authentication property="principal" var="users" />
>>>>>>> origin/sunghee

<div class="grid_4 alpha">
		<div class="block-3">
			
			<div class="text1 tx__1">${details.ntitle}</div>
			<img src="/images/page2_img1.jpg" alt="" class="img_inner">
			${details.ncontent}
		</div>
	</div>

<img src="https://sasa724.cdn1.cafe24.com/notice/${details.nimage}"
							width="500px" height="auto">

${details.nid} / ${details.ncategory} / ${details.ntitle} / ${details.ncontent} / ${details.nwriter} / ${details.ndate}
<br>

<<<<<<< HEAD
<form>

<div class="col-form-label">
										&nbsp;&nbsp;답변
<div>
<textarea class="form-control" id="rncontent"></textarea>
</div>
</div>

<input type="hidden" id="npid" name="npid" value="${details.nid}">
<input type="hidden" id="nwriter" name="nwriter"> 
<a href="javascript:createReply()" class="btn btn-outline-primary">등록</a>



  <input type="submit" value="등록">
</form> 

<a href="/notice/update?nid=${details.nid}" class="btn btn-outline-primary">수정</a>
<a href="/notice/delete?nid=${details.nid}" class="btn btn-outline-danger">삭제</a>
=======


<sec:authorize access="hasAuthority('USER_ADMIN')">
<a href="/notice/update?nid=${details.nid}" class="btn btn-outline-primary">수정</a>
<a href="/notice/delete?nid=${details.nid}" class="btn btn-outline-danger">삭제</a>
</sec:authorize>

<c:forEach items="${replyLists}" var="reply">

${reply.nwriter}/${reply.ncontent}


</c:forEach>

<div class="card-footer">

		<input type="hidden" id="npid" name="npid" value="${details.nid}">
		<input type="hidden" id="nwriter" name="nwriter"
			value="user">
		<div class="hstack gap-3">


			<input class="form-control me-auto" type="text" id="rncontent"
				placeholder="댓글을 작성하세요" /> <a href="javascript:createReply()"
				class="btn btn-success">댓글 작성<span
				class="fa-solid fa-paper-plane ms-1"></span></a>

		</div>
	</div>





>>>>>>> origin/sunghee

</body>
</html>