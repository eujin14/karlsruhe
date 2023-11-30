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

function createreply() {

	breply = $("#breply").val();
	bcontent = $("#rbcontent").val();
	bwriter = $("#bwriter").val();

	$.ajax({
		type : "post",
		url : "/board/createreply",
		data : {
			breply : breply,
			bcontent : bcontent,
			bwriter : bwriter
		},
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result) {
		},
		error : function(request, status, error) {
		}
	});
	location.reload(); 
	/* window.opener.location.href = "/main"; */
}

function count(bno) {
	
	$.ajax({
		type : "post",
		url : "/board/count",
		data : {
			bno : bno
		},
		beforeSend : function(xhr) {
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result) {
		},
		error : function(request, status, error) {
		}
	});
	location.reload(); 
	/* window.opener.location.href = "/main"; */
}

	</script>
</head>

<body>

 

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
                  <div class="comment-img"><img src="/resources/assets/img/blog/comments-1.jpg" alt=""></div>
                  <div>
                    <h5><a href="">${reply.bwriter}</a> <a href="/board/deleteReply?bno=${reply.bno}&boardbno=${board.bno}" class="reply"><i class="bi bi-x-square-fill"></i> 삭제</a></h5>
                    <time datetime="2020-01-01">01 Jan, 2020</time>
                    <p>${reply.bcontent}
                    </p>
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
                  <input type="hidden" id="breply" name="breply" value="${board.bno}">
                  <input type="hidden" id="bwriter" name="bwriter" value="user">
                  <a href="javascript:createReply()" class="btn btn-primary">등록</a>

                </form>

              </div>

            </div><!-- End blog comments -->

          </div><!-- End blog entries list -->

 
        </div>

      </div>
    </section><!-- End Blog Single Section -->

  </main><!-- End #main -->


  <!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>

</body>

</html>