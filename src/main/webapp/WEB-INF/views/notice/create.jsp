<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>공지게시판</h2>
          <ol>
            <li><a href="index.html">홈</a></li>
            <li><a href="/notice/readList">공지사항</a></li>
            
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
  


        <div class="row mt-5 justify-content-center" data-aos="fade-up">
          <div class="col-lg-10">
            <form action="/notice/create?${_csrf.parameterName}=${_csrf.token}" method="post" role="form" class="php-email-form">
              <div class="row">
                <div class="col-md-6 form-group">
                  <input type="text" name="ntitle" class="form-control" id="ntitle" placeholder="제목" required>
                </div>
                <div class="col-md-6 form-group mt-3 mt-md-0">
                  <input type="file" class="form-control" name="nimage" id="nimage">
                </div>
              </div>
              <div class="form-group mt-3">
                 <textarea class="form-control" id="summernote" name="ncontent"></textarea>
              </div>
              <div class="my-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">등록</button></div>
              <button onclick="location.href='/notice/readList'" class="btn btn-outline-primary">취소</button>
            </form>
          </div>

        </div>