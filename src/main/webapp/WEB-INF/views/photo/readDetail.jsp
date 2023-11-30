<!-- name:sunghee kim
date:2023/09/12
mail: inew3w@gmail.com  -->

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

<<<<<<< HEAD
<script>

function count(pno) {
	
	$.ajax({
		type : "post",
		url : "/photo/count",
		data : {
			pno : pno
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
	
	<br><h3>${photo.ptitle}</h3><br>
	<table class="table">
		<thead class="table-light">
			<tr>
				<th>작성자 <b>${photo.pwriter}</b>&nbsp;
					${photo.pdate}&nbsp;
					<a href="" onclick="count('${photo.pno}')"><span
				class="text-900 fs-1 uil uil-thumbs-up"></span>${photo.pcount}</a> 
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<th><img src="https://tjdgml789.cdn1.cafe24.com/photo/${photo.pcontent}"
				width="1200" height="200"></th>
			</tr>
			<tr>
				<td>
					<div class="row">
						<div class="col-md">
							<button onclick="location.href='/photo/readList'" class="form-control">목록</button>
						</div>
						<div class="col-md-9">
						</div>
						<div class="col-md">
						<button onclick="location.href='/photo/update?pno=${photo.pno}'" class="form-control">수정</button>
						</div>
						<div class="col-md">
                        <button onclick="location.href='/photo/delete?pno=${photo.pno}'" class="form-control">삭제</button>						
						</div>
					</div>
				</td>
			</tr>
		</tbody>
	</table>


=======
</head>
<%-- <sec:authentication property="principal" var="users" />
 --%>
<div class="card email-content">
	<div class="card-body overflow-hidden">

		<div class="d-flex flex-between-center pb-3 border-bottom mb-4">
			<a class="btn btn-link p-0 text-800 me-3" href="/photo/readList"><span
				class="fa-solid fa-angle-left fw-bolder fs-0"></span></a>
			<h3 class="flex-1 mb-0 lh-sm line-clamp-1">${photo.ptitle}</h3>

		</div>

		<div class="overflow-x-hidden scrollbar email-detail-content">
			<div class="row align-items-center gy-3 gx-0 mb-10">

				<div class="col-auto">
					<img class="me-2 rounded-circle"
						src="/resources/public/assets/img/team/60.webp"
						alt="/resources/public." width="48" height="48" />
				</div>
				<div class="col-auto flex-1">
					<div class="d-flex mb-1">
						<h5 class="mb-0 text-1000 me-2">관리자</h5>
						
					</div>
					<p class="mb-0 fs--1">
						<span class="text-600">to</span><span class="fw-bold text-800">
							Me </span><span class="text-1000 fw-semi-bold fs--2">${photo.pdate}</span><span
							class="fa-regular fa-star text-500"></span>
					</p>
				</div>
			</div>
			<img src="https://d121034.cdn1.cafe24.com/photo/${photo.pimage}"
				width="1200" height="200">

			<div class="text-1000 fs--1 w-100 w-md-75 mb-8">
				<p>${noti.ncontent}</p>
			</div>
			<a href="" onclick="pcount('${photo.pno}')"><span
				class="text-900 fs-1 uil uil-thumbs-up"></span>${photo.pcount}</a> 

			<!-- 관리자만 확인할 수 있는 수정과 삭제-->
			<sec:authorize access="hasAuthority('USER_ADMIN')">

				<div class="upde position-absolute bottom-0 end-0 "
					style="padding: 20px">
					<a href="/photo/update?pno=${photo.pno}"
						class="btn btn-info me-1 mb-1">수정</a> <a
						href="/photo/delete?pno=${photo.pno}"
						class="btn btn-danger me-1 mb-1">삭제</a>
				</div>
			</sec:authorize>

		</div>
	</div>

</div>
>>>>>>> origin/sunghee





</body>
</html>