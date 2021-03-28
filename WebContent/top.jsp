<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header class="primary">
		<div class="firstbar">
			<div class="container">
				<div class="row">
					<div class="col-md-3 col-sm-12">
						<div class="brand">
							<!-- 									<img src="images/logo.png" alt="Magz Logo"> -->
							<h2>
								<a href="index.jsp">Roopretelcham </a>
							</h2>
						</div>
					</div>

					<div class="col-md-4 col-sm-12">
						<form class="search" autocomplete="off">
							<div class="form-group">
								<div class="input-group">
									<input type="text" name="q" class="form-control"
										placeholder="Type something here">
									<div class="input-group-btn">
										<button class="btn btn-primary">
											<i class="ion-search"></i>
										</button>
									</div>
								</div>
							</div>
							<div class="help-block">
								<div>Popular:</div>
								<ul>
									<li><a href="#">HTML5</a></li>
									<li><a href="#">CSS3</a></li>
									<li><a href="#">Bootstrap 3</a></li>
									<li><a href="#">jQuery</a></li>
									<li><a href="#">AnguarJS</a></li>
								</ul>
							</div>
						</form>
					</div>

					<div class="col-md-3 col-sm-12 text-right">
						<ul class="nav-icons">
							<li><a href="register.jsp"><i class="ion-person-add"></i>
									<div>회원 가입</div></a></li>
							<li><a href="login.jsp"><i class="ion-person"></i>
									<div>로그인</div></a></li>
						</ul>
					</div>

				</div>
			</div>
		</div>

		<!-- Start nav -->
		<nav class="menu">
			<div class="container">
				<div class="brand">
					<!-- 					<a href="#"> <img src="images/logo.png" alt="Magz Logo"> -->
					<!-- 					</a> -->
					<h5 >
						<a href="index.jsp"><sub>Roopretelcham</sub> </a>
					</h5>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="menu" data-target="#menu-list"><i
						class="ion-navicon-round"></i></a>
				</div>
				<div class="mobile-toggle">
					<a href="#" data-toggle="sidebar" data-target="#sidebar"><i
						class="ion-ios-arrow-left"></i></a>
				</div>
				<div id="menu-list">
					<ul class="nav-list">
						<li class="for-tablet nav-title"><a>메뉴</a></li>
						<li class="for-tablet"><a href="login.jsp">로그인</a></li>
						<li class="for-tablet"><a href="register.jsp">회원 가입</a></li>
						<li><a href="community.jsp">커뮤니티</a></li>
						<li><a href="gallery.jsp">갤러리</a></li>
						<li><a href="download.jsp">자료실</a></li>

						<!-- 						<li class="dropdown magz-dropdown"><a href="category.jsp">커뮤니티 -->
						<!-- 								<i class="ion-ios-arrow-right"></i> -->
						<!-- 						</a> -->
						<!-- 							<ul class="dropdown-menu"> -->
						<!-- 								<li><a href="search.jsp">여러 이야기</a></li> -->
						<!-- 								<li><a href="contact.jsp">Contact</a></li> -->
						<!-- 								<li class="dropdown magz-dropdown"><a href="#">Error <i -->
						<!-- 										class="ion-ios-arrow-right"></i></a> -->
						<!-- 									<ul class="dropdown-menu"> -->
						<!-- 										<li><a href="403.jsp">403</a></li> -->
						<!-- 										<li><a href="404.jsp">404</a></li> -->
						<!-- 										<li><a href="500.jsp">500</a></li> -->
						<!-- 										<li><a href="503.jsp">503</a></li> -->
						<!-- 									</ul></li> -->
						<!-- 							</ul></li> -->

						<li class="dropdown magz-dropdown"><a href="#">회원 정보 보기 <i
								class="ion-ios-arrow-right"></i>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="icon ion-person"></i> 내 정보 보기</a></li>
								<li><a href="#"><i class="icon ion-heart"></i> 작성 글 보기</a></li>
								<li><a href="#"><i class="icon ion-chatbox"></i> 작성
										댓글목록</a></li>
								<li><a href="#"><i class="icon ion-key"></i> 비밀번호 변경</a></li>
								<!-- 								<li><a href="#"><i class="icon ion-settings"></i> -->
								<!-- 										Settings</a></li> -->
								<li class="divider"></li>
								<li><a href="#"><i class="icon ion-log-out"></i> 로그아웃</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- End nav -->
	</header>
</body>
</html>