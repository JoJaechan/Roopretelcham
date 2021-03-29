<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="description"
	content="Magz is a HTML5 & CSS3 magazine template is based on Bootstrap 3.">
<meta name="author" content="Kodinger">
<meta name="keyword"
	content="magz, html5, css3, template, magazine template">
<!-- Shareable -->
<meta property="og:title"
	content="HTML5 & CSS3 magazine template is based on Bootstrap 3" />
<meta property="og:type" content="article" />
<meta property="og:url" content="http://github.com/nauvalazhar/Magz" />
<meta property="og:image"
	content="https://raw.githubusercontent.com/nauvalazhar/Magz/master/images/preview.png" />
<title>Magz &mdash; Responsive HTML5 &amp; CSS3 Magazine
	Template</title>
<!-- Bootstrap -->
<link rel="stylesheet" href="scripts/bootstrap/bootstrap.min.css">
<!-- IonIcons -->
<link rel="stylesheet" href="scripts/ionicons/css/ionicons.min.css">
<!-- Toast -->
<link rel="stylesheet" href="scripts/toast/jquery.toast.min.css">
<!-- OwlCarousel -->
<link rel="stylesheet"
	href="scripts/owlcarousel/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="scripts/magnific-popup/dist/magnific-popup.css">
<link rel="stylesheet" href="scripts/sweetalert/dist/sweetalert.css">
<!-- Custom style -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/skins/all.css">
<link rel="stylesheet" href="css/demo.css">
</head>

<body>
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 헤더파일들어가는 곳 -->

	<section class="single">
		<div class="container" class="col-md-12">
			<div class="row" class="col-md-12">
				<!-- 					본문 글 시작 -->
				<%
				// content.jsp?num=값
				// int num = request   num파라미터 가져오기 
				int num = Integer.parseInt(request.getParameter("num"));
				// 리턴할형 BoardBean  getBoard(int num)메서드 정의
				BoardDAO boardDAO = new BoardDAO();
				BoardBean bb = boardDAO.getArticle(num, "board_gallery");

				if (bb != null) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

					// 조회수 증가
					boardDAO.articleUpdateReadCount(num);

					System.out.println("content gallery : " + bb.getContent());
				%>
				<div class="col-md-12">
					<ol class="breadcrumb">
						<li><a href="#">메인</a></li>
						<li class="active">갤러리</li>
					</ol>
					<article class="article main-article">

						<!-- 						글 제목 -->
						<header>
							<h1><%=bb.getSubject()%></h1>
							<ul class="details">
								<li><%=sdf.format(bb.getDate())%></li>
								<!-- 								<li><a>Film</a></li> -->
								<li>작성자 <a href="#"><%=bb.getName()%></a></li>
							</ul>
						</header>
						<!-- 						글 제목 -->

						<!-- 글 본문 -->
						<div class="main"></div>
						<textarea name="content" id="editor" readonly rows="10" cols="150">
						<%=bb.getContent()%>
						</textarea>
						<script src="ckeditor5/ckeditor.js"></script>
						<script src="ckeditor5/translations/ko.js"></script>
						<script>
			 ClassicEditor
		        .create( document.querySelector( '#editor' ), {
		        	ckfinder: {
		        		uploadUrl: '/ck/fileupload'	
		        	},
		            language: 'ko'
		        } )
		        .then( editor => {
		            window.editor = editor;
		            editor.isReadOnly = true;
		            const toolbarContainer = editor.ui.view.stickyPanel;
		            editor.ui.view.top.remove( toolbarContainer );

		        } )
		        .catch( err => {
		            console.error( err.stack );
		        } );
    </script>

						<script>
    document.querySelectorAll( 'oembed[url]' ).forEach( element => {
        // Create the <a href="..." class="embedly-card"></a> element that Embedly uses
        // to discover the media.
        const anchor = document.createElement( 'a' );

        anchor.setAttribute( 'href', element.getAttribute( 'url' ) );
        anchor.className = 'embedly-card';

        element.appendChild( anchor );
    } );
