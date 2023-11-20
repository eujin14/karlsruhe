<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="/resources/css/header.css" type="text/css">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"
            integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
<br><h1>자유게시판</h1><br>

<!-- 게시물 목록 -->
   <table class="table table-hover">
         <tr>
            <th class="col-md">번호</th>
            <th class="col-md-8">제목</th>
            <th class="col-md-2">작성일</th>
         </tr>
         <c:forEach items="${photos}" var="photo">
         <tr>
            <td>${photo.pno}</td>
            <td><a class="title" href="/photo/readDetail?pno=${photo.pno}">${photo.ptitle}</a></td>
            <td>${photo.pdate}</td>
         </tr>
      </c:forEach>         
   </table>
   <!-- END 게시물 목록 -->
   <!-- paging -->
   <div align="center">
   
   
      <span> 
          
         
            &nbsp;<b class="text-primary">1</b>&nbsp;
         
      </span>
   
   
   </div>
   <!-- END paging -->
   <br>
   <div class="row">
      <!-- 검색 -->
      <div class="col-md-2">
         <select name="searchType" class="form-select">
            <option value="title" selected>제목</option>
            <option value="content" >내용</option>
            <option value="writer" >작성자</option>
         </select> 
      </div>
      <div class="col-md-3">
         <input type="text" name="keyword" class="form-control" value="" placeholder="검색어를 입력해주세요."/>
      </div>
      <div class="col-md">
         <button type="button" class="form-control" id="searchBtn">검색</button>
      </div>
      <!-- END 검색 -->
      <!-- 글작성버튼 -->
      <div class="col-md-4"></div>
      <div class="col-md-2">
      </div>
      <button onclick="location.href='/photo/create'" class="form-control">글작성</button>
		</div>
      <!-- END 글작성버튼 -->
      
   </div><br>
   <!-- END 메인 -->
   
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<script>
/* 검색 */
document.getElementById("searchBtn").onclick = function () {
   let searchType = document.getElementsByName("searchType")[0].value;
   let keyword =  document.getElementsByName("keyword")[0].value;
   
   location.href = "/photos/readList?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
};
/* window 특정 크기 이하일때(모바일) title 줄여서 뿌리기 */
window.onload = function() {
   if ($(window).width() < 770) {
      for(var i = 0; i < 10; i++){
         if(document.getElementsByClassName("title")[i].innerText.length>5){
            var title = document.getElementsByClassName("title")[i].innerText.slice(0,3);
            document.getElementsByClassName("title")[i].innerText= title + '...';
         }
      }
   }
}
</script>
</body>
</html>