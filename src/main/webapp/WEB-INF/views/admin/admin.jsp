<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
</head>

<body>
<br><br>


    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>관리자 페이지</h2>
          <ol>
            <li><a href="/">Home</a></li>
            <li>관리자 페이지</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up">
              <div class="icon"><i class="bi bi-briefcase"></i></div>
              <h4 class="title"><a href="/admin/create">메인 사진 관리 1</a></h4>
              <h4 class="title"><a href="/admin/create2">메인 사진 관리 2</a></h4>
              <h4 class="title"><a href="/admin/create3">메인 사진 관리 3</a></h4>
              <p class="description">메인 화면 사진 수정 가능합니다</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
              <div class="icon"><i class="bi bi-card-checklist"></i></div>
              <h4 class="title"><a href="/users/memberList">회원 목록</a></h4>
              <p class="description">회원 목록/삭제/수정</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
              <div class="icon"><i class="bi bi-bar-chart"></i></div>
              <h4 class="title"><a href="/notice/create">공지사항</a></h4>
              <p class="description">공지사항 등록/수정 /삭제 가능합니다</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
              <div class="icon"><i class="bi bi-binoculars"></i></div>
              <h4 class="title"><a href="/weekly/create">주보 </a></h4>
              <p class="description">주보  등록/수정 /삭제 가능합니다</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
              <div class="icon"><i class="bi bi-brightness-high"></i></div>
              <h4 class="title"><a href="/board/readList">자유 게시판</a></h4>
              <p class="description">가입한 회원들이 자유롭게 이용하는 게시판</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
              <div class="icon"><i class="bi bi-calendar4-week"></i></div>
              <h4 class="title"><a href="/photo/readList">포토 게시판</a></h4>
              <p class="description">교회 활동사진 등록 /수정/삭제 가능합니다</p>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Services Section -->
  
      <script src="/resources/assets/js/main.js"></script>

</body>

</html>

 