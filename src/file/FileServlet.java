package file;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


/**
 * Servlet implementation class FileServlet
 */
@WebServlet("/FileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class FileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int maxRequestSize = 1024 * 1024 * 50;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");
		String path = "/upload"; // 개발자 지정 폴더
		String real_save_path = request.getServletContext().getRealPath(path);
		// 경로 없으면 mkdir로 생성
		File uploadDir = new File(real_save_path);

	    if(!uploadDir.exists()) {
	    	uploadDir.mkdir();
	    }
	    
	    System.out.println("real_save_path : " + real_save_path);
		
		MultipartRequest multi = new MultipartRequest(request, real_save_path, maxRequestSize, "UTF-8", new DefaultFileRenamePolicy());
		String fileName = multi.getOriginalFileName("upload"); // ckeditor5 static const
		JSONObject outData = new JSONObject();
		outData.put("uploaded", true);
		
		System.out.println("request.getContextPath() : " + request.getContextPath());
		path = request.getContextPath() + path;
		
		String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/" + fileName;
		outData.put("url", url);
		System.out.println("FileServlet -Upload : " + url);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(outData.toString());
		
		System.out.println(outData.toString());
	}

}
