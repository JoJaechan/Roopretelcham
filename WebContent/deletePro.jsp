<%@page import="state.CheckState"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>jsp6/deletePro.jsp</h1>
	<%
	//request 파라미터 num  pass  가져오기
		int num = Integer.parseInt(request.getParameter("num"));	
		BoardDAO dao = new BoardDAO();
		String id = (String) session.getAttribute("id");
		CheckState state = dao.articleCheck(id, num);

		if (state == CheckState.OK) {
			dao.articleDelete(num);		
			response.sendRedirect("community.jsp");
		} else if (state == CheckState.WRONG_PASSWORD) {
	%>
	<script type="text/javascript">
		alert("비밀번호틀림");
		history.back();
	</script>
	<%
	} else if (state == CheckState.NO_NUM_VALUE) {
	%>
	<script type="text/javascript">
		alert("num없음");
		history.back();
	</script>
	<%
	}
	%>
</body>
</html>



