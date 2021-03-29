<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.ck.ck-editor {
	max-width: 500px;
}
.ck-editor__editable {
	min-height: 350px;
}
iframe {
	padding: 0;
	margin: 0;
	border: 2px solid #ccc;;
	width: 100%; /* 아이프레임 가로 넓이 */
	height: 50px; /* 아이프레임 세로 넓이 */
}
</style>

<meta charset="UTF-8">

<title>Insert title here</title>

</head>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
<%-- 		<jsp:include page="../inc/top.jsp" /> --%>
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->
		<!-- 메인이미지 -->
		<div id="sub_img_center"></div>
		<!-- 메인이미지 -->

		<!-- 왼쪽메뉴 -->
		<nav id="sub_menu">
			<ul>
				<li><a href="#">Notice</a></li>
				<li><a href="#">Public News</a></li>
				<li><a href="#">Driver Download</a></li>
				<li><a href="#">Service Policy</a></li>
			</ul>
		</nav>
		<!-- 왼쪽메뉴 -->
		<%
		//String id = (String)세션값 가져오기
		String id = (String) session.getAttribute("id");
		// 세션값이 없으면 "../member/login.jsp" 이동
		if (id == null) {
		%>
		<script type="text/javascript">
	alert("글쓰기를 하려면 먼저 로그인해주세요");
	location.href="../member/login.jsp";</script>
		<%
		}
		%>

		<!-- 게시판 -->
		<article>
			<h1>Notice Write</h1>
			<!--     <textarea name="content" id="editor"></textarea> -->

			<!-- 			<form action="writePro.jsp" method="post"> -->
			<form action="partUploadPro2" method="POST"
				enctype="multipart/form-data">
				<table id="notice">
					<tr>
						<td>글쓴이</td>
						<td><input type="text" name="name" value="<%=id%>" readonly></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pass"></td>
					</tr>
					<tr>
						<td>글제목</td>
						<td><input type="text" name="subject"></td>
					</tr>
					<tr>
						<td>글내용</td>
						<td><textarea name="content" id="editor" rows="10" cols="350"></textarea></td>
					</tr>
				</table>
				<p>
					<label for="partFile1">파일 첨부 : </label><input type="file"
						multiple="multiple" onchange="fileUpload(this)" name="partFile1"
						id="partFile1" accept=".jpg, .gif">
<!-- 						.zip,.pdf,.mp4,.mp3,.avi,  -->
					<br>
				</p>

				<label for="partFile1">첨부파일목록 ▼</label>
				<ul id="fileList"></ul>

				<div id="table_search">
					<input type="submit" value="글쓰기" class="btn">
					<!-- 					글 등록안할 시 업로드파일 제거 처리 필요  -->
					<input type="button" value="글목록" class="btn"
						onclick="location.href='notice.jsp'">
				</div>
			</form>

			<script src="ckeditor5/ckeditor.js"></script>
			<script src="ckeditor5/translations/ko.js"></script>
			<script>
			 ClassicEditor
			 .create( document.querySelector( '#editor' ),{  // textarea의 id
					language: 'ko',        
					ckfinder: {
				        uploadUrl: 'FileServlet' // 내가 지정한 업로드 url (post로 요청감)
				    }
				} )
		        .then( editor => {
		            window.editor = editor;
		        } )
		        .catch( err => {
		            console.error( err.stack );
		        } );
    </script>

			<script type="text/javascript"
				src="https://code.jquery.com/jquery-3.2.0.min.js"></script>
			<script type="text/javascript">
$(function(){
    $("#partFile1").change(function(){
    fileList = $("#partFile1")[0].files;
    fileListTag = '';
    for(i = 0; i < fileList.length; i++){
        fileListTag += "<li>"+fileList[i].name+"</li>";
    }
    $('#fileList').html(fileListTag);
});
});
</script>

			<div class="clear"></div>
			<div id="page_control"></div>
		</article>
		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
<%-- 		<jsp:include page="../inc/bottom.jsp" /> --%>
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>