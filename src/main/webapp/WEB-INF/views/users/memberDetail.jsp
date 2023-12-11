	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Then include Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
  .card {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    transition: transform 0.3s;
  }

  .card:hover {
    transform: scale(1.02);
  }
</style>
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
                      <button class="btn btn-phoenix-primary w-100" type="button"><a href="/logout">로그아웃 </a></button>
                    </div>
                     <div class="col-6 col-sm-auto">
                        <button class="btn btn-phoenix-primary w-100" type="button" data-toggle="modal" data-target="#withdrawalModal">회원탈퇴 </button>
                    </div>
                    <div class="col-6 col-sm-auto">
                      <button class="btn btn-phoenix-primary w-100" type="button"><a href="/">처음으로 </a> </button>
                    </div>
                  </div>
                </div>
              </div>
              </div>
              
  <div class="modal" id="withdrawalModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">회원 탈퇴</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    회원을 탈퇴하시면 되돌릴 수 없습니다.<br>
                    정말 탈퇴 하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">아니오</button>
                    <button type="button" class="btn btn-danger" id="withdrawalBtn">네, 탈퇴합니다</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
    $(document).ready(function() {
        $('#withdrawalBtn').on('click', function() {
            // Handle withdrawal logic here
            // You may want to make an AJAX request to your server to perform the withdrawal

            // For now, let's redirect to a hypothetical URL "/memberDelete" as in your controller
            var username = "${member.username}";
            $.ajax({
                type: "GET",
                url: "/users/memberDelete?username=" + username,
                success: function(data) {
                    // Logout the user
                    $.ajax({
                        type: "GET",
                        url: "/logout",
                        success: function(logoutData) {
                            // Redirect to the desired page after successful logout
                            window.location.href = "/";
                        },
                        error: function(logoutError) {
                            // Handle errors if any during logout
                            console.error("Error during logout: ", logoutError);
                            alert("Error during logout. Please try again.");
                        }
                    });
                },
                error: function(error) {
                    // Handle errors if any during withdrawal
                    console.error("Error deleting user: ", error);
                    alert("Error deleting user. Please try again.");
                }
            });
        });
    });
</script>

</body>
</html>