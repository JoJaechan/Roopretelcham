<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.ck.ck-editor {
	min-width: 1100px;
}

.ck-editor__editable {
	min-height: 550px;
	max-height: 550px;
}
</style>

<meta charset="UTF-8">
<<<<<<< HEAD
<!-- <link href="../css/default.css" rel="stylesheet" type="text/css"> -->
<!-- <link href="../css/subpage.css" rel="stylesheet" type="text/css"> -->

</head>
<body>
	<div id="wrap">
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
			<form action="BoardWrite" method="POST" name="content_form">
				<table id="community">
					<tr>
						<!-- 						<td>글쓴이</td> -->
						<td><input type="hidden" name="name" value="<%=id%>" readonly></td>
					</tr>
					<!-- 					<tr> -->
					<!-- 						<td>비밀번호</td> -->
					<!-- 						<td><input type="password" name="pass"></td> -->
					<!-- 					</tr> -->
					<tr>
						<td>글제목</td>
					</tr>
					<tr>
						<td><input type="text" maxlength="50" width="100%"
							name="subject"></td>
					</tr>
					<tr>
						<td><textarea name="content" maxlength="5000" id="editor"></textarea></td>
					</tr>
				</table>

				<div id="table_search">
					<input type="submit" onClick="checkForm()" value="글쓰기" class="btn">
					<!-- 					글 등록안할 시 업로드파일 제거 처리 필요  -->
					<!-- 					<input type="button" value="글목록" class="btn" -->
					<!-- 						onclick="location.href='notice.jsp'"> -->
				</div>

			</form>
			<script>
// iframe parent window 
function checkForm(){ 
    document.content_form.target="_parent"; 
    document.content_form.submit(); 
} 
=======
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">

</head>
<body>
	<div id="wrap">
		<!-- 헤더들어가는 곳 -->
		<!-- 헤더들어가는 곳 -->

		<!-- 본문들어가는 곳 -->

		<!-- 왼쪽메뉴 -->
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
			<form action="BoardWrite" method="POST" name="content_form" >
				<table id="community">
					<tr>
<!-- 						<td>글쓴이</td> -->
						<td><input type="hidden" name="name" value="<%=id%>" readonly></td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td>비밀번호</td> -->
<!-- 						<td><input type="password" name="pass"></td> -->
<!-- 					</tr> -->
					<tr>
						<td>글제목</td>
					</tr>
					<tr>					
						<td><input type="text" maxlength="50" width="100%" name="subject"></td>
					</tr>
					<tr>						
						<td><textarea name="content" maxlength="5000" id="editor"></textarea></td>
					</tr>
				</table>
				
				<div id="table_search">
					<input type="submit" onClick="checkForm()" 
						value="글쓰기" class="btn">
					<!-- 					글 등록안할 시 업로드파일 제거 처리 필요  -->
<!-- 					<input type="button" value="글목록" class="btn" -->
<!-- 						onclick="location.href='notice.jsp'"> -->
				</div>
				
			</form>
			<script>
// iframe parent window 
function checkForm(){ 
    document.content_form.target="_parent"; 
    document.content_form.submit(); 
} 


>>>>>>> branch 'master' of https://github.com/imrutel/Roopretelcham.git
</script>

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
		</article>
		<!-- 게시판 -->
		<!-- 본문들어가는 곳 -->
		<div class="clear"></div>
		<!-- 푸터들어가는 곳 -->
		<!-- 푸터들어가는 곳 -->
	</div>
</body>
</html>