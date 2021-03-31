package email;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberBean;
import member.MemberDAO;

/**
 * Servlet implementation class EmailSendServlet
 */
@WebServlet("/emailSend")
public class EmailSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmailSendServlet() {
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
//		String sender = request.getParameter("sender");
		String receiver = request.getParameter("receiver");
//		String subject = request.getParameter("subject");
//		String content = request.getParameter("content");

		MemberDAO dao = new MemberDAO();
		MemberBean mb = dao.getMemberInfoByEmail(receiver);
		if (mb == null || receiver.equals(mb.getEmail()) == false) {
			String msg = "해당 이메일로 가입한 계정이 없습니다";
			String str = "";
			str = "<script language='javascript'>";
			str += "alert('" + msg + "');"; // 얼럿창 띄우기
			str += "history.go(-1);"; // 이전페이지로 가기
			str += "</script>";
			out.print(str);
			return;
		}

		System.out.println("forgot password - email : " + receiver);
		String newPassword = randomPw();// mb.getPass();
		String subject = "Roopretelcham - 비밀번호 재설정 안내입니다.";
		String content = "재설정된 비밀번호는 " + newPassword + " 입니다<br>해당 비밀번호로 로그인 후 "
				+ "회원정보변경 메뉴에서 새로운 비밀번호로 변경하시길 권장드립니다.";
		String sender = "imrutel@gmail.com";

		System.out.println("forgot password : " + content);

		try {
			Properties properties = System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
			properties.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
			properties.put("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
			properties.put("mail.smtp.port", "587"); // gmail 포트
			Authenticator auth = new GoogleAuthentication();
			Session s = Session.getDefaultInstance(properties, auth);
			// Session s = Session.getdefultInstance(properties, auth);
			Message message = new MimeMessage(s);
			Address sender_address = new InternetAddress(sender);
			Address receiver_address = new InternetAddress(receiver);
			message.setHeader("content-type", "text/html;charset=UTF-8");
			message.setFrom(sender_address);
			message.addRecipient(Message.RecipientType.TO, receiver_address);
			message.setSubject(subject);
			message.setContent(content, "text/html;charset=UTF-8");
			message.setSentDate(new java.util.Date());
			Transport.send(message);

			boolean isOk = dao.updateMemberPassword(newPassword, mb.getId());
			if (isOk) {
				String msg = "가입하신 메일로 임시비밀번호가 발급되었습니다. 메일을 확인해주세요.";
				String str = "";
				str = "<script language='javascript'>";
				str += "alert('" + msg + "');"; // 얼럿창 띄우기
//			   str += "history.go(-1);";    //이전페이지로 가기
				str += "</script>";
				out.print(str);
				out.println("<script>location.href='login.jsp';</script>");
			} else {
				String msg = "임시비밀번호 발급에 실패했습니다. 다시 시도해주세요.";
				String str = "";
				str = "<script language='javascript'>";
				str += "alert('" + msg + "');"; // 얼럿창 띄우기
				str += "history.go(-1);"; // 이전페이지로 가기
				str += "</script>";
				out.print(str);
			}

		} catch (Exception e) {
//			out.println("SMTP 서버가 잘못 설정되었거나, 서비스에 문제가 있습니다.");
			e.printStackTrace();
		}
	}

	public static String randomPw() {
		char pwCollection[] = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A', 'B', 'C', 'D', 'E',
				'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u',
				'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*', '(', ')' };// 배열에 선언

		String ranPw = "";

		for (int i = 0; i < 20; i++) {
			// Math.rondom()은 0.0이상 1.0미만의 난수를 생성해 준다.
			int selectRandomPw = (int) (Math.random() * (pwCollection.length));
			ranPw += pwCollection[selectRandomPw];
		}
		return ranPw;
	}

}
