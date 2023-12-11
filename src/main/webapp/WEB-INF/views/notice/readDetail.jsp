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
 <!-- Favicons -->
  <link href="/resources/assets/img/favicon.png" rel="icon">
  <link href="/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Muli:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Flattern
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

</head>
<body>
  <main id="main">
<br><br>
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2><a style="text-decoration: none; color: white;" href="/notice/readList">공지게시판</a></h2>
          <ol>
            <li><a style="text-decoration: none;" href="/">홈</a></li>
            <li><a style="text-decoration: none;" href="/notice/readList">공지사항</a></li>
            <li>${details.ntitle}</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Single Section ======= -->
    <sec:authentication property="principal" var="users"/> 
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row">

          <div class="col-lg-8 entries">

            <article class="entry entry-single">
            
              <div class="container">
               <h2 class="entry-title">
               ${details.ntitle}
              </h2>
              <div class="entry-meta">
                <ul>
                  <li class="d-flex align-items-center"><i class="bi bi-person"></i>관리자</li>
                  <li class="d-flex align-items-center"><i class="bi bi-clock"></i>${details.ndate}</li>
                  <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i>댓글 ${replyListsSize}</li>
                </ul>
              </div>
              <br>
              
              <div class="container" style="padding-left: 1cm;">
                <c:choose>
					<c:when test="${not empty details.nimage}">
					<br>
              <div class="entry-img">
               <img src="https://ekgkarlsruhe.cdn1.cafe24.com/notice/${details.nimage}"
            width="500" height="auto" class="img-fluid">
              </div>
              </c:when>
				</c:choose>
				
              </div>
              
              <div class="entry-content" style="padding-left: 6px;">
                <p>${details.ncontent}</p>
              </div>
            
              </div>
             <br>
          <sec:authorize access="hasAuthority('USER_ADMIN')">
              <div class="entry-footer" style="padding-left: 20px;">
                <i class="bi bi-pencil-square"></i>
                <ul class="tags">
                  <li><a style="text-decoration: none;" href="/notice/update?nid=${details.nid}">수정</a></li>
                </ul> &nbsp;&nbsp;
                <i class="bi bi-trash3"></i>
                <ul class="tags">
                 <li><a style="text-decoration: none;" href="/notice/delete?nid=${details.nid}">삭제</a></li>
                </ul>
              </div>
         </sec:authorize>

            </article><!-- End blog entry -->

            <div class="blog-comments">
            
            <h4 class="comments-count">댓글 ${replyListsSize}</h4>
           
            <c:forEach items="${replyLists}" var="reply">
              <div id="comment-1" class="comment">
                <div class="d-flex">
                 
                  <div>
                    <h5>${reply.nwriter}</h5> 
                    <time datetime="2020-01-01">${reply.ndate}</time>
                    <p>${reply.ncontent}
                    </p>
                    <sec:authorize access="hasAuthority('USER_ADMIN') or ${reply.nwriter == users.username}">
                    <h6><a href="/notice/deleteReply?nid=${reply.nid}&noticenid=${details.nid}" class="reply" style="text-decoration: none; color: #f03c02;"><i class="bi bi-trash3"></i>삭제</a></h6>
                    </sec:authorize>
                   </div>
                </div>
                
                </div><!-- End comment #1-->

             </c:forEach>

              <div class="reply-form">
                
                <form action="">
          
                  <div class="row">
                    <div class="col form-group">
                      <textarea id="rncontent" class="form-control" placeholder="댓글을 남겨주세요"></textarea>
                    </div>
                  </div>
                  <input type="hidden" id="npid" name="npid" value="${details.nid}">
                  <input type="hidden" id="nwriter" name="nwriter" value="${users.username}">
                  <a href="javascript:createReply()" class="btn btn-primary">등록</a>

                </form>

              </div>

            </div><!-- End blog comments -->

          </div><!-- End blog entries list -->

 
        </div>

      </div>
    </section><!-- End Blog Single Section -->

  </main><!-- End #main -->

 
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<script>
 function createReply() {

   var npid = $("#npid").val();
   var ncontent = $("#rncontent").val();
   var nwriter = $("#nwriter").val();
   
   var requestData = {
           npid: npid,
           ncontent: ncontent,
           nwriter: nwriter
   };

   $.ajax({
      type : "post",
      url : "/notice/createReply",
      data: requestData,
        beforeSend: function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function(result) {
            alert("댓글이 등록되었습니다.");
            window.location.reload();
        },
      error : function(request, status, error) {
      }
    });
 }
</script>
  <!-- Vendor JS Files -->
  <script src="/resources/assets/vendor/aos/aos.js"></script>
  <script src="/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/resources/assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="/resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>
</body>

</html>