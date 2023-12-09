<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <body>
    <main class="main" id="top">
      <div class="content">
        <h2 class="text-bold text-1100 mb-3	">Members</h2>
        <div id="members" data-list='{"valueNames":["username","uname","utel","uemail","uaddr","udate"],"page":10,"pagination":true}'>
          <div class="row align-items-center justify-content-between g-3 mb-4">
            <div class="col col-auto">
              <div class="search-box">
                <form class="position-relative" data-bs-toggle="search" data-bs-display="static">
                  <input class="form-control search-input search" type="search" placeholder="Search members" aria-label="Search" />
                  <span class="fas fa-search search-box-icon"></span>

                </form>
              </div>
            </div>
            <div class="col-auto">
              <div class="d-flex align-items-center">
                <button class="btn btn"><a  href="/admin/admin">관리자 페이지</a></button>
              </div>
            </div>
          </div>
          <div class="mx-n4 mx-lg-n6 px-4 px-lg-6 mb-9 bg-white border-y border-300 mt-2 position-relative top-1">
            <div class="table-responsive scrollbar ms-n1 ps-1">
              <table class="table table-sm fs--1 mb-0">
                <thead>
                  <tr>
                    <th class="sort align-middle" scope="col" data-sort="username" style="width:15%; min-width:200px;">아이디</th>
                    <th class="sort align-middle" scope="col" data-sort="uname" style="width:15%; min-width:200px;">이름</th>
                    <th class="sort align-middle pe-3" scope="col" data-sort="utel" style="width:20%; min-width:200px;">전화번호</th>
                    <th class="sort align-middle" scope="col" data-sort="uemail" style="width:10%;">이메일</th>
                    <th class="sort align-middle text-end" scope="col" data-sort="uaddr" style="width:21%;  min-width:200px;">주소</th>
                    <th class="sort align-middle text-end pe-0" scope="col" data-sort="udate" style="width:19%;  min-width:200px;">가입날짜</th>
                    <th class="sort align-middle text-end pe-0" scope="col"  style="width:19%;  min-width:200px;">삭제</th>
                  </tr>
                </thead>
                
                <tbody class="list" id="members-table-body">
                <c:forEach items="${members}" var="member">
                  <tr class="hover-actions-trigger btn-reveal-trigger position-static">
                    <td class="username align-middle white-space-nowrap"><h6 class="mb-0 ms-3 fw-semi-bold">${member.username}</h6></td>
                    <td class="uname align-middle white-space-nowrap"><a class="fw-semi-bold" >${member.uname}</a></td>
                    <td class="utel align-middle white-space-nowrap"><a class="fw-bold text-1100">${member.utel}</a></td>
                    <td class="uemail align-middle white-space-nowrap text-900"> ${member.uemail}</td>
                    <td class="uaddr align-middle text-end white-space-nowrap text-700">${member.uaddr}</td>
                    <td class="udate align-middle white-space-nowrap text-700 text-end">${member.udate}</td>
                    <td class="udate align-middle white-space-nowrap text-700 text-end"><a href="/users/memberDelete?username=${member.username}">삭제</a></td>
                  </tr>
                  
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <div class="row align-items-center justify-content-between py-2 pe-0 fs--1">
              <div class="col-auto d-flex">
                <p class="mb-0 d-none d-sm-block me-3 fw-semi-bold text-900" data-list-info="data-list-info"></p><a class="fw-semi-bold" href="#!" data-list-view="*">View all<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a><a class="fw-semi-bold d-none" href="#!" data-list-view="less">View Less<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a>
              </div>
              <div class="col-auto d-flex">
                <button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
                <ul class="mb-0 pagination"></ul>
                <button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
              </div>
            </div>
          </div>
        </div>
  
      </div>
    </main>

    


  </body>

</html>