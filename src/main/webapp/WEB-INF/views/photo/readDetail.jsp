<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
   crossorigin="anonymous"></script>


</head>
<body>
<sec:authentication property="principal" var="users" />
<br><br><br>
       <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>gallery</h2>
          <ol>
            <li><a href="/main">홈</a></li>
            <li><a href="/photo/readList">gallery</a></li>
            <li>${photo.ptitle}</li>
          </ol>
        </div>

      </div>
    </section>
<br><br>
    <!-- ======= Blog Single Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row">

          <div class="col-lg-8 entries">

            <article class="entry entry-single">
            
              <div class="container">
               <h2 class="entry-title">
               ${photo.ptitle}
              </h2>
              <div class="entry-meta">
                <ul>
                  <li class="d-flex align-items-center"><i class="bi bi-person"></i>${photo.pwriter}</li>
                  <li class="d-flex align-items-center"><i class="bi bi-clock"></i>${photo.pdate}</li>
                </ul>
              </div>
              <br>
              
              <div class="container" style="padding-left: 1cm;">
                <c:choose>
               <c:when test="${not empty photo.pimage}">
               <br>
              <div class="entry-img">
               <img src="https://ekgkarlsruhe.cdn1.cafe24.com/photo/${photo.pimage}"
	            width="500" height="auto" class="img-fluid">
              </div>
              </c:when>
            </c:choose>
            
              </div>
              
              <div class="entry-content" style="padding-left: 6px;">
                <p>${photo.pcontent}</p>
              </div>
            
              </div>
             <br>
             <c:choose>
            <c:when test="${photo.pwriter == users.username||users.username=='admin'}">
             
              <div class="entry-footer" style="padding-left: 20px;">
                <i class="bi bi-pencil-square"></i>
                <ul class="tags">
                  <li><a href="/photo/update?pno=${photo.pno}">수정</a></li>
                </ul> &nbsp;&nbsp;
                <i class="bi bi-trash3"></i>
                <ul class="tags">
                 <li><a href="/photo/delete?pno=${photo.pno}">삭제</a></li>
                </ul>
              </div>
              </c:when>
              </c:choose>

            </article><!-- End blog entry -->


          </div><!-- End blog entries list -->

 
        </div>

      </div>
    </section><!-- End Blog Single Section -->


 
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</body>

</html>