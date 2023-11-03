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
<c:forEach items="${lists}" var="notice">
${notice.nid} / ${notice.ncategory} / <a href="/notice/readDetail?nid=${notice.nid}">${notice.ntitle}</a> / ${notice.nwriter} / ${notice.ndate}
<br>
</c:forEach>
</body>
</html>