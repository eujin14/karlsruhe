<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</body>
</html>