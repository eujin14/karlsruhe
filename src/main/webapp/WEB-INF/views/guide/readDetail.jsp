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


${details.gid} / ${details.gimage} / ${details.gtitle} / ${details.gcontent} / ${details.gwriter} / ${details.gdate}
<br>



<a href="/guide/delete?gid=${details.gid}" class="btn btn-outline-danger">삭제</a>

</body>
</html>