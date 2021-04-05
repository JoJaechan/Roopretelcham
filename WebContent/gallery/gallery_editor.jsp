<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.ck.ck-editor {
	min-width: 100%;
}

.ck-editor__editable {
	min-height: 550px;
	max-height: 550px;
}
</style>

<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="/css/editor.css">

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
			<form action="/GalleryWrite" method="POST" name="content_form">
				<table id="notice" style="width: 100%;">
					<tr>
						<td><input type="hidden" name="name" value="<%=id%>" readonly></td>
					</tr>
					<tr>
						<td>글제목</td>
					</tr>
					<tr>
						<td><input type="text" maxlength="50" style="width: 100%;"
							name="subject"></td>
					</tr>
					<tr>
						<td><textarea name="content" maxlength="5000" style="width: 100%;" id="editor"></textarea></td>
					</tr>
				</table>

				<button type="submit" onClick="checkForm()">글 등록</button>
				<!-- 					글 등록안할 시 업로드파일 제거 처리 필요  -->
				<button type="button" onClick="cancleForm()">작성취소</button>



			</form>
			<script>
// iframe parent window 
function checkForm(){ 
    document.content_form.target="_parent"; 
    document.content_form.submit(); 
} 
function cancleForm(){ 
	if (confirm("글쓰기를 취소하시겠습니까?")) {
		document.content_form.target="_parent";
	    window.parent.history.back(); //이전페이지로 가기
	}
}
</script>
			<script src="/ckeditor5/ckeditor.js"></script>
			<script src="/ckeditor5/translations/ko.js"></script>
			<script>
			 ClassicEditor
			 .create( document.querySelector( '#editor' ),{  // textarea의 id
					language: 'ko',        
					ckfinder: {
				        uploadUrl: '/FileServlet' // 내가 지정한 업로드 url (post로 요청감)
				    }
				} )
		        .then( editor => {
		            window.editor = editor;
		        } )
		        .catch( err => {
		            console.error( err.stack );
		        } );
    </script>
		</article>
		<!-- 게시판 -->
	</div>
</body>
</html>