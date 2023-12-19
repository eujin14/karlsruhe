<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<body>
  <main id="main">
<br><br>
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2><a style="text-decoration: none; color: white;" href="/weekly/readList">주보게시판</a></h2>
          <ol>
            <li><a style="text-decoration: none;" href="/">홈</a></li>
            <li><a style="text-decoration: none;" href="/weekly/readList">주보</a></li>
            <li>${details.gtitle}</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Single Section ======= -->
    <sec:authentication property="principal" var="users"/> 
    <section id="blog" class="blog">
      <div class="container d-flex align justify-content-center" data-aos="fade-up">

        <div class="row w-75 h-auto">

         

            <article class="entry entry-single">
            
              <div class="container">
               <h2 class="entry-title">
               ${details.gtitle}
              </h2>
              <div class="entry-meta">
                <ul>
                  <li class="d-flex align-items-center"><i class="bi bi-person"></i>관리자</li>
                  <li class="d-flex align-items-center"><i class="bi bi-clock"></i>${details.gdate}</li>
                </ul>
              </div>
              <br>
              
            
              
              <div class="entry-content" style="padding-left: 6px;">
                <p>${details.gcontent}</p>
              </div>
            
              </div>
             <br>
          <sec:authorize access="hasAuthority('ROLE_ADMIN')">
              <div class="entry-footer" style="padding-left: 20px;">
                <i class="bi bi-pencil-square"></i>
                <ul class="tags">
                  <li><a style="text-decoration: none;" href="/weekly/update?gid=${details.gid}">수정</a></li>
                </ul> &nbsp;&nbsp;
                <i class="bi bi-trash3"></i>
                <ul class="tags">
                 <li><a style="text-decoration: none;" href="/weekly/delete?gid=${details.gid}">삭제</a></li>
                </ul>
              </div>
         </sec:authorize>

            </article><!-- End blog entry -->



 
        </div>

      </div>
    </section><!-- End Blog Single Section -->

  </main><!-- End #main -->

 
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


  <!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>
</body>

</html>
