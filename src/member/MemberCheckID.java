package member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import state.CheckState;

/**
 * Servlet implementation class MemberCheckID
 */
@WebServlet("/CheckID")
public class MemberCheckID extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberCheckID() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter writer = response.getWriter();

		//http://localhost:8080/FunWeb/member/idcheck.jsp?id=kim
		// id 파라미터 가져오기
		String id= request.getParameter("id");
		// MemberDAO mdao 객체생성
		MemberDAO mdao=new MemberDAO();
		// int 리턴할형   idcheck(String id)메서드 정의
		// int check = mdao주소를 통해서 idcheck(id) 메서드 호출
		CheckState isOK = mdao.userCheck(id);
		System.out.println("idCheck : " + id);
		//check==1 "기존회원 아이디 있음"  출력 "아이디 중복"
		//check==-1 "기존회원 아이디 없음"  출력 "아이디 사용가능"
		if(isOK==CheckState.WRONG_ID){
			writer.print(CheckState.WRONG_ID.name());
		}else if (isOK==CheckState.NO_VALUE){
			writer.print(CheckState.NO_VALUE.name());
		} else if(isOK==CheckState.OK) {
			writer.print(CheckState.OK.name());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
