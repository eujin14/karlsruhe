<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>

<!-- fontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous" referrerpolicy="no-referrer"/>

<!-- jquery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"
        integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<style type="text/css">
.small-box {
    border-radius: .25rem;
    box-shadow: 0 0 1px rgba(0, 0, 0, .125), 0 1px 3px rgba(0, 0, 0, .2);
    display: block;
    margin-bottom: 20px;
    position: relative
}

.small-box > .inner {
    padding: 10px
}

.small-box > .small-box-footer {
    background-color: rgba(0, 0, 0, .1);
    color: rgba(255, 255, 255, .8);
    display: block;
    padding: 3px 0;
    position: relative;
    text-align: center;
    text-decoration: none;
    z-index: 10
}

.small-box > .small-box-footer:hover {
    background-color: rgba(0, 0, 0, .15);
    color: #fff
}

.small-box h3 {
    font-size: 2.2rem;
    font-weight: 700;
    margin: 0 0 10px;
    padding: 0;
    white-space: nowrap
}

a{
    text-decoration: none;
    color : #4c5171;
}

.inner {
    display: inline-block;
}

@media (min-width: 992px) {
    .col-lg-2 .small-box h3, .col-md-2 .small-box h3, .col-xl-2 .small-box h3 {
        font-size: 1.6rem
    }

    .col-lg-3 .small-box h3, .col-md-3 .small-box h3, .col-xl-3 .small-box h3 {
        font-size: 1.6rem
    }
}

@media (min-width: 1200px) {
    .col-lg-2 .small-box h3, .col-md-2 .small-box h3, .col-xl-2 .small-box h3 {
        font-size: 2.2rem
    }

    .col-lg-3 .small-box h3, .col-md-3 .small-box h3, .col-xl-3 .small-box h3 {
        font-size: 2.2rem
    }
}

.small-box p {
    font-size: 1rem
}

.small-box p > small {
    color: #f8f9fa;
    display: block;
    font-size: .9rem;
    margin-top: 5px
}

.small-box h3, .small-box p {
    z-index: 5
}

.small-box .icon {
    color: rgba(0, 0, 0, .15);
    z-index: 0
}

.small-box .icon > i {
    font-size: 70px;
    position: absolute;
    right: 15px;
    top: 15px;
    transition: -webkit-transform .3s linear;
    transition: transform .3s linear;
    transition: transform .3s linear, -webkit-transform .3s linear
}

.small-box .icon > i.fa, .small-box .icon > i.fab, .small-box .icon > i.fad, .small-box .icon > i.fal, .small-box .icon > i.far, .small-box .icon > i.fas, .small-box .icon > i.ion {
    font-size: 70px;
    top: 20px
}

.small-box:hover {
    text-decoration: none
}

.small-box:hover .icon > i, .small-box:hover .icon > i.fa, .small-box:hover .icon > i.fab, .small-box:hover .icon > i.fad, .small-box:hover .icon > i.fal, .small-box:hover .icon > i.far, .small-box:hover .icon > i.fas, .small-box:hover .icon > i.ion {
    -webkit-transform: scale(1.1);
    transform: scale(1.1)
}

.small-box:hover .icon > svg {
    -webkit-transform: scale(1.1);
    transform: scale(1.1)
}

@media (max-width: 767.98px) {
    .small-box {
        text-align: center
    }

    .small-box .icon {
        display: none
    }

    .small-box p {
        font-size: 12px
    }
}


.col-lg-3 {
    width: 20%;
}
</style>

</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-3 col-6">
            <div class="small-box bg-info">
                <div class="inner users">
                    <h3>${countUsers}</h3>
                    <p>회원 목록</p>
                </div>
                <div class="icon">
                    <i class="fa-solid fa-users"></i>
                </div>
                <a href="/listUsers" class="small-box-footer">목록 보기 <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        
             <div class="col-lg-3 col-6">
            <div class="small-box bg-danger">
                <div class="inner notice">
                    <h3>${countNotices}</h3>
                    <p>공지사항</p>
                </div>
                <div class="icon">
                    <i class="fa-solid fa-bell"></i>
                </div>
                <a href="/notice/list" class="small-box-footer">목록 보기 <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>

        <div class="col-lg-3 col-6">
            <div class="small-box bg-success">
                <div class="inner">
                    <h3>${countWeekly}</h3>
                    <p>주보 수</p>
                </div>
                <div class="icon">
                    <i class="fa-solid fa-newspaper"></i>
                </div>
                <a href="/praise/list" class="small-box-footer">목록 보기 <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        
        
        <div class="col-lg-3 col-6">
            <div class="small-box bg-warning">
                <div class="inner">
                    <h3>${countBoards}</h3>
                    <p>자유 게시판</p>
                </div>
                <div class="icon">
                    <i class="fa-solid fa-rectangle-list"></i>
                </div>
                <a href="/boards/list" class="small-box-footer">목록 보기 <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>

        <div class="col-lg-3 col-6">
            <div class="small-box bg-warning">
                <div class="inner">
                    <h3>${countAlbums}</h3>
                    <p>포토 게시판</p>
                </div>
                <div class="icon">
                    <i class="fa-solid fa-images"></i>
                </div>
                <a href="/album/list" class="small-box-footer">목록 보기 <i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>

    </div>
</div>

<!-- 페이지 개별 적용 js -->
<script type="text/javascript" src="/resources/admin/js/adminMain.js"></script>
</body>
</html>