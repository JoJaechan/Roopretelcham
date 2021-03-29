package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberLoginServlet
 */
@WebServlet("/login")
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberLoginServlet() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
		
		String id = request.getParameter("id");
		String pass = request.getParameter("password");
		
		response.setContentType("text/html; charset=utf-8");
		   PrintWriter out = response.getWriter();
		
		MemberDAO dao = new MemberDAO();
//		int check = dao.userCheck(id, pass);
		MemberBean mb = dao.getMember(id);
		int check = dao.userCheck(mb, id, pass);		
		
		// 1 : id,pw 일치, 0 : id일치 pw틀림, -1 : id 불일치
		if (check == 1) {
			HttpSession session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("name", mb.getName());
				response.sendRedirect("index.jsp");
		}
		else if (check == 0) {
		   //history.go(-1) >> 이전페이지로 -2가되면  이전 이전 페이지로
		   String msg = "비밀번호가 일치하지 않습니다. 다시 확인해주세요.";
		   String str="";
		   str = "<script language='javascript'>";
		   str += "alert('"+ msg + "');";   //얼럿창 띄우기
		   str += "history.go(-1);";    //이전페이지로 가기
		   str += "</script>";
		   out.print(str);
		}
		else if (check == -1) {
			String msg = "해당 아이디로 가입한 계정이 없습니다";
			   String str="";
			   str = "<script language='javascript'>";
			   str += "alert('"+ msg + "');";   //얼럿창 띄우기
			   str += "history.go(-1);";    //이전페이지로 가기
			   str += "</script>";
			   out.print(str);
		
		}
	}

}
