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


${details.nid} / ${details.ncategory} / ${details.ntitle} / ${details.ncontent} / ${details.nwriter} / ${details.ndate}
<br>

<!-- <form action="/notice/createReply" method="post">
>
  <input type="submit" value="등록">
</form> -->

<a href="/notice/delete?nid=${details.nid}" class="btn btn-outline-danger">삭제</a>

</body>
</html>