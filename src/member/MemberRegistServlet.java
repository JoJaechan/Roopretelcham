package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberRegistServlet
 */
@WebServlet("/RegistServlet")
public class MemberRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberRegistServlet() {
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
//		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		// String address=request.getParameter("address");
		String address = request.getParameter("sample6_address");

		System.out.println("address : " + address);
		address = address + " " + request.getParameter("sample6_detailAddress");

		String phone = request.getParameter("phone");
		String mobile = request.getParameter("mobile");

		// date 현 시각
		Timestamp date = new Timestamp(System.currentTimeMillis());

		MemberBean mb = new MemberBean();
		mb.setId(id);
		mb.setPass(pass);
		mb.setName(name);
		mb.setEmail(email);
		mb.setAddress(address);
		mb.setPhone(phone);
		mb.setMobile(mobile);
		mb.setDate(date);

		MemberDAO dao = new MemberDAO();
		boolean isOk = dao.insertMember(mb);

		if (isOk) {			
			// 로그인 페이지 로 이동
			response.sendRedirect("login.jsp");
		} else {
			String msg = "가입에 실패하였습니다!";
			String str = "";
			str = "<script language='javascript'>";
			str += "alert('" + msg + "');"; // 얼럿창 띄우기
			str += "history.go(-1);"; // 이전페이지로 가기
			str += "</script>";
			out.print(str);
		}
	}

}
