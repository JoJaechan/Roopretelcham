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
			<form action="partUploadPro2" method="POST"
				enctype="multipart/form-data">
				<table id="notice">
					<tr>
						<td><input type="hidden" name="name" value="<%=id%>" readonly></td>
					</tr>
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
					<input type="submit" value="글쓰기" onClick="checkForm()" class="btn">
					<!-- 					글 등록안할 시 업로드파일 제거 처리 필요  -->
					<input type="button" value="글목록" class="btn"
						onclick="location.href='notice.jsp'">
				</div>
			</form>
			<script>
// iframe parent window 
function checkForm(){ 
    document.content_form.target="_parent"; 
    document.content_form.submit(); 
} 
</script>

			<!-- 			<script src="ckeditor5/ckeditor.js"></script> -->
			<script
				src="https://cdn.ckeditor.com/ckeditor5/27.0.0/classic/ckeditor.js"></script>
			<!-- 			<script src="ckeditor5/translations/ko.js"></script> -->
			<script>
			 ClassicEditor
			 .create( document.querySelector( '#editor' ),{  // textarea의 id
					language: 'ko',        
					ckfinder: {
				        uploadUrl: 'FileServlet' // 내가 지정한 업로드 url (post로 요청감)
				    }
				} )
// 		        .then( editor => {
// 		            window.editor = editor;
// 		        } )
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
	</div>
</body>
</html>