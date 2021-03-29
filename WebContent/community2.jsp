<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
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
<!-- 		<meta property="og:title" content="HTML5 & CSS3 magazine template is based on Bootstrap 3" /> -->
<!-- 		<meta property="og:type" content="article" /> -->
<!-- 		<meta property="og:url" content="http://github.com/nauvalazhar/Magz" /> -->
<!-- 		<meta property="og:image" content="https://raw.githubusercontent.com/nauvalazhar/Magz/master/images/preview.png" /> -->
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
<!-- iCheck -->
<link rel="stylesheet" href="scripts/icheck/skins/all.css">
<!-- Custom style -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/skins/all.css">
<link rel="stylesheet" href="css/demo.css">
</head>

<body>
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="top.jsp"></jsp:include>
	<!-- 헤더파일들어가는 곳 -->

	<section class="search">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<aside>
					<ol class="breadcrumb">
								<li><a href="#">메인</a></li>
								<li class="active">커뮤니티</li>
							</ol>
<!-- 							<h1 class="page-title">커뮤니티</h1> -->
<!-- 							<p class="page-subtitle"> -->
<!-- 								자유롭게 <i>일상</i>이나 <i>게임</i>이야기를 하는 공간입니다. -->
<!-- 							</p> -->
					
						<h2 class="aside-title">검색</h2>
						<div class="aside-body">
							<p>다른 키워드로 검색하거나 검색조건을 사용해 더 정확한 결과를 얻을 수 있습니다.</p>
							<form>
								<div class="form-group">
									<div class="input-group">
										<input type="text" name="q" class="form-control"
											placeholder="Type something ..." value="hello">
										<div class="input-group-btn">
											<button class="btn btn-primary">
												<i class="ion-search"></i>
											</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</aside>
					<aside>
						<h2 class="aside-title">검색 조건</h2>
						<div class="aside-body">
							<form class="checkbox-group">
								<div class="group-title">날짜</div>
								<div class="form-group">
									<label><input type="radio" name="date" checked>
										모든 시간</label>
								</div>
								<div class="form-group">
									<label><input type="radio" name="date"> 오늘</label>
								</div>
								<div class="form-group">
									<label><input type="radio" name="date"> 일주일 내</label>
								</div>
								<div class="form-group">
									<label><input type="radio" name="date"> 한달 내</label>
								</div>
								<br>
								<div class="group-title">글 분류</div>
								<div class="form-group">
									<label><input type="checkbox" name="category" checked>
										전체 분류</label>
								</div>
								<div class="form-group">
									<label><input type="checkbox" name="category">
										일상</label>
								</div>
								<div class="form-group">
									<label><input type="checkbox" name="category">
										게임 이야기</label>
								</div>
							</form>
						</div>
					</aside>
				</div>
				<div class="col-md-9">
					<div class="nav-tabs-group">
					<div class="col-md-2">
						<button class="btn btn-primary btn-block"
							onclick="location.href='writeForm.jsp'">글쓰기</button>
					</div>
					
						<ul class="nav-tabs-list">
							<li class="active"><a href="#">전체</a></li>
							<li><a href="#">일간 인기 글</a></li>
							<li><a href="#">주간 인기 글</a></li>
						</ul>
						<div class="nav-tabs-right">
							<select class="form-control">
								<option>보여줄 글 수</option>
								<option>10</option>
								<option>20</option>
								<option>50</option>
								<option>100</option>
							</select>
						</div>
					</div>
					
					<!-- 검색결과 표시 -->
					<!-- 					<div class="search-result">Search results for keyword "hello" -->
					<!-- 						found in 5,200 posts.</div> -->


					<div class="row">
						<!-- 					글 시작 -->
						<%
						BoardDAO boardDAO = new BoardDAO();
						List<BoardBean> bbList = boardDAO.selectBoard();

						if (bbList != null) {
							for (BoardBean b : bbList) {
						%>
						<article class="col-md-12 article-list">
							<div class="inner">
<!-- 								<figure> -->
<!-- 									<a href="single.html"> <img src="images/news/img11.jpg"> -->
<!-- 									</a> -->
<!-- 								</figure> -->
								<div class="details">
									<div class="detail">
										<div class="category">
											<a href="#">Film</a>
										</div>
										<time><%=b.getDate()%></time>
									</div>
									<h1>
										<a href="single.html"><%=b.getSubject()%></a>
									</h1>
<%-- 									<p><%=b.getContent()%></p> --%>
									<footer>
										<a href="#" class="love"><i
											class="ion-android-favorite-outline"></i>
											<div>273</div></a> <a class="btn btn-primary more"
											href="single.html">
											<div>More</div>
											<div>
												<i class="ion-ios-arrow-thin-right"></i>
											</div>
										</a>
									</footer>
								</div>
							</div>
						</article>
						<%
						}
						}
						%>
						<!-- 						글 끝 -->

						<div class="col-md-12 text-center">
							<ul class="pagination">
								<li class="prev"><a href="#"><i
										class="ion-ios-arrow-left"></i></a></li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">...</a></li>
								<li><a href="#">97</a></li>
								<li class="next"><a href="#"><i
										class="ion-ios-arrow-right"></i></a></li>
							</ul>
							<div class="pagination-help-text">Showing 8 results of 776
								&mdash; Page 1</div>
						</div>
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