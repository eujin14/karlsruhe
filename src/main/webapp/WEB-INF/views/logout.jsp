<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Phoenix</title>


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="/resources/public/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/resources/public/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/public/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="/resources/public/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="/resources/public/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="/resources/public/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">
    <script src="/resources/public/vendors/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="/resources/public/vendors/simplebar/simplebar.min.js"></script>
    <script src="/resources/public/assets/js/config.js"></script>


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
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
  </head>


  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div class="row vh-100 g-0">
        <div class="col-lg-6 position-relative d-none d-lg-block">
          <div class="bg-holder" style="background-image:url(/resources/public/assets/img/bg/31.png);">
          </div>
          <!--/.bg-holder-->

        </div>
        <div class="col-lg-6">
          <div class="row flex-center h-100 g-0 px-4 px-sm-0">
            <div class="col col-sm-6 col-lg-7 col-xl-6">
              <div class="text-center mb-6 mx-auto"><img class="mb-7 d-dark-none" src="/resources/public/assets/img/spot-illustrations/1.png" alt="phoenix" /><img class="mb-7 d-light-none" src="/resources/public/assets/img/spot-illustrations/dark_1.png" alt="phoenix" />
                <div class="mb-6">
                  <h4 class="text-1000">로그아웃</h4>
                  <p class="text-700">정말 로그아웃 하시겠습니까?<br class="d-lg-none" /></p>
                </div>
                <form action="/logout" method="post">
                <input type="submit" value="로그아웃">
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              </form>
              </div>
            </div>
          </div>
        </div>
      </div>
     
    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
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

  </body>

</html>