<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사진 등록</title>

</head>
<body>
<br><br>
	<!-- 메인 -->
	<section id="breadcrumbs" class="breadcrumbs">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center">
				<h2>Gallery</h2>
				<ol>
					<li><a href="/">홈</a></li>
					<li><a href="/admin/update">메인사진</a></li>
					
				</ol>
			</div>

		</div>
	</section>
	<br>
	<div class="container">
		<div class="card shadow-none border border-300 my-4"
			data-component-card="data-component-card">
			<div class="card-header p-4 border-bottom border-300 bg-soft">
				<div class="row g-3 justify-content-between align-items-center">
					<div class="col-12 col-md">
						<h4 class="text-900 mb-0" data-anchor="data-anchor">사진 수정</h4>
					</div>
				</div>
			</div>
			<div class="card-body p-0">
				<div class="p-4 code-to-copy">



					<form id="check"
						action="/admin/update?${_csrf.parameterName}=${_csrf.token}"
						method="post" enctype="multipart/form-data">
		
						 <div class="row mb-3">
					        <label class="col-sm-2 col-form-label" for="image">첫번째 메인 사진</label>
					        <div class="col-sm-8">
					            <input class="form-control" id="image" name="image" value="${image}" type="file" />
					         <br>※ 개별 이미지의 파일 사이즈는 1Mbyte를 초과할 수 없습니다. 
					        </div>
					        <div class="col-sm-2">
					            <button class="btn btn-primary" type="submit" style="font-size: 14px;">수정</button>
					        						<img src="https://ekgkarlsruhe.cdn1.cafe24.com/main/${img1}" style="width: 120px; height: auto;" class="img-fluid">
					        
					        </div>
					    </div>
						<input type="hidden" name="timg" value="${img1}" />
						<input type="hidden" name="img" value="img1" />
					</form>

					<br>
					<form id="check"
						action="/admin/update?${_csrf.parameterName}=${_csrf.token}"
						method="post" enctype="multipart/form-data">
		
						 <div class="row mb-3">
					        <label class="col-sm-2 col-form-label" for="image">두번째 메인 사진</label>
					        <div class="col-sm-8">
					            <input class="form-control" id="image" name="image" value="${image}" type="file" />
					         <br>※ 개별 이미지의 파일 사이즈는 1Mbyte를 초과할 수 없습니다. 
					        </div>
					        <div class="col-sm-2">
					            <button class="btn btn-primary" type="submit" style="font-size: 14px;">수정</button>
					        <img src="https://ekgkarlsruhe.cdn1.cafe24.com/main/${img2}" style="width: 120px; height: auto;" class="img-fluid">
					        
					        </div>
					    </div>
					
								<input type="hidden" name="timg" value="${img2}" />
						<input type="hidden" name="img" value="img2" />
		
					</form>
					
					<br>
					<form id="check"
						action="/admin/update?${_csrf.parameterName}=${_csrf.token}"
						method="post" enctype="multipart/form-data">
		
						 <div class="row mb-3">
					        <label class="col-sm-2 col-form-label" for="image">세번째 메인 사진</label>
					        <div class="col-sm-8">
					            <input class="form-control" id="image" name="image" value="${image}" type="file" />
					         <br>※ 개별 이미지의 파일 사이즈는 1Mbyte를 초과할 수 없습니다. 
					        </div>
					        <div class="col-sm-2">
					            <button class="btn btn-primary" type="submit" style="font-size: 14px;">수정</button>
					          <img src="https://ekgkarlsruhe.cdn1.cafe24.com/main/${img3}" style="width: 120px; height: auto;" class="img-fluid">
					        
					        </div>
					    </div>
					
								<input type="hidden" name="timg" value="${img3}" />
						<input type="hidden" name="img" value="img3" />

					</form>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>