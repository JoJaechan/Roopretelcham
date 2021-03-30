package board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import file.FileBean;
import table.Table;

/**
 * Servlet implementation class GalleryWriteServlet
 */
@WebServlet("/GalleryWrite")
public class GalleryWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GalleryWriteServlet() {
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

		request.setCharacterEncoding("UTF-8");

		String realPath = request.getServletContext().getRealPath("/upload");

		File fileSaveDir = new File(realPath);

		// 파일 경로 없으면 생성
		if (!fileSaveDir.exists())
			fileSaveDir.mkdirs();
		// Article Write
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");

		int readcount = 0;
		Timestamp date = new Timestamp(System.currentTimeMillis());

		BoardDAO dao = new BoardDAO();
		BoardBean bean = new BoardBean();
		bean.setName(name);
		bean.setPass(pass);
		bean.setSubject(subject);
		bean.setContent(content);
		bean.setReadcount(readcount);
		bean.setDate(date);

		List<FileBean> fbList = new ArrayList<FileBean>();

		System.out.println("htmlTable : " + content);
		String htmlTable = content;
		Document doc = Jsoup.parse(htmlTable);
		
		// then use something like this to get your element:
		org.jsoup.select.Elements imgs = doc.getElementsByTag("img");

		for (Element element : imgs) {
			String src = element.attr("src");
			File f = new File(src);
			String fileName = f.getName();
			String filePath = realPath + File.separator + fileName;
			FileBean fb = new FileBean();
			fb.setFile_name(fileName);
			fb.setFile_path(filePath);
			fb.setDate(date);
			fbList.add(fb);
			System.out.println("imgs : " + src);
		}
		dao.articleInsertFile(fbList, bean, Table.BOARD_GALLERY, Table.FILE_GALLERY);

		response.sendRedirect("gallery.jsp");
	}

}
