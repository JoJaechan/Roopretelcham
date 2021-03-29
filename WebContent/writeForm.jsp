<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDAO"%>
<!DOCTYPE html>
<html>
<head>
<style>
</style>

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
<title>Roopretelcham</title>
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

	<!-- 글쓰기 전 id세션값 먼저 체크 -->
	<%
	String id = (String) session.getAttribute("id");
	String name = (String) session.getAttribute("name");
	// 세션값이 없으면 "../member/login.jsp" 이동
	if (id == null) {
	%>
	<script type="text/javascript">
		alert("글쓰기를 하려면 먼저 로그인해주세요");
		location.href = "login.jsp";
	</script>
	<%
	}
	%>

	<section class="search">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<aside>
						<ol class="breadcrumb">
							<li><a href="#">메인</a></li>
							<li class="active">커뮤니티</li>
						</ol>
					</aside>
				</div>
				<div class="col-md-12">

					<div class="row">
						<!-- 					글 시작 -->

						<h1>글 작성</h1>
<!-- 						    <textarea name="content" id="editor"></textarea> -->
<!-- 												<form action="BoardWrite" method="post" id="join"> -->
<!-- 													<div class="form-group"> -->
<!-- 																						<label>작성자 이름</label>  -->
<%-- 														<input type="hidden" name="name" value=<%=name%> --%>
<!-- 															class="form-control"> -->
<!-- 													</div> -->
<!-- 													<div class="form-group"> -->
<!-- 														<label>제목</label> <input type="text" name="subject" maxlength="50" -->
<!-- 															class="form-control"> -->
<!-- 													</div> -->
<!-- 													<div class="form-group"> -->
<!-- 														<label>내용</label> -->
<!-- 														<textarea name="content"  maxlength="500" rows="50" id="editor2" class="form-control"></textarea> -->
<!-- 													</div> -->

<!-- 													<div class="form-group text-right"> -->
<!-- 														<button class="btn btn-primary btn-block">글 작성</button> -->
<!-- 													</div> -->
<!-- 												</form> -->

						<iframe src="editor.jsp" seamless="seamless" scrolling="no" frameborder="0" style="width:100%; height:750px"  ></iframe>
						
						<div class="col-md-2">
							<button class="btn btn-primary btn-block"
								onclick="location.href='community.jsp'">작성 취소</button>


							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
<script type="text/javascript">
var sumitSendForm = function() {
 var frmObj = document.getElementById("test").contentWindow.document.sendform;
 frmObj.submit();
}
</script>


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
	<!-- 	<script src="js/jquery-3.6.0.js"></script> -->

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