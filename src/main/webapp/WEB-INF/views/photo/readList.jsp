<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>

<!-- Template Main CSS File -->
<link href="/resources/assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Flattern
  * Updated: Sep 18 2023 with Bootstrap v5.3.2
  * Template URL: https://bootstrapmade.com/flattern-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<sec:authentication property="principal" var="users" />
	<br>
	<br>
	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<div class="d-flex justify-content-between align-items-center">
					<h2>Gallery</h2>
					<ol>
						<li><a href="/">홈</a></li>
						<li><a href="/photo/readList">Gallery</a></li>
						<li>${photo.ptitle}</li>
					</ol>
				</div>

			</div>
		</section>

		<!-- ======= Portfolio Section ======= -->
		<section id="portfolio" class="portfolio">
			<div class="container">
				<div class="sidebar-item tags"
					style="display: flex; justify-content: flex-end;">
					<a href="/photo/create"
						style="display: inline-block; padding: 10px 25px; border-radius: 2px; transition: 0.4s; margin: 10px; border-radius: 4px; border: 2px solid #f03c02; color: #f03c02; background: #fff;"
						role="button">사진 등록</a>
				</div>
				<div class="row portfolio-container" data-aos="fade-up">
					<c:out value="${photo.pimage}" />
					<c:forEach items="${photos}" var="photo">
						<div class="col-lg-4 col-md-6 portfolio-item filter-web">
							<div class="portfolio-img-container">
								<img
									src="https://ekgkarlsruhe.cdn1.cafe24.com/photo/${photo.pimage}"
									class="img-fluid portfolio-img" alt=""
									style="width: 400px; height: 300px;">
							</div>
							<div class="portfolio-info">
								<h4>${photo.ptitle}</h4>
								<a href="/photo/readDetail?pno=${photo.pno}"
									class="details-link" title="More Details"><i
									class="bx bx-link"></i></a>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</section>
		<!-- End Portfolio Section -->

	</main>
	<!-- End #main -->




	<!-- Template Main JS File -->
	<script src="/resources/assets/js/main.js"></script>

</body>

</html>