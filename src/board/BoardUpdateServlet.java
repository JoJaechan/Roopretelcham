package board;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import file.FileBean;
import file.Thumbnail;
import table.Table;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/BoardUpdate")
@MultipartConfig(fileSizeThreshold = 0)
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardUpdateServlet() {
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
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String realPath = request.getServletContext().getRealPath("/upload");

		File fileSaveDir = new File(realPath);

		// 파일 경로 없으면 생성
		if (!fileSaveDir.exists())
			fileSaveDir.mkdirs();
		
		String name = request.getParameter("name");
//		String pass = request.getParameter("pass");
//		String id = request.getParameter("id");

		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String num = request.getParameter("num");

		String tableName = request.getParameter("tableName");
		System.out.println("tableName : " + tableName);
		Table tableEnum = Table.valueOf(tableName);

		System.out.println("/BoardUpdate tableName : " + tableName);
		System.out.println("/BoardUpdate content : " + content);
		BoardDAO dao = new BoardDAO();
		BoardBean bean = new BoardBean();
		Timestamp date = new Timestamp(System.currentTimeMillis());

		bean.setName(name);
		if (num != null) {
			bean.setNum(Integer.parseInt(num));
		}
//		bean.setPass(pass);
		bean.setSubject(subject);
		bean.setContent(content);
		bean.setReadcount(0);
		bean.setDate(date);

		dao.articleUpdate(bean, tableEnum);

		String htmlTable = content;
		Document doc = Jsoup.parse(htmlTable);

		// then use something like this to get your element:
		org.jsoup.select.Elements imgs = doc.getElementsByTag("img");
		
		switch (tableEnum) {
		case BOARD:
			updateFiles(imgs, realPath, bean, tableEnum, Table.FILE);
			response.sendRedirect("/community/community.jsp");
			break;
		case BOARD_GALLERY:
			updateFiles(imgs, realPath, bean, tableEnum, Table.FILE_GALLERY);
			response.sendRedirect("/gallery/gallery.jsp");
			break;
		case BOARD_PDS:
			Collection<Part> parts = request.getParts();
			List<FileBean> fbList = new ArrayList<FileBean>();
			
			for (Part p : parts) {
//				System.out.println(p.getName());
				if (p.getHeader("Content-Disposition").contains("filename=")) {

					if (p.getSize() > 0) {
						String fileName = p.getSubmittedFileName();
						String filePath = realPath + File.separator + fileName;
						p.write(filePath);
						FileBean fb = new FileBean();
						fb.setFile_name(fileName);
						fb.setFile_path(filePath);
						fb.setDate(date);
						
						Thumbnail thumbnail = new Thumbnail();			
						String thumbPath = thumbnail.thumbnailMake(filePath, filePath);

						System.out.println("thumbPath : " + thumbPath);
						fb.setThumb_path(thumbPath);					
						
						fbList.add(fb);
					}
				}
			}			
			dao.articleUpdateFile(fbList, bean, Table.BOARD_PDS, Table.FILE_PDS);
			
			response.sendRedirect("/pds/download.jsp");
			break;
		default:
			break;
		}

	}
	
	public void updateFiles(org.jsoup.select.Elements imgs, String realPath, BoardBean bean,
			Table boardTable, Table fileTable) {
		BoardDAO dao = new BoardDAO();
		List<FileBean> fbList = new ArrayList<FileBean>();
		
		for (Element element : imgs) {
			System.out.println("imgs : " + element.attr("src"));
			dao.articleUpdateFile(fbList, bean, boardTable, fileTable);
			Timestamp date = new Timestamp(System.currentTimeMillis());

			String src = element.attr("src");
			File f = new File(src);
			String fileName = f.getName();
			String filePath = realPath + File.separator + fileName;
			FileBean fb = new FileBean();
			fb.setFile_name(fileName);
			fb.setFile_path(filePath);
			fb.setDate(date);

			Thumbnail thumbnail = new Thumbnail();			
			String thumbPath = thumbnail.thumbnailMake(filePath, filePath);

			System.out.println("thumbPath : " + thumbPath);
			fb.setThumb_path(thumbPath);
			
			fbList.add(fb);
		}
		
		dao.articleUpdateFile(fbList, bean, boardTable, fileTable);
	}

}
