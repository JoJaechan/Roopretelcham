<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
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
	<!-- 헤더파일들어가는 곳 -->
	<jsp:include page="/top.jsp"></jsp:include>
	<!-- 헤더파일들어가는 곳 -->

	<%
	MemberDAO md = new MemberDAO();
	String id = session.getAttribute("id").toString();

	if (id == null) {
		response.sendRedirect("login.jsp");
	}

	//getMember
	MemberBean mb = md.getMember(id);

	if (mb == null) {
		response.sendRedirect("login.jsp");
	}

	String strID = mb.getId();
	String name = mb.getName();
	String address = mb.getAddress();

	if (address == null) {
		address = "";
	}

	String email = mb.getEmail();
	String phone = mb.getPhone();
	String mobile = mb.getMobile();
	%>

	<section class="login first grey">
		<div class="container">
			<div class="box-wrapper">
				<div class="box box-border">
					<div class="box-body">
						<h4>회원정보 수정</h4>
						<!-- 회원가입 폼 시작-->
						<form action="/userUpdate" method="post" id="join">
							<div class="form-group">
								<label>아이디 (*아이디는 변경할 수 없습니다)</label> <input type="text"
									value="<%=strID%>" readonly="readonly" name="id"
									class="form-control">
							</div>

							<div class="form-group">
								<label class="fw">기존 비밀번호 입력</label> <input type="password"
									name="origin_pass" required class="form-control">
							</div>

							<div class="form-group">
								<label class="fw">변경할 비밀번호</label> <input type="password"
									name="pass" id="pass" required class="form-control">
							</div>

							<div class="form-group">
								<label class="fw">변경할 비밀번호 확인입력</label> <input type="password"
									name="pass2" id="pass2" required class="form-control">
							</div>

							<div class="form-group">
								<label>닉네임</label> <input type="text" required name="name"
									value="<%=name%>" class="form-control">
							</div>

							<div class="form-group">
								<label>E-Mail</label> <input type="email" required name="email"
									value="<%=email%>" id="email" class="form-control">
							</div>
							<div class="form-group">
								<label>E-Mail 확인입력</label> <input type="email"
									value="<%=email%>" required name="email2" id="email2"
									class="form-control">
							</div>

							<!-- 							<div class="form-group"> -->
							<!-- 								<label>유저 이름 (게시판에 노출되는 이름)</label> <input type="text" -->
							<!-- 									name="username" required class="form-control"> -->
							<!-- 							</div> -->

							<!-- 								옵션 영역 시작 -->
							<fieldset>
								<legend>선택 기입사항</legend>
								<!-- 	주소 영역 시작 -->
								<div class="form-group">
									<label>기존 주소</label>
									<textarea readonly="readonly" cols=45 id="origin_addr"><%=address%></textarea>
								</div>

								<div class="form-group">
									<label>새 주소</label><br>
									<!-- <input type="text" name="address"><br> -->
									<!-- 	주소 영역 시작 -->
									<!-- id 값만 정의해주면 submit을 해도 form태그 내 input 인식하지 못하므로 name도 정의 -->
									<input type="text" id="sample6_postcode" placeholder="우편번호">
									<input type="button" onclick="sample6_execDaumPostcode()"
										value="우편번호 찾기"><br> <input type="text"
										name="sample6_address" id="sample6_address" placeholder="주소"><br>
									<input type="text" name="sample6_detailAddress"
										id="sample6_detailAddress" placeholder="상세주소"> <input
										type="text" name="sample6_extraAddress"
										id="sample6_extraAddress" placeholder="참고항목">

									<script
										src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
									<script>
										function sample6_execDaumPostcode() {
											new daum.Postcode(
													{
														oncomplete : function(
																data) {
															// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

															// 각 주소의 노출 규칙에 따라 주소를 조합한다.
															// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
															var addr = ''; // 주소 변수
															var extraAddr = ''; // 참고항목 변수

															//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
															if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
																addr = data.roadAddress;
															} else { // 사용자가 지번 주소를 선택했을 경우(J)
																addr = data.jibunAddress;
															}

															// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
															if (data.userSelectedType === 'R') {
																// 법정동명이 있을 경우 추가한다. (법정리는 제외)
																// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
																if (data.bname !== ''
																		&& /[동|로|가]$/g
																				.test(data.bname)) {
																	extraAddr += data.bname;
																}
																// 건물명이 있고, 공동주택일 경우 추가한다.
																if (data.buildingName !== ''
																		&& data.apartment === 'Y') {
																	extraAddr += (extraAddr !== '' ? ', '
																			+ data.buildingName
																			: data.buildingName);
																}
																// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
																if (extraAddr !== '') {
																	extraAddr = ' ('
																			+ extraAddr
																			+ ')';
																}
																// 조합된 참고항목을 해당 필드에 넣는다.
																document
																		.getElementById("sample6_extraAddress").value = extraAddr;

															} else {
																document
																		.getElementById("sample6_extraAddress").value = '';
															}

															// 우편번호와 주소 정보를 해당 필드에 넣는다.
															document
																	.getElementById('sample6_postcode').value = data.zonecode;

															document
																	.getElementById("sample6_address").value = addr;
															// 커서를 상세주소 필드로 이동한다.
															document
																	.getElementById(
																			"sample6_detailAddress")
																	.focus();
														}
													}).open();
										}
									</script>
									<br>
								</div>
								<!-- 주소 영역 끝 -->
								<div class="form-group">
									<label>집 전화 번호</label> <input type="tel"
										value="<%=mb.getPhone()%>" name="phone"><br>
								</div>
								<div class="form-group">
									<label>휴대전화 번호</label> <input type="tel"
										value="<%=mb.getMobile()%>" name="mobile"> <label>집
										전화 번호</label> <input type="tel" value="<%=mb.getPhone()%>"
										name="phone"><br>
								</div>
								<div class="form-group">
									<label>휴대전화 번호</label> <input type="tel"
										value="<%=mb.getMobile()%>" name="mobile">
								</div>
							</fieldset>
							<!-- 								옵션 영역 끝 -->

							<div class="form-group text-right">
								<button class="btn btn-primary btn-block"
									onClick="return checkForm()">회원정보 수정</button>
							</div>
						</form>
						<!-- 회원가입 폼 끝-->
					</div>
				</div>
			</div>
		</div>
	</section>

	<script>
		function checkForm() {
			var password = document.getElementById("pass").value;
			var password2 = document.getElementById("pass2").value;
			console.log("password" + password);

			// - 비밀번호, 비밀번호 확인 일치 제어
			if (password != password2) {
				alert('비밀번호 입력을 확인해주세요');
				return false;
			}

			var email = document.getElementById("email").value;
			var email2 = document.getElementById("email2").value;

			if (email != email2) {
				alert('메일주소 입력을 확인해주세요');
				return false;
			}

			document.join.submit();
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