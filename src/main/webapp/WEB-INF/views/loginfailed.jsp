<!-- 
name : yu jin KIM
date : 2023/09/29
mail : gkdlel9254 @ gmail.com 
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  
  	<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.11.5/lib/main.css' rel='stylesheet' />
	<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.11.5/lib/main.js'></script>

	<link rel="apple-touch-icon" sizes="180x180" href="/resources/public/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/images/logo7.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/images/logo7.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/images/logo8.ico">
    <link rel="manifest" href="/resources/public/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="/resources/public/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="/resources/public/vendors/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="/resources/public/vendors/simplebar/simplebar.min.js"></script>
    <script src="/resources/public/assets/js/config.js"></script>
    
    <script>
      document.documentElement.classList.add('navbar-horizontal');
    </script>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link href="/resources/public/vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link href="/resources/public/assets/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl">
    <link href="/resources/public/assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
    <link href="/resources/public/assets/css/user-rtl.min.css" type="text/css" rel="stylesheet" id="user-style-rtl">
    <link href="/resources/public/assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
    
    <script>
      var phoenixIsRTL = window.config.config.phoenixIsRTL;
      if (phoenixIsRTL) {
        var linkDefault = document.getElementById('style-default');
        var userLinkDefault = document.getElementById('user-style-default');
        linkDefault.setAttribute('disabled', true);
        userLinkDefault.setAttribute('disabled', true);
        document.querySelector('html').setAttribute('dir', 'rtl');
      } else {
        var linkRTL = document.getElementById('style-rtl');
        var userLinkRTL = document.getElementById('user-style-rtl');
        linkRTL.setAttribute('disabled', true);
        userLinkRTL.setAttribute('disabled', true);
      }
    </script>
  
  <link href="/resources/public/vendors/leaflet/leaflet.css" rel="stylesheet">
    <link href="/resources/public/vendors/leaflet.markercluster/MarkerCluster.css" rel="stylesheet">
    <link href="/resources/public/vendors/leaflet.markercluster/MarkerCluster.Default.css" rel="stylesheet">
  </head>


  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div class="container-fluid bg-300 dark__bg-1200">
        <div class="bg-holder bg-auth-card-overlay" style="background-image:url(/resources/public/assets/img/bg/37.png);">
        </div>
        <!--/.bg-holder-->

        <div class="row flex-center position-relative min-vh-100 g-0 py-5">
          <div class="col-11 col-sm-10 col-xl-8">
            <div class="card border border-200 auth-card">
              <div class="card-body pe-md-0">
                <div class="row align-items-center gx-0 gy-7">
                  <div class="col-auto bg-100 dark__bg-1100 rounded-3 position-relative overflow-hidden auth-title-box">
                    <div class="bg-holder" style="background-image:url(/resources/public/assets/img/bg/38.png);">
                    </div>
                    <!--/.bg-holder-->

                    <div class="position-relative px-4 px-lg-7 pt-7 pb-7 pb-sm-5 text-center text-md-start pb-lg-7">
                      <h3 class="mb-3 text-black fs-1">로그인 실패</h3>
                      <p class="text-700">로그인에 실패 하였습니다!! <br> 3가지 방법을 시도해 주세요.</p>
                      <ul class="list-unstyled mb-0 w-max-content w-md-auto mx-auto">
                        <li class="d-flex align-items-center"><span class="uil uil-check-circle text-success me-2"></span><span class="text-700 fw-semi-bold">로그인 하기</span></li>
                        <li class="d-flex align-items-center"><span class="uil uil-check-circle text-success me-2"></span><span class="text-700 fw-semi-bold">회원 가입 하기</span></li>
                        <li class="d-flex align-items-center"><span class="uil uil-check-circle text-success me-2"></span><span class="text-700 fw-semi-bold">아이디 비밀 번호 찾기</span></li>
                      </ul>
                    </div>
                    <div class="position-relative z-index--1 mb-6 d-none d-md-block text-center mt-md-15"><img class="auth-title-box-img d-dark-none" src="/resources/public/assets/img/spot-illustrations/auth.png" alt="" /><img class="auth-title-box-img d-light-none" src="/resources/public/assets/img/spot-illustrations/auth-dark.png" alt="" /></div>
                  </div>
                  <div class="col mx-auto">
                    <div class="auth-form-box">
                      <div class="text-center mb-6 mx-auto"><img class="mb-7 d-dark-none" src="/resources/public/assets/img/spot-illustrations/1.png" alt="phoenix" /><img class="mb-7 d-light-none" src="/resources/public/assets/img/spot-illustrations/dark_1.png" alt="phoenix" />
                        <div class="mb-6">
                          <h4 class="text-1000">로그인 실패</h4>
                          <!-- <p class="text-700">로그인을 실패 했습니다<br><br class="d-lg-none" /><br class="d-sm-none" />회원 가입 & 로그인을 다시 해주세요</p> -->
                        </div>
                        <div class="d-grid"><a class="btn btn-primary" href="/login"><span class="fas fa-angle-left me-2"></span>로그인 하러 가기</a></div>
                        <br><br>
                        <div class="d-grid"><a class="btn btn-primary" href="/users/create"><span class="fas fa-angle-left me-2"></span>회원 가입 하러가기</a></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </main>



<script src="/resources/public/vendors/popper/popper.min.js"></script>
    <script src="/resources/public/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="/resources/public/vendors/anchorjs/anchor.min.js"></script>
    <script src="/resources/public/vendors/is/is.min.js"></script>
    <script src="/resources/public/vendors/fontawesome/all.min.js"></script>
    <script src="/resources/public/vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="/resources/public/vendors/list.js/list.min.js"></script>
    <script src="/resources/public/vendors/feather-icons/feather.min.js"></script>
    <script src="/resources/public/vendors/dayjs/dayjs.min.js"></script>
    <script src="/resources/public/assets/js/phoenix.js"></script>
    <script src="/resources/public/vendors/echarts/echarts.min.js"></script>
    <script src="/resources/public/vendors/leaflet/leaflet.js"></script>
    <script src="/resources/public/vendors/leaflet.markercluster/leaflet.markercluster.js"></script>
    <script src="/resources/public/vendors/leaflet.tilelayer.colorfilter/leaflet-tilelayer-colorfilter.min.js"></script>
    <script src="/resources/public/assets/js/ecommerce-dashboard.js"></script>

  </body>

</html>