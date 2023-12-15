<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Flattern Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

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
  <link href="/resources/assets/css/style.css" rel="stylesheet">


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
<tiles:insertAttribute name="menu"/>

<script>
	var navbarVertical = document.querySelector('.navbar-vertical');
	navbarVertical.remove();
	navbarTop.removeAttribute('style');
</script>

<a href= "#" id="toTop" class="fa fa-angle-up"></a>

<!--  <div class="content"> -->
<tiles:insertAttribute name="content"/>
<tiles:insertAttribute name="footer"/>
<!-- </div>  -->

 <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>



<!-- 피닉스 -->
<script>
	var navbarTopStyle = window.config.config.phoenixNavbarTopStyle;
	var navbarTop = document.querySelector('.navbar-top');
	if (navbarTopStyle === 'darker') {
	navbarTop.classList.add('navbar-darker');
	}

	var navbarVerticalStyle = window.config.config.phoenixNavbarVerticalStyle;
	var navbarVertical = document.querySelector('.navbar-vertical');
	if (navbarVertical && navbarVerticalStyle === 'darker') {
	navbarVertical.classList.add('navbar-darker');
	}
</script>

  
  <!-- 피닉스   -->
  <script src="/resources/assets/js/main.js"></script>
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