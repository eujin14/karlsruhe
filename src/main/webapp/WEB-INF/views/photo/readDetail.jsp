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







</body>
</html>