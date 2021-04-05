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
	location.href="/member/login.jsp";</script>
		<%
		}
		%>

		<!-- 게시판 -->
		<article>
			<form action="/fileUpload" method="POST" name="content_form"
				enctype="multipart/form-data">
				<table id="pds" style="width: 100%;">
					<tr>
						<td><input type="hidden" name="name" required="required"
							value="<%=id%>" readonly></td>
					</tr>
					<tr>
						<td>글제목</td>
					</tr>
					<tr>
						<td><input type="text" maxlength="50" required="required"
							name="subject"></td>
					</tr>
					<tr>
						<td><textarea name="content" required="required"
								maxlength="5000" id="editor"></textarea></td>
					</tr>
				</table>
				<p>
					<label for="partFile1">파일 첨부 : </label><input type="file"
						multiple="multiple" onchange="fileUpload(this)" name="partFile1"
						id="partFile1" accept=".jpg, .gif, .zip,.pdf,.mp4,.mp3,.avi,">
					<br>
				</p>

				<label for="partFile1">첨부파일목록 ▼</label>
				<ul id="fileList"></ul>

				<button type="submit" onClick="return checkForm()">글 등록</button>
				<!-- 					글 등록안할 시 업로드파일 제거 처리 필요  -->
				<button type="button" onClick="cancleForm()">작성취소</button>


			</form>
			<script>
// iframe parent window 
function checkForm(){ 
	if (document.content_form.subject.value == "") {
		alert("글 제목을 입력해주세요");
		document.content_form.subject.focus();
		return false;
	}
	
var content = window.editor.getData();
	
	if (content == "") {
		alert("글내용을 입력해주세요");
		return false;
	}
	
	if (document.content_form.partFile1.value == "") {
		alert("파일을 하나 이상 첨부해주세요");
		document.content_form.partFile1.focus();
		return false;
	}	

// 	valueInVar = document.getElementById("editor").value;
// 	alert(valueInVar);

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

			<script src="/ckeditor5/ckeditor.js"></script>
			<script src="/ckeditor5/translations/ko.js"></script>
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

		</article>


	</div>
</body>
</html>