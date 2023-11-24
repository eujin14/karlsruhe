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
/* 댓글 등록 */

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
			window.location.reload();
			alert("댓글이 등록되었습니다.");
		},
		error : function(request, status, error) {
		}
	});
	window.location.reload();
	} 


</script>


</head>
<body>

   <table class="table">
      <thead class="table-light">
         <tr>
            <th>작성자 <b>${details.nwriter}</b>&nbsp;
               ${details.ndate}&nbsp;
              
            </th>
            
         </tr>
      </thead>
      <tbody>
         <tr>
         <td><img src="https://sasa724.cdn1.cafe24.com/notice/${details.nimage}"
            width="500" height="auto"></td></tr>
           <tr> <td>${details.ncontent}</td></tr>
         
         <tr>
            <td>
               <div class="row">
                  <div class="col-md">
                     <button onclick="location.href='/notice/readList'" class="form-control">목록</button>
                  </div>
                  <div class="col-md-9">
                  </div>
                  <div class="col-md">
                  <button onclick="location.href='/notice/update?nid=${details.nid}'" class="form-control">수정</button>
                  </div>
                  <div class="col-md">
                        <button onclick="location.href='/notice/delete?nid=${details.nid}'" class="form-control">삭제</button>                  
                  </div>
               </div>
            </td>
         </tr>
      </tbody>
   </table>









</body>
</html>