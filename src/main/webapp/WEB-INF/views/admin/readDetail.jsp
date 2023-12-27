<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


</head>
<body>
	<sec:authentication property="principal" var="users" />
	<br>
	<br>
	<main id="main">
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<div class="d-flex justify-content-between align-items-center">
					<h2>Gallery</h2>
					<ol>
						<li><a href="/">홈</a></li>
						<li><a href="/admin/readList">Gallery</a></li>
					</ol>
				</div>

			</div>
		</section>
		<br>
		<br>
		<section id="portfolio-details" class="portfolio-details">
			<div class="container">
				<div class="row gy-4">
					<div class="col-lg-11">
						<div class="portfolio-info">

							<div style="padding-left: 1cm;">

										<br>
										<div class="entry-img">
											<img
												src="https://ekgkarlsruhe.cdn1.cafe24.com/main/${img.img1}"
												style="width: 800px; height: auto;" class="img-fluid">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>


	<!-- Template Main JS File -->
	<script src="/resources/assets/js/main.js"></script>
</body>

</html>