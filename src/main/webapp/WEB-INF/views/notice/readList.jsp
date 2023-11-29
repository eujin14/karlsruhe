<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="/vendors/prism/prism-okaidia.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link href="/vendors/simplebar/simplebar.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css">
    <link href="/assets/css/theme-rtl.min.css" type="text/css" rel="stylesheet" id="style-rtl">
    <link href="/assets/css/theme.min.css" type="text/css" rel="stylesheet" id="style-default">
    <link href="/assets/css/user-rtl.min.css" type="text/css" rel="stylesheet" id="user-style-rtl">
    <link href="/assets/css/user.min.css" type="text/css" rel="stylesheet" id="user-style-default">
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

<body>
	<div class="card shadow-none border border-300 mb-3"
		data-component-card="data-component-card">
		<div class="card-header p-4 border-bottom border-300 bg-soft">
			<div class="row g-3 justify-content-between align-items-center">
				<div class="col-12 col-md">
					<h4 class="text-900 mb-0" data-anchor="data-anchor">공지 사항</h4>
				</div>
			</div>
		</div>
		<div class="card-body p-0">
		
			<!-- 공지사항중 내용과 카테고리를 검색어로 원하는 내용만 확인 할 수 있게함  -->
			<div class="p-4 code-to-copy">
				<div id="tableExample4"
					data-list='{"valueNames":["nid","ntitle","ncategory","ndate"],"page":10,"pagination":true,"filter":{"key":"ncategory"}}'>
					<div class="row justify-content-end g-0">

						<div class="search-box mb-3 mx-auto">
							<form class="position-relative" data-bs-toggle="search"
								data-bs-display="static">
								<input class="form-control search-input search form-control-sm"
									type="search" placeholder="검색어를 입력하세요" aria-label="Search" />
								<span class="fas fa-search search-box-icon"></span>
							</form>
						</div>
						<div class="col-auto px-3">
							<select class="form-select form-select-sm mb-3" id="ncategory"
								name="ncategory" data-list-filter="data-list-filter">

								<!-- 색깔로 카테고리를 구분하여 원하는 카테고리 클릭시 해당 카테고리만 보일 수 있게 함  -->
								<option selected="selected" value="warning">긴급공지</option>
								<option value="success">일반공지</option>
							</select>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table table-sm fs--1 mb-0 table-hover">
							<thead>
								<tr class="be-light">
									<th class="sort border-top ps-3" data-sort="nid">번호</th>
									<th class="sort border-top" data-sort="ncategory">종류</th>
									<th class="sort border-top" data-sort="ntitle">제목</th>
									<th class="sort border-top text-end pe-3" data-sort="ndate">작성일</th>
								</tr>
							</thead>

							<tbody class="list">
								<c:forEach items="${lists}" var="notice">

									<tr>
										<td class="align-middle ps-3 nno">${notice.nid}</td>
										<td class="align-middle ncategory">
										<c:choose>
										
												<c:when test="${notice.ncategory eq '긴급공지'}">

													<div
														class="badge badge-phoenix fs--2 badge-phoenix-warning">
														<span class="fw-bold">${notice.ncategory}</span> <span
															class="ms-1 fas fa-check"></span>
													</div>
												</c:when>
												
												<c:otherwise>
												
													<!-- 반대인 공지인 것은 초록색임 -->
													<div
														class="badge badge-phoenix fs--2 badge-phoenix-success">
														<span class="fw-bold">${notice.ncategory}</span> <span
															class="ms-1 fas fa-check"></span>
													</div>

												</c:otherwise>
											</c:choose></td>
										<td class="align-middle ntitle"><a
											href="/notice/readDetail?nid=${notice.nid}">${notice.ntitle}</a></td>
										<td class="align-middle ndate text-end py-3 pe-3">${notice.ndate}</td>
									</tr>
								</c:forEach>

							</tbody>
						</table>
						<sec:authentication property="principal" var="users" />

						<!-- 관리자일 경우에만 나타나는 메뉴 -->
						<sec:authorize access="hasAuthority('USER_ADMIN')">
							<a href="/notice/create">작성</a>
						</sec:authorize>

					</div>
					<div class="d-flex justify-content-between mt-3">
						<button class="page-link" data-list-pagination="prev">
							<span class="fas fa-chevron-left"></span>
						</button>
						<ul class="mb-0 pagination"></ul>
						<button class="page-link pe-0" data-list-pagination="next">
							<span class="fas fa-chevron-right"></span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

   <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="/vendors/popper/popper.min.js"></script>
    <script src="/vendors/bootstrap/bootstrap.min.js"></script>
    <script src="/vendors/anchorjs/anchor.min.js"></script>
    <script src="/vendors/is/is.min.js"></script>
    <script src="/vendors/fontawesome/all.min.js"></script>
    <script src="/vendors/lodash/lodash.min.js"></script>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
    <script src="/vendors/list.js/list.min.js"></script>
    <script src="/vendors/feather-icons/feather.min.js"></script>
    <script src="/vendors/dayjs/dayjs.min.js"></script>
    <script src="/vendors/prism/prism.js"></script>
    <script src="/assets/js/phoenix.js"></script>
    <script src="/vendors/list.js/list.min.js"></script>


</html>
    
