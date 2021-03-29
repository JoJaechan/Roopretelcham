package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import state.CheckState;

/**
 * Servlet implementation class BoardDeleteServlet
 */
@WebServlet("/BoardDelete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDeleteServlet() {
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
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pass = request.getParameter("pass");
		BoardDAO dao = new BoardDAO();

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		CheckState state = dao.articleCheck(num, pass);

		if (state == CheckState.OK) {
			dao.articleDelete(num, pass);
			response.sendRedirect("notice.jsp");
		} else if (state == CheckState.WRONG_PASSWORD) {

			// history.go(-1) >> 이전페이지로 -2가되면 이전 이전 페이지로
			String msg = "비밀번호가 일치하지 않습니다. 다시 확인해주세요.";
			String str = "";
			str = "<script language='javascript'>";
			str += "alert('" + msg + "');"; // 얼럿창 띄우기
			str += "history.go(-1);"; // 이전페이지로 가기
			str += "</script>";
			out.print(str);
		} else if (state == CheckState.NO_NUM_VALUE) {
			String msg = "해당 아이디로 가입한 계정이 없습니다";
			String str = "";
			str = "<script language='javascript'>";
			str += "alert('" + msg + "');"; // 얼럿창 띄우기
			str += "history.go(-1);"; // 이전페이지로 가기
			str += "</script>";
			out.print(str);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		

	}

}
