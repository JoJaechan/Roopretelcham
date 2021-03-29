package file;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

import board.BoardBean;
import board.BoardDAO;


/**
 * Servlet implementation class PartUploadPro2Servlet
 */
@WebServlet("/partUploadPro2")
@MultipartConfig(fileSizeThreshold = 0)
public class PartUploadPro2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PartUploadPro2Servlet() {
		super();
		System.out.println("PartUploadPro2Servlet()");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		Collection<Part> parts = request.getParts();
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
		
		PrintWriter out = response.getWriter();
		String uploadFileNameList = "";
		List<FileBean> fbList = new ArrayList<FileBean>();
		
		for (Part p : parts) {
//			System.out.println(p.getName());
			if (p.getHeader("Content-Disposition").contains("filename=")) {

				if (p.getSize() > 0) {
					String fileName = p.getSubmittedFileName();
					String filePath = realPath + File.separator + fileName;
					p.write(filePath);
					FileBean fb = new FileBean();
					fb.setFile_name(fileName);
					fb.setFile_path(filePath);
					fb.setDate(date);
					fbList.add(fb);
				}
			}
		}
		dao.articleInsertImage(fbList, bean);
		out.println(uploadFileNameList); // + "파일 업로드 완료.");

		response.sendRedirect("/Roopretelcham/gallery.jsp");
	}
}
