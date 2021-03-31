package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/userUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberUpdateServlet() {
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

		request.setCharacterEncoding("utf-8");
		MemberDAO md = new MemberDAO();
		MemberBean mb = new MemberBean();
		String id = request.getParameter("id");

		String origin_pass = request.getParameter("origin_pass");
		String pass = request.getParameter("pass");

		String originAddress = request.getParameter("address");
		String address = request.getParameter("sample6_address");

		System.out.println("address : " + address);
		address = address + " " + request.getParameter("sample6_detailAddress");
		System.out.println("sample6_detailAddress : " + address);

		if (address == null || address == "") {
			System.out.println("새 주소가 없으므로 기존주소 사용");
			address = originAddress;
		}

		int check = md.userCheck(id, origin_pass);
		// check==0 이면 자바스크립트 "비밀번호 틀림" 뒤로이동
		// check==-1 이면(나머지) 자바스크립트 "아이디없음" 뒤로이
		if (check == 1) {
			mb.setId(id);
			mb.setPass(pass);
			mb.setName(request.getParameter("name"));
			mb.setEmail(request.getParameter("email"));
			mb.setAddress(address);
			mb.setPhone(request.getParameter("phone"));
			mb.setMobile(request.getParameter("mobile"));
			md.updateMember(mb);
			// main.jsp 이동
			response.sendRedirect("login.jsp");
		}
		if (check == 0) {
			String msg = "기존 비밀번호가 올바르지 않습니다";
			String str = "";
			str = "<script language='javascript'>";
			str += "alert('" + msg + "');"; // 얼럿창 띄우기
			str += "history.go(-1);"; // 이전페이지로 가기
			str += "</script>";
			out.print(str);

		}
		if (check == -1) {
			String msg = "해당 아이디가 존재하지 않습니다";
			String str = "";
			str = "<script language='javascript'>";
			str += "alert('" + msg + "');"; // 얼럿창 띄우기
			str += "history.go(-1);"; // 이전페이지로 가기
			str += "</script>";
			out.print(str);
		}
	}

}
