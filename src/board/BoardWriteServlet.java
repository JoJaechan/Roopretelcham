package board;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.lang.model.util.Elements;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

/**
 * Servlet implementation class BoardWrite
 */
@WebServlet("/BoardWrite")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
        System.out.println("BoardWriteServlet()");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String name = request.getParameter("name");
//		String pass = request.getParameter("pass");
//		String id = request.getParameter("id");
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		System.out.println("content : " + content);
		BoardDAO dao = new BoardDAO();
		BoardBean bean = new BoardBean();
		Timestamp date = new Timestamp(System.currentTimeMillis());
		
		bean.setName(name);
//		bean.setPass(pass);
		bean.setSubject(subject);
		bean.setContent(content);
		bean.setReadcount(0);
		bean.setDate(date);

		dao.articleWrite(bean);

		String htmlTable= content;
		Document doc = Jsoup.parse(htmlTable);

		// then use something like this to get your element:
		org.jsoup.select.Elements imgs = doc.getElementsByTag("img");
		
		 for (Element element : imgs) {
			 System.out.println("imgs : " + element.attr("src"));
		}
		
		response.sendRedirect("/community/community.jsp");
	}

	
}