</script>
						<!-- 글 본문 -->

						<footer>
							<div class="col">
								<ul class="tags">
									<li><a href="#">Free Themes</a></li>
									<li><a href="#">Bootstrap 3</a></li>
									<li><a href="#">Responsive Web Design</a></li>
									<li><a href="#">HTML5</a></li>
									<li><a href="#">CSS3</a></li>
									<li><a href="#">Web Design</a></li>
								</ul>
							</div>
							<div class="col">
								<a href="#" class="love"><i
									class="ion-android-favorite-outline"></i>
									<div><%=bb.getReadcount()%></div></a>
							</div>
						</footer>
					</article>
					<%
					}
					%>
					<!-- 					본문 글 끝 -->

					<div class="col-md-2">
						<input type="button" class="btn btn-primary btn-block" value="글수정"
							class="btn"
							onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
					</div>
					<div class="col-md-2">
						<input type="button" class="btn btn-primary btn-block" value="글삭제"
							class="btn" onclick="next(<%=bb.getNum()%>)">
					</div>

					<script>
						function next(no) {
							if (confirm("정말 글을 삭제하시겠습니까?")) {
								location.href = "deletePro.jsp?num=" + no;
							} else {
// 								alert('아니오를 누르셨습니다');
							}
						}
					</script>

					<div class="line thin"></div>
					<div class="comments">
						<h2 class="title">
							3 Responses <a href="#">Write a Response</a>
						</h2>
						<div class="comment-list">
							<div class="item">
								<div class="user">
									<figure>
										<img src="images/img01.jpg">
									</figure>
									<div class="details">
										<h5 class="name">Mark Otto</h5>
										<div class="time">24 Hours</div>
										<div class="description">
											Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
											do eiusmod tempor incididunt ut labore et dolore <a href="#">magna</a>
											aliqua. Ut enim ad minim veniam, quis nostrud exercitation
											ullamco laboris nisi ut aliquip ex ea commodo.
										</div>
										<footer>
											<a href="#">Reply</a>
										</footer>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="user">
									<figure>
										<img src="images/img01.jpg">
									</figure>
									<div class="details">
										<h5 class="name">Mark Otto</h5>
										<div class="time">24 Hours</div>
										<div class="description">
											Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
											do eiusmod tempor incididunt ut labore et dolore <a href="#">magna</a>
											aliqua. Ut enim ad minim veniam, quis nostrud exercitation
											ullamco laboris nisi ut aliquip ex ea commodo.
										</div>
										<footer>
											<a href="#">Reply</a>
										</footer>
									</div>
								</div>
								<div class="reply-list">
									<div class="item">
										<div class="user">
											<figure>
												<img src="images/img01.jpg">
											</figure>
											<div class="details">
												<h5 class="name">Mark Otto</h5>
												<div class="time">24 Hours</div>
												<div class="description">Quis nostrud exercitation
													ullamco laboris nisi ut aliquip ex ea commodo consequat.
													Duis aute irure dolor in reprehenderit in voluptate velit
													esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
													occaecat cupidatat non proident, sunt in culpa qui officia
													deserunt mollit anim id est laborum.</div>
												<footer>
													<a href="#">Reply</a>
												</footer>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="item">
								<div class="user">
									<figure>
										<img src="images/img01.jpg">
									</figure>
									<div class="details">
										<h5 class="name">Mark Otto</h5>
										<div class="time">24 Hours</div>
										<div class="description">
											Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
											do eiusmod tempor incididunt ut labore et dolore <a href="#">magna</a>
											aliqua. Ut enim ad minim veniam, quis nostrud exercitation
											ullamco laboris nisi ut aliquip ex ea commodo.
										</div>
										<footer>
											<a href="#">Reply</a>
										</footer>
									</div>
								</div>
							</div>
						</div>
						<form class="row">
							<div class="col-md-12">
								<h3 class="title">Leave Your Response</h3>
							</div>
							<div class="form-group col-md-4">
								<label for="name">Name <span class="required"></span></label> <input
									type="text" id="name" name="" class="form-control">
							</div>
							<div class="form-group col-md-4">
								<label for="email">Email <span class="required"></span></label>
								<input type="email" id="email" name="" class="form-control">
							</div>
							<div class="form-group col-md-4">
								<label for="website">Website</label> <input type="url"
									id="website" name="" class="form-control">
							</div>
							<div class="form-group col-md-12">
								<label for="message">Response <span class="required"></span></label>
								<textarea class="form-control" name="message"
									placeholder="Write your response ..."></textarea>
							</div>
							<div class="form-group col-md-12">
								<button class="btn btn-primary">Send Response</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Start footer -->
	<footer class="footer">
		<div class="row">
			<div class="col-md-12">
				<div class="copyright">
					COPYRIGHT &copy; RUTEL 2021. ALL RIGHT RESERVED.
					<div>
						Made with <i class="ion-heart"></i> by <a
							href="http://kodinger.com">Kodinger</a>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<!-- JS -->
	<script src="js/jquery.js"></script>
	<script src="js/jquery.migrate.js"></script>
	<script src="scripts/bootstrap/bootstrap.min.js"></script>
	<script>
		var $target_end = $(".best-of-the-week");
	</script>
	<script src="scripts/jquery-number/jquery.number.min.js"></script>
	<script src="scripts/owlcarousel/dist/owl.carousel.min.js"></script>
	<script src="scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<script src="scripts/easescroll/jquery.easeScroll.js"></script>
	<script src="scripts/sweetalert/dist/sweetalert.min.js"></script>
	<script src="scripts/toast/jquery.toast.min.js"></script>
	<script src="js/demo.js"></script>
	<script src="js/e-magz.js"></script>
</body>
</html>