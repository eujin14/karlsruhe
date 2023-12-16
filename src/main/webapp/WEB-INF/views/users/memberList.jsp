<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
   uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   
</head>
<body>
<sec:authentication property="principal" var="users" />
<br><br>
    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>회원목록</h2>
          <ol>
            <li><a href="/">홈</a></li>
            <li><a>회원목록</a></li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->


<div class="container">
<div class="sidebar-item tags" style="display: flex; justify-content: flex-end;">
    <a href="/admin/admin" style="display: inline-block; padding: 10px 25px; border-radius: 4px; transition: 0.4s; margin: 10px; border: 2px solid #f03c02; color: #f03c02; background: #fff; margin-left: auto;" role="button">관리자 페이지</a>
</div>
<br>
<div class="card shadow-none border border-300 mb-3"
		data-component-card="data-component-card">

		<div class="card-header p-4 border-bottom border-300 bg-soft">
		
		<div class="row g-3 justify-content-between align-items-center">
		<div class="col-12 col-md">
<h5 class="card-title">관리자만 볼 수 있는 게시판 입니다.</h5>
              <p>회원목록에서 삭제 클릭시 회원탈퇴할수 있습니다.</p><p></p>
              </div>
			</div>
		</div>
	
<div class="card-body p-0">
<div class="p-4 code-to-copy">
<div id="tableExample3" data-list='{"valueNames":["username","uname","utel","uemail","uaddr","udate"],"page":5,"pagination":true,"filter":{"key":"username"}}'>
  <div class="row justify-content-end g-0">
  <div class="search-box mb-3 mx-auto">
    <form class="position-relative" data-bs-toggle="search" data-bs-display="static">
       <span class="fas fa-search search-box-icon"></span><input class="form-control search-input search form-control-sm" type="search" placeholder="Search" aria-label="Search" />
     
    </form>
  </div>
  </div>
  <div class="table-responsive">
    <table class="table table-hover">
      <thead>
        <tr>
          <th class="sort border-top text-center ps-3" data-sort="username">아이디</th>
          <th class="sort border-top text-center" data-sort="uname">이름</th>
          <th class="sort border-top text-center" data-sort="utel">전화번호</th>
          <th class="sort border-top text-center" data-sort="uemail">이메일</th>
          <th class="sort border-top text-center" data-sort="uaddr">주소</th>
          <th class="sort border-top text-center text-end pe-3" scope="col" data-sort="udate">가입날짜</th>
          <th class="sort border-top text-center text-end pe-3" scope="col">삭제</th>
         </tr>
      </thead>
      <tbody class="list" id="table-regions-by-revenue">
        <c:forEach items="${members}" var="member">
        <tr>
          <td class="align-middle text-center ps-3 username">${member.username}</td>
          <td class="align-middle text-center uname">${member.uname}</td>
          <td class="align-middle text-center utel">${member.utel}</td>
          <td class="align-middle text-center uemail">${member.uemail}</td>
          <td class="align-middle text-center uaddr">${member.uaddr}</td>
          <td class="align-middle text-center text-end py-3 pe-3">${member.udate}</td>
          <td class="align-middle text-center text-end py-3 pe-3"><a href="/users/memberDelete?username=${member.username}">삭제</a></td>
        </tr>
        </c:forEach>
      </tbody>
    </table>
    </div>
   
<div class="d-flex justify-content-between mt-3">
         <span class="d-none d-sm-inline-block"
            data-list-info="data-list-info"></span>
         <div class="d-flex">
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
</div>
</div>
<!-- Template Main JS File -->
  <script src="/resources/assets/js/main.js"></script>
</body>
</html>