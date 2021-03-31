package board;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import table.Table;

/**
 * Servlet implementation class CommentWriteServlet
 */
@WebServlet("/writeComment")
public class CommentWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentWriteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String tableName = request.getParameter("tableName");

		String comment_content = request.getParameter("comment_content");
		String COMMENT_BOARD = request.getParameter("no"); // 게시물 글번호
		String nickname = request.getParameter("nick");

		System.out.println("content : " + comment_content);
		BoardDAO dao = new BoardDAO();
		BoardBean bean = new BoardBean();
		Timestamp date = new Timestamp(System.currentTimeMillis());

		CommentBean cb = new CommentBean();
		cb.setComment_board(Integer.parseInt(COMMENT_BOARD));
		cb.setComment_id(nickname);
		cb.setComment_date(date);
		cb.setComment_content(comment_content);

		if (tableName.equals(Table.BOARD_COMMENT.name())) {
			dao.writeComment(cb, Table.BOARD_COMMENT.name());
			response.sendRedirect("content.jsp?num=" + COMMENT_BOARD);
		}
		else if (tableName.equals(Table.BOARD_GALLERY_COMMENT.name())) {
			dao.writeComment(cb, Table.BOARD_GALLERY_COMMENT.name());
			response.sendRedirect("content_gallery.jsp?num=" + COMMENT_BOARD);
		}
		else if (tableName.equals(Table.BOARD_PDS_COMMENT.name())) {
			dao.writeComment(cb, Table.BOARD_PDS_COMMENT.name());
			response.sendRedirect("content_download.jsp?num=" + COMMENT_BOARD);
		}
	}

}
