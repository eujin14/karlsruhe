<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>공지게시판</h2>
          <ol>
            <li><a href="index.html">홈</a></li>
            <li><a href="/notice/readList">공지사항</a></li>
            <li>${details.ntitle}</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Single Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up">

        <div class="row">

          <div class="col-lg-8 entries">

            <article class="entry entry-single">
            
        
             
              
              <div class="container">
               <h2 class="entry-title">
               ${details.ntitle}
              </h2>
              <br>
              <div class="entry-img">
                <img src="https://sasa724.cdn1.cafe24.com/notice/${details.nimage}"
            width="500" height="auto" class="img-fluid">
              </div>
              </div>
              
              
              <div class="entry-meta">
                <ul>
                  <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="blog-single.html">관리자</a></li>
                  <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="blog-single.html">${details.ndate}</a></li>
                  <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="blog-single.html">12 Comments</a></li>
                </ul>
              </div>


              <div class="entry-content">
                <p>${details.ncontent}</p>

              </div>

              <div class="entry-footer">
                <i class="bi bi-folder"></i>
                <ul class="cats">
                  <li><a href="#">${details.ncategory}</a></li>
                </ul>

                <i class="bi bi-pencil-square"></i>
                <ul class="tags">
                  <li><a href="/notice/update?nid=${details.nid}">수정</a></li>
                </ul>
                <i class="bi bi-trash3"></i>
                <ul class="tags">
                 <li><a href="/notice/delete?nid=${details.nid}">삭제</a></li>
                </ul>
              </div>

            </article><!-- End blog entry -->

          

            <div class="blog-comments">
            
            <h4 class="comments-count">8 Comments</h4>
            
            
            <c:forEach items="${replyLists}" var="reply">
              <div id="comment-1" class="comment">
                <div class="d-flex">
                 
                  <div>
                    <h5>${reply.nwriter}</h5> 
                    <time datetime="2020-01-01">${reply.ndate}</time>
                    <p>${reply.ncontent}
                    </p>
                    <h6><a href="/notice/deleteReply?nid=${reply.nid}&noticenid=${details.nid}" class="reply"><i class="bi bi-trash3"></i>삭제</a></h6> 
                  </div>
                </div>

               

              </div><!-- End comment #1-->

             </c:forEach>

              <div class="reply-form">
                
                <form action="">
                  <!-- <div class="row">
                    <div class="col-md-6 form-group">
                      <input name="name" type="text" class="form-control" placeholder="Your Name*">
                    </div>
                   
                  </div> -->
                  
                  <div class="row">
                    <div class="col form-group">
                      <textarea id="rncontent" class="form-control" placeholder="댓글을 남겨주세요"></textarea>
                    </div>
                  </div>
                  <input type="hidden" id="npid" name="npid" value="${details.nid}">
                  <input type="hidden" id="nwriter" name="nwriter" value="user">
                  <a href="javascript:createReply()" class="btn btn-primary">등록</a>

                </form>

              </div>

            </div><!-- End blog comments -->

          </div><!-- End blog entries list -->

 
        </div>

      </div>
    </section><!-- End Blog Single Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>Flattern</h3>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br><br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
            </p>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Join Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>
          </div>

        </div>
      </div>
    </div>

    <div class="container d-md-flex py-4">

      <div class="me-md-auto text-center text-md-start">
        <div class="copyright">
          &copy; Copyright <strong><span>Flattern</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
          <!-- All the links in the footer should remain intact. -->
          <!-- You can delete the links only if you purchased the pro version. -->
          <!-- Licensing information: https://bootstrapmade.com/license/ -->
          <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/ -->
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div>
      <div class="social-links text-center text-md-right pt-3 pt-md-0">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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
    
   
</body>

</html>