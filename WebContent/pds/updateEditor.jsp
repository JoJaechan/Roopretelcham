<%@page import="file.FileBean"%>
<%@page import="java.util.List"%>
<%@page import="table.Table"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
<link rel="stylesheet" href="/css/editor.css">

</head>
<body>
	<div id="wrap">
		<%
		//String id = (String)세션값 가져오기
		String id = (String) session.getAttribute("id");
		BoardDAO bdao = new BoardDAO();
		BoardBean bb = new BoardBean();

		// 세션값이 없으면 "../member/login.jsp" 이동
		if (id == null) {
		%>
		<script type="text/javascript">
	alert("글을 수정하려면 먼저 로그인해주세요");
	location.href="/member/login.jsp";</script>
		<%
		return;
		}

		String strNum = request.getParameter("num");
		int num = -1;

		if (strNum == null) {
		return;
		}

		num = Integer.parseInt(strNum);
		bb = bdao.getArticle(num, Table.BOARD_PDS.name());
		List<FileBean> fbList = null;

		if (bb == null || num == -1) {
		%>
		<script type="text/javascript">
				alert("수정할 글이 없습니다.");		
		 		location.href="list.jsp";
			</script>
		<%
		return;
		} else {
		fbList = bdao.getArticleFileList(bb.getNum());

		}
		%>

		<!-- 게시판 -->
		<article>
			<form action="/BoardUpdate" method="POST" name="content_form">
				<table id="gallery" style="width: 100%;">
					<tr>
						<!-- 						<td>글쓴이</td> -->
						<td><input type="hidden" name="name" value="<%=id%>" readonly></td>
						<td><input type="hidden" name="num" value="<%=bb.getNum()%>"
							readonly></td>
						<td><input type="hidden" name="tableName"
							value="<%=Table.BOARD_PDS.name()%>" readonly></td>
					</tr>
					<!-- 					<tr> -->
					<!-- 						<td>비밀번호</td> -->
					<!-- 						<td><input type="password" name="pass"></td> -->
					<!-- 					</tr> -->
					<tr>
						<td>글제목</td>
					</tr>
					<tr>
						<td style="width: 100%;"><input type="text" maxlength="50"
							width="100%" style="width: 100%;" value="<%=bb.getSubject()%>"
							required="required" name="subject"></td>
					</tr>
					<tr>
						<td><textarea name="content" required="required"
								maxlength="5000" id="editor"><%=bb.getContent()%></textarea></td>
					</tr>
				</table>
				<!-- 게시물에 대한 파일리스트 표시시작 -->
				<%
				if (fbList != null) {
					for (FileBean file : fbList) {
						String filename = file.getFile_name();
				%>
				<a href="${pageContext.request.contextPath}/upload/<%=filename%>">
					<%=filename%>
				</a><a>삭제</a><br>
				<%
					}
				}
				%>
				<p>
					<label for="partFile1">파일 첨부 : </label><input type="file"
						multiple="multiple" onchange="fileUpload(this)" name="partFile1"
						id="partFile1" accept=".jpg, .gif, .zip,.pdf,.mp4,.mp3,.avi,">
					<br>
				</p>

				<button type="submit" onClick="checkForm()">글 수정</button>
				<!-- 					글 등록안할 시 업로드파일 제거 처리 필요  -->
				<button type="button" onClick="cancleForm()">수정취소</button>

			</form>
			<script>
// iframe parent window 
function checkForm(){ 
    document.content_form.target="_parent"; 
    document.content_form.submit(); 
}
function cancleForm(){ 
	if (confirm("글 수정을 취소하시겠습니까?")) {
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
