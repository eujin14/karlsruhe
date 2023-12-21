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
	
	        <img src="https://ekgkarlsruhe.cdn1.cafe24.com/main1/${admin.image1}" width="500" height="auto" class="img-fluid">
	
	<script src="/resources/assets/js/main.js"></script>
</body>

</html>