<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
<%@page import="board.CommentBean"%>
<%@page import="table.Table"%>
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
<link rel="stylesheet" href="/scripts/bootstrap/bootstrap.min.css">
<!-- IonIcons -->
<link rel="stylesheet" href="/scripts/ionicons/css/ionicons.min.css">
<!-- Toast -->
<link rel="stylesheet" href="/scripts/toast/jquery.toast.min.css">
<!-- OwlCarousel -->
<link rel="stylesheet"
	href="/scripts/owlcarousel/dist/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="/scripts/owlcarousel/dist/assets/owl.theme.default.min.css">
<!-- Magnific Popup -->
<link rel="stylesheet"
	href="/scripts/magnific-popup/dist/magnific-popup.css">
<link rel="stylesheet" href="/scripts/sweetalert/dist/sweetalert.css">
<!-- Custom style -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/skins/all.css">
<link rel="stylesheet" href="/css/demo.css">
</head>

<body>
	<!-- ???????????????????????? ??? -->
	<jsp:include page="/top.jsp"></jsp:include>
	<!-- ???????????????????????? ??? -->

	<section class="single">
		<div class="container" class="col-md-12">
			<div class="row" class="col-md-12">
				<!-- 					?????? ??? ?????? -->
				<%
				// content.jsp?num=???
				// int num = request   num???????????? ???????????? 
				int num = Integer.parseInt(request.getParameter("num"));

				// ???????????? BoardBean  getBoard(int num)????????? ??????
				BoardDAO boardDAO = new BoardDAO();
				BoardBean bb = boardDAO.getArticle(num);

				if (bb != null) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

					// ????????? ??????
					boardDAO.articleUpdateReadCount(num);
				%>
				<div class="col-md-12">
					<ol class="breadcrumb">
						<li><a href="#">??????</a></li>
						<li class="active">????????????</li>
					</ol>
					<article class="article main-article">

						<!-- 						??? ?????? -->
						<header>
							<h1><%=bb.getSubject()%></h1>
							<ul class="details">
								<li><%=sdf.format(bb.getDate())%></li>
								<!-- 								<li><a>Film</a></li> -->
								<li>????????? <a href="#"><%=bb.getName()%></a></li>
							</ul>
						</header>
						<!-- 						??? ?????? -->

						<!-- ??? ?????? -->
						<div class="main"></div>

						<textarea name="content" id="editor" readonly rows="10" cols="350">
						<%=bb.getContent()%>
						</textarea>

						<!-- ??? ?????? -->

						<footer>
							<!-- 						????????? ?????? ?????? ?????? -->
							<div class="col">
								<ul class="tags">
									<li><a href="#">Free Themes</a></li>
									<li><a href="#">Bootstrap 3</a></li>
								</ul>
							</div>
							<!-- 						????????? ?????? ?????? ??? -->
							<div class="col">
								<a href="#" class="love"><i
									class="ion-android-favorite-outline"></i>

									<div><%=bb.getReadcount()%></div></a>

								<div>?????????</div>
								</a>
							</div>
						</footer>
					</article>
					<%
					}
					%>
					<!-- 					?????? ??? ??? -->

					<!-- ??????,???????????? ????????? ???????????? ????????? ?????? ????????????-->
					<%
					String id = (String) session.getAttribute("id");
					if (id != null) {
						if (id.equals(bb.getName())) {
							String boardName = "BOARD";
					%>
					<div class="col-md-2">
						<input type="button" class="btn btn-primary btn-block"
							value="??? ??????" class="btn"
							onclick="location.href='updateForm.jsp?num=<%=bb.getNum()%>'">
					</div>
					<div class="col-md-2">
						<input type="button" class="btn btn-primary btn-block"
							value="??? ??????" class="btn" onclick="next(<%=bb.getNum()%>)">
					</div>
					<%
					}
					}
					%>
					<div class="col-md-2">
						<input type="button" class="btn btn-primary btn-block"
							value="??? ??????" class="btn" onclick="location.href='community.jsp'">
					</div>
					<!-- ??????,???????????? ????????? ???????????? ????????? ?????? ????????????-->

					<script>
						function next(no) {
							if (confirm("?????? ?????? ?????????????????????????")) {
								var boardName = "BOARD";
								location.href = "/deletePro.jsp?num=" + no + "&tableName=" + boardName;
							} else {
// 								alert('???????????? ??????????????????');
							}
						}
					</script>

					<!-- ?????? ?????? ?????? -->
					<%
					List<CommentBean> listComment = boardDAO.getArticleComment(bb.getNum(), Table.BOARD_COMMENT.name());
					int numOfComment = listComment.size();
					// 					id = (String) session.getAttribute("id");

					// ????????? ?????? ?????? ????????????
					MemberDAO memDao = new MemberDAO();
					MemberBean mb = memDao.getMember(id);
					%>
					<div class="line thin"></div>
					<div class="comments">
						<h2 class="title">
							<%=numOfComment%>
							?????? ?????? <a href="#response">?????? ??????</a>
						</h2>
						
						<%
									SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

									for (CommentBean c : listComment) {
									%>
						<div class="comment-list">

							<!-- 						?????? ?????? ?????? ?????? -->
							<div class="item">
								<div class="user">
									
									<!-- 									<figure> -->
									<!-- 										<img src="images/img01.jpg"> -->
									<!-- 									</figure> -->
									<div class="details">
										<h5 class="name"><%=c.getComment_id()%></h5>
										<div class="time"><%=sdf.format(c.getComment_date())%></div>
										<div class="description">
											<%=c.getComment_content()%>
										</div>
										<!-- 										<footer> -->
										<!-- 											<a href="#response">Reply</a> -->
										<!-- 										</footer> -->
									</div>
								</div>
							</div>
							
						</div>
						<%
							}
							%>
						<!-- 						?????? ?????? ?????? ??? -->

						<%
						if (mb == null || mb.getName() == null) {
						%>
						<label for="alert">????????? ????????? ?????? <a href="/member/login.jsp">?????????</a>
							????????????
						</label>
						<%
						} else {
						%>
						<form class="row" action=/writeComment method="post" id="response">
							<div class="col-md-12">
								<h3 class="title">????????? ???????????????</h3>
							</div>
							<input type="hidden" id="id" name="id" value=<%=id%>> <input
								type="hidden" id="no" name="no" value=<%=bb.getNum()%>>
							<%-- 							<input type="hidden" id="nick" name="nick" value=<%=mb.getName() %>> --%>
							<input type="hidden" id="tableName" name="tableName"
								value=<%=Table.BOARD_COMMENT.name()%>>

							<div class="form-group col-md-4">
								<label for="nick">?????? <span class="required"></span></label> <input
									type="text" readonly="readonly" value=<%=mb.getName()%>
									id="nick" name="nick" class="form-control">
							</div>
							<!-- 							<div class="form-group col-md-4"> -->
							<!-- 								<label for="email">Email <span class="required"></span></label> -->
							<!-- 								<input type="email" id="email" name="" class="form-control"> -->
							<!-- 							</div> -->
							<!-- 							<div class="form-group col-md-4"> -->
							<!-- 								<label for="website">Website</label> <input type="url" -->
							<!-- 									id="website" name="" class="form-control"> -->
							<!-- 							</div> -->
							<div class="form-group col-md-12">
								<label for="comment_content">?????? ?????? <span
									class="required"></span></label>
								<textarea class="form-control" name="comment_content"
									placeholder="????????? ?????? ????????? ????????????"></textarea>
							</div>
							<div class="form-group col-md-12">
								<button class="btn btn-primary">?????? ??????</button>
							</div>
							<%
							}
							%>

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
	<!-- ckeditor5 -->
	<script src="/ckeditor5/ckeditor.js"></script>
	<script src="/ckeditor5/translations/ko.js"></script>
	<script>
			 ClassicEditor
		        .create( document.querySelector( '#editor' ), {
		        	ckfinder: {
		        		uploadUrl: '/fileupload'	
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
	<!-- JS -->
	<script src="/js/jquery.js"></script>
	<script src="/js/jquery.migrate.js"></script>
	<script src="/scripts/bootstrap/bootstrap.min.js"></script>
	<script>
		var $target_end = $(".best-of-the-week");
	</script>
	<script src="/scripts/jquery-number/jquery.number.min.js"></script>
	<script src="/scripts/owlcarousel/dist/owl.carousel.min.js"></script>
	<script src="/scripts/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<script src="/scripts/easescroll/jquery.easeScroll.js"></script>
	<script src="/scripts/sweetalert/dist/sweetalert.min.js"></script>
	<script src="/scripts/toast/jquery.toast.min.js"></script>
	<script src="/js/demo.js"></script>
	<script src="/js/e-magz.js"></script>
</body>
</html>