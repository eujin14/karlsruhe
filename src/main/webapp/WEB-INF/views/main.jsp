<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">

 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
      <link href="/resources/assets/css/style.css" rel="stylesheet">
    
<body>
  <!-- ======= Hero Section ======= -->
  <section id="hero">
    <div id="heroCarousel" data-bs-interval="5000" class="carousel slide carousel-fade" data-bs-ride="carousel">

       <div class="carousel-inner" role="listbox">
        <!-- Slide 1 -->
        <div class="carousel-item active">
            <img src="https://ekgkarlsruhe.cdn1.cafe24.com/main1/image1.jpg" class="img-fluid" style="object-fit: contain; width: 100%; height: 100%;" alt="Slide 1">
            <div class="carousel-container">
                <!-- Your additional content goes here -->
            </div>
        </div>

        <!-- Slide 2 -->
        <div class="carousel-item">
            <img src="https://ekgkarlsruhe.cdn1.cafe24.com/main2/image2.jpg" class="img-fluid" style="object-fit: contain; width: 100%; height: 100%;" alt="Slide 2">
            <div class="carousel-container">
                <!-- Your additional content goes here -->
            </div>
        </div>

        <!-- Slide 3 -->
        <div class="carousel-item">
            <img src="https://ekgkarlsruhe.cdn1.cafe24.com/main3/image3.jpg" class="img-fluid" style="object-fit: contain; width: 100%; height: 100%;" alt="Slide 3">
            <div class="carousel-container">
                <!-- Your additional content goes here -->
            </div>
        </div>
    </div>

      <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bx bx-left-arrow" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bx bx-right-arrow" aria-hidden="true"></span>
      </a>

      <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

    </div>
  </section><!-- End Hero -->

  <main id="main">


    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
      <div class="container">

        <div class="row">
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up">
              <div class="icon"><i class="bi bi-briefcase"></i></div>
              <h4 class="title"><a href="/greetings">교회 소개</a></h4>
              <p class="description">교회 소개클릭시 목사님 말씀을 보실수 있습니다.</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
              <div class="icon"><i class="bi bi-card-checklist"></i></div>
              <h4 class="title"><a href="/notice/readList">공지사항</a></h4>
              <p class="description">공지사항 사항 클릭시 보실수 있습니다.</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
              <div class="icon"><i class="bi bi-bar-chart"></i></div>
              <h4 class="title"><a href="/weekly/readList">주보</a></h4>
              <p class="description">주보 클릭시 보시 수 있습니다.</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
              <div class="icon"><i class="bi bi-binoculars"></i></div>
              <h4 class="title"><a href="/photo/readList">갤러리</a></h4>
              <p class="description">갤러리는 클릭시 보실 수 있습니다.</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
              <div class="icon"><i class="bi bi-brightness-high"></i></div>
              <h4 class="title"><a href="https://m.facebook.com/ka.kirche.1/?wtsid=rdr_005bIJ7zmwinrMVDe">facebook</a></h4>
              <p class="description">facebook을 클릭시  홈페이지로 이동합니다</p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div class="icon-box" data-aos="fade-up" data-aos-delay="400">
              <div class="icon"><i class="bi bi-calendar4-week"></i></div>
              <h4 class="title"><a href="https://youtube.com/@evangelischekoreanischegem8605">youtube</a></h4>
              <p class="description">youtube 클릭시 동영상을 보실수 있습니다</p>
            </div>
          </div>
        </div>

      </div>
    </section><!-- End Services Section -->
  </main>

  
</body>

</html>