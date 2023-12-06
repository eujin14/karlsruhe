<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
       <div class="content d-flex justify-content-center align-items-center">

              <div class="card mb-9">
                <div class="card-body">
                  <h1 class="lh-sm fs-2 fs-xxl-4 mb-2">회원 정보 수정</h1>
                  <div class="card mb-5 mb-xxl-7">
                    <div class="card-body">  
                          <div>
                            <div class="mb-3">
                              <div class="col-md-10">
                              <p class="lh-sm mb-0 text-700">아이디: ${member.username} </p>
                              <br>
                              <p class="lh-sm mb-0 text-700">비밀번호: ********** </p>
                               <br>
                              <p class="lh-sm mb-0 text-700">아이디: ${member.username} </p>
                               <br>
                              <p class="lh-sm mb-0 text-700">이름: ${member.uname}  </p>
                               <br>
                              <p class="lh-sm mb-0 text-700" >전화번호: ${member.utel} </p>
                               <br>
                              <p class="lh-sm mb-0 text-700">이메일: ${member.uemail}</p>
                               <br>
                              <p class="lh-sm mb-0 text-700">주소: ${member.uaddr}</p>
                              <br>
                              <p class="lh-sm mb-0 text-700">가입 날짜: ${member.udate}  </p>
                             </div>
                            </div>
                          </div>
                    </div>
                  </div>
                  <div class="row g-2">
                     <div class="col-12 col-sm-auto flex-sm-grow-1 flex-md-grow-0">
                      <button class="btn btn-phoenix-primary w-100" type="button"><a  href="/users/memberUpdate?username=${member.username}">회원수정</a></button>
                    </div>
                    <div class="col-12 col-sm-auto flex-sm-grow-1 flex-md-grow-0">
                      <button class="btn btn-phoenix-primary w-100" type="button"><a href="/users/updatePw?username=${member.username}">비밀번호 수정</a></button>
                    </div>
                    <div class="col-6 col-sm-auto">
                      <button class="btn btn-phoenix-primary w-100" type="button"><span ></span>로그아웃</button>
                    </div>
                    <div class="col-6 col-sm-auto">
                      <button class="btn btn-phoenix-primary w-100" type="button"><a href="/main">회원탈퇴 </a> </button>
                    </div>
                    <div class="col-6 col-sm-auto">
                      <button class="btn btn-phoenix-primary w-100" type="button"><a href="/main">처음으로 </a> </button>
                    </div>
                  </div>
                </div>
              </div>
              </div>
</body>
</html>