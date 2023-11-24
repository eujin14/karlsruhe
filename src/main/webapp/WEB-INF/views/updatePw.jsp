<!--
작성자 : 강세빈
작성일 : 2023-04-07
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <!-- Spring security로 인한 csrf 토큰 -->
    <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
    <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
    <title>비밀번호 변경</title>

    <!-- 부트스트랩 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <!-- jquery -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- 페이지 개별 적용 css -->
    <link rel="stylesheet" href="/resources/users/css/detailUpdate.css" type="text/css">
</head>
<body>
<section class="section">
    <div class="section_box">
        <div class="contact">
            <form id="submitForm" class="userForm" action="/updatePw?${_csrf.parameterName}=${_csrf.token}" method="post">
                <h3>비밀번호 변경</h3>
                <div class="container">
                    <div class="row g-3 align-items-center">
                        <div class="col">
                            <label for="currentPassword" class="col-form-label">현재 비밀번호 : </label>
                        </div>
                        <div class="col-6">
                            <input name="currentPassword" id="currentPassword" type="password" placeholder="현재 비밀번호"/>
                        </div>
                        <div class="col">
                        </div>
                    </div>
                    <div class="row g-3 align-items-center">
                        <div class="col">
                            <label for="password" class="col-form-label">새로운 비밀번호 : </label>
                        </div>
                        <div class="col-6">
                            <input name="password" id="password" type="password" placeholder="비밀번호"/>
                        </div>
                        <div class="col">
                        </div>
                    </div>
                    <div class="row g-3 align-items-center">
                        <div class="col">
                            <label for="ChkPassword" class="col-form-label">비밀번호 확인 : </label>
                        </div>
                        <div class="col-6">
                            <input name="ChkPassword" id="ChkPassword" type="password" placeholder="비밀번호 확인"/>
                        </div>
                        <div class="col">
                            <div id="validPassword" class="valid"></div>
                        </div>
                    </div>
                    <div class="BtnGroup">
                        <button type="button" class="submit">비밀번호 변경</button>
                        <a href="/users/memberDetail?username=${user.username}" type="button" class="button">취소</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<!-- 오류 모달 -->
<div class="modal" id="errorModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitle">모달 제목</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="modalContent">
                모달 본문
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- 페이지 개별 적용 js -->
<script type="text/javascript" src="/resources/users/js/updatePw.js"></script>
</body>
</html>

