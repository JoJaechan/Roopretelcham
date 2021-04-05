package board;

import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import file.FileBean;
import state.CheckState;
import table.Table;

public class BoardDAO {
	// 회원관련 데이터베이스 작업
	private Connection getConnection() throws Exception {
//		// 예기치 못한 에러가 발생한는 코드
//		// 1단계 JDBC프로그램 불러오기 com\mysql\jdbc Driver.class
//		Class.forName("com.mysql.jdbc.Driver");
//		// 2단계 불러온 프로그램을 이용해서 DB서버
//		// (디비주소,디비접근아이디,디비접근비밀번호) 접속 => 디비연결 정보를 저장
//		String dbUrl = "jdbc:mysql://localhost:3306/jspdb7";
//		String dbUser = "jspid";
//		String dbPass = "jsppass";
//		Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
//		return con;
		
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/Mysql");
		Connection con = ds.getConnection();
		return con;		
	}

	public int getMaxArticleNum() {
		// 3단계 board테이블에서 num가 가장 큰 번호 구하기+1=> 이번에 등록할번호
		int num = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			String sql2 = "select max(num) from board";
			pstmt = con.prepareStatement(sql2);
			// 4단계 실행 => 결과 rs 저장
			rs = pstmt.executeQuery();
			// 5단계 rs 다음행 이동 => 무조건 데이터 있음 => 데이터 가져와서+1
			if (rs.next()) {
				num = rs.getInt("max(num)") + 1;
			}

		} catch (Exception e) {
			// 에러 발생하면 에러메시지 출력
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return num;
	}

	public void articleWrite(BoardBean bb) {
//		int num = bb.getNum();
		String name = bb.getName();
//		String pass = bb.getPass();
		String subject = bb.getSubject();
		String content = bb.getContent();
		int readcount = bb.getReadcount();
		Timestamp date = bb.getDate();
		
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;

		try {
			con = getConnection();

			String sql = "insert into board(name,subject,content,readcount,date) " + "values(?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, num);
			pstmt.setString(1, name);
//			pstmt.setString(2, pass);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setInt(4, readcount);
			pstmt.setTimestamp(5, date);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}

	}

	public List<BoardBean> selectBoard() {
		List<BoardBean> bbList = new ArrayList<BoardBean>();
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		try {
			 con = getConnection();
			String sql = "select * from board order by num desc";
			 pstmt = con.prepareStatement(sql);
			 rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setName(rs.getString("name"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bbList.add(bb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
		return bbList;
	}

	public List<BoardBean> selectBoard(String tableName) {
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		List<BoardBean> bbList = new ArrayList<BoardBean>();
		
		try {
			try {
				con = getConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// 3단계 디비연결정보를 이용해서 SQL구문(select)을 만들고 실행할 준비
			String sql = "select * from " + tableName + " order by num desc";
			 pstmt = con.prepareStatement(sql);
			// 4단계 SQL구문을 실행 (select 형태) 결과를 ResultSet내장객체 저장
			 rs = pstmt.executeQuery();			

			while (rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setName(rs.getString("name"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bbList.add(bb);
			}
			return bbList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
		return bbList;
	}

	public List<BoardBean> selectBoard(String tableName, int startRow, int pageSize) {
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		List<BoardBean> bbList = new ArrayList<BoardBean>();
		
		try {
			con = getConnection();
			// 3단계 디비연결정보를 이용해서 SQL구문(select)을 만들고 실행할 준비
			String sql = "select * from " + tableName + " order by num desc limit ?,?";
			 pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
			 rs = pstmt.executeQuery();

			bbList = new ArrayList<BoardBean>();

			while (rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setDate(rs.getTimestamp("date"));
				bb.setName(rs.getString("name"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bbList.add(bb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
		return bbList;
	}

	public BoardBean getArticle(int num) {
		BoardBean bb = new BoardBean();
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		try {
			 con = getConnection();
			String sql = "select * from board where num=?";
			 pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 SQL구문을 실행 (select 형태) 결과를 ResultSet내장객체 저장
			 rs = pstmt.executeQuery();
			if (rs.next()) {
				// num 멤버변수 <- 디비에서 가져온 rs.getInt("num") 저장
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
//				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}

		return bb;
	}

	public BoardBean getArticle(int num, String tableName) {
		BoardBean bb = new BoardBean();
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			 con = getConnection();
			String sql = "select * from " + tableName + " where num=?";
			 pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 SQL구문을 실행 (select 형태) 결과를 ResultSet내장객체 저장
			 rs = pstmt.executeQuery();
			if (rs.next()) {
				// num 멤버변수 <- 디비에서 가져온 rs.getInt("num") 저장
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
//				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getTimestamp("date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}

		return bb;
	}

	// check==1 수정 list.jsp 이동
	// check==0 "비밀번호틀림" 뒤로이동
	// check==-1 "num없음" 뒤로이동
	public CheckState articleCheck(int num, String pass, Table table) {

		System.out.println("userCheck() num :" + num + ", pass : " + pass);
		BoardBean bb = getArticle(num, table.name());

		System.out.println("boardBean pass : " + bb.getPass());
		System.out.println("boardBean name : " + bb.getName());

		if (bb.getNum() == 0) {
			System.out.println("num 없음");
			return CheckState.NO_NUM_VALUE;
		}
		// 1 : id,pw 일치, 0 : id일치 pw틀림, -1 : id 불일치
		if (num == bb.getNum() && pass.equals(bb.getPass())) {
			System.out.println("id, pw 일치");
			return CheckState.OK;
		} else if (pass.equals(bb.getPass()) == false) {
			System.out.println("pw 불일치");
			return CheckState.WRONG_PASSWORD;
		}

		return CheckState.WRONG_PASSWORD;
	}

	public CheckState articleCheck(int num, Table table) {

		System.out.println("userCheck() num :" + num);
		BoardBean bb = getArticle(num, table.name());

		if (bb == null) {
			return CheckState.NO_NUM_VALUE;
		}

		System.out.println("boardBean pass : " + bb.getPass());
		System.out.println("boardBean name : " + bb.getName());

		if (bb.getNum() == 0) {
			System.out.println("num 없음");
			return CheckState.NO_NUM_VALUE;
		} else {
			return CheckState.OK;
		}
	}

	public CheckState articleCheck(String id, int num, Table table) {
		BoardBean bb = getArticle(num, table.name());
		System.out.println("boardBean name : " + bb.getName());
		;

		if (bb.getNum() == 0) {
			System.out.println("num 없음");
			return CheckState.NO_NUM_VALUE;
		}
		// 1 : id,pw 일치, 0 : id일치 pw틀림, -1 : id 불일치
		if (num == bb.getNum() && id.equals(bb.getName())) {
			System.out.println("id, pw 일치");
			return CheckState.OK;
		} else if (id.equals(bb.getName()) == false) {
			System.out.println("세션값 아이디와 불일치");
			return CheckState.WRONG_ID;
		}

		return CheckState.WRONG_ID;
	}

	public void articleUpdate(BoardBean bb) {
//		String sql2 = "update board set name=?,subject=?,content=? where num=?";
		System.out.println("articleUpdate() subject : " + bb.getSubject());
		System.out.println("articleUpdate() content : " + bb.getContent());
		System.out.println("articleUpdate() num : " + bb.getNum());

		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		try {
			 con = getConnection();
			String sql2 = "update board set subject=?, content=? where num=?";
			 pstmt2 = con.prepareStatement(sql2);
//			pstmt2.setString(1, bb.getName());
			pstmt2.setString(1, bb.getSubject());
			pstmt2.setString(2, bb.getContent());
			pstmt2.setInt(3, bb.getNum());
			// 4단계 실행
			pstmt2.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
	}

//	public void articleDelete(int num, String pass) {
//		try {
//			Connection con = getConnection();
//			String sql2 = "delete from board where num=?";
//			System.out.println("articleDelete -> " + sql2.replace("=?", "=" + num));
//			PreparedStatement pstmt2 = con.prepareStatement(sql2);
//			pstmt2.setInt(1, num);
//			pstmt2.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

	public void articleDelete(int num) {
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		try {
			 con = getConnection();
			String sql2 = "delete from board where num=?";
			System.out.println("articleDelete -> " + sql2.replace("=?", "=" + num));
			 pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
	}

	public CheckState articleDelete(int num, String pass, Table tableName) {
		CheckState result = CheckState.NO_NUM_VALUE;
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			 con = getConnection();
			String sql2 = "delete from " + tableName.name() + "where num=? and pass=?";

			System.out.println("articleDelete -> " + sql2.replace("=?", "=" + num));
			 pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.setString(2, pass);
			pstmt2.executeUpdate();
			result = CheckState.OK;
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
		return result;
	}

	public CheckState articleDelete(int num, Table tableName) {
		CheckState result = CheckState.NO_NUM_VALUE;
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			 con = getConnection();
			String sql2 = "delete from " + tableName.name() + " where num=?";

			System.out.println("articleDelete -> " + sql2.replace("=?", "=" + num));
			 pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.executeUpdate();
			result = CheckState.OK;
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
		return result;
	}

	public void articleUpdateReadCount(int num) {
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		try {
			 con = getConnection();
			String sql2 = "update board set readcount = readcount +1 where num=?";
			 pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
	}

	public void articleUpdateReadCount(int num, Table table) {
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			 con = getConnection();
			String sql2 = "update " + table.name() + " set readcount = readcount +1 where num=?";
			 pstmt2 = con.prepareStatement(sql2);
			pstmt2.setInt(1, num);
			pstmt2.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
	}

//	CREATE TABLE IF NOT EXISTS `file` ( 
//			  file_idx int(11) AUTO_INCREMENT, 
//			  post_idx int(11), 
//			  file_name varchar(200), 
//			  file_path varchar(2000), 
//			  uploaded datetime, 
//			  PRIMARY KEY( file_idx ), 
//			  FOREIGN KEY (post_idx) REFERENCES board(num) 
//			) ENGINE=InnoDB DEFAULT CHARSET=utf8;
	public void articleInsertFile(List<FileBean> fbList, BoardBean bb) {
//		int file_idx = fb.getFile_idx();
//		int post_idx = fb.getPost_idx();
		String name = bb.getName();
//		String pass = bb.getPass();
		String subject = bb.getSubject();
		String content = bb.getContent();
		int readcount = bb.getReadcount();
		Timestamp date = bb.getDate();

		System.out.println("articleInsertFile");
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		try {
			 con = getConnection();

			String sql1 = "insert into board(name,pass,subject,content,readcount,date) " + "values(?,?,?,?,?,?)";
			 pstmt = con.prepareStatement(sql1);
//			pstmt.setInt(1, num);
			pstmt.setString(1, name);
//			pstmt.setString(2, pass);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);
			pstmt.setInt(5, readcount);
			pstmt.setTimestamp(6, date);
			pstmt.executeUpdate();

			String sqlGetId = "SELECT LAST_INSERT_ID()";
			 pstmt2 = con.prepareStatement(sqlGetId);
			 rs = pstmt2.executeQuery();
			int n = -1;
			if (rs.next()) {
				n = rs.getInt("LAST_INSERT_ID()");
			}
			System.out.println("LAST_INSERT_ID() : " + n);
			String insertSQL = "insert into file" + "(post_idx,file_name,file_path,uploaded) " + "values(?,?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(insertSQL);

			for (FileBean f : fbList) {
				String file_name = f.getFile_name();
				String file_path = f.getFile_path();
				Timestamp uploaded = f.getDate();

				System.out.println("fbList -> " + file_name);
				pstmt3.setInt(1, n);
				pstmt3.setString(2, file_name);
				pstmt3.setString(3, file_path);
				pstmt3.setTimestamp(4, uploaded);
				pstmt3.executeUpdate();
			}
//			pstmt3.executeBatch();
//			con.commit();

		} catch (Exception e) {
			// 에러 발생하면 에러메시지 출력
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
	}

	public void articleInsertFile(List<FileBean> fbList, BoardBean bb, Table boardTable, Table fileTable) {
//		int file_idx = fb.getFile_idx();
//		int post_idx = fb.getPost_idx();
		String name = bb.getName();
//		String pass = bb.getPass();
		String subject = bb.getSubject();
		String content = bb.getContent();
		int readcount = bb.getReadcount();
		Timestamp date = bb.getDate();

		System.out.println("articleInsertFile");
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		try {
			 con = getConnection();

			String sql1 = "insert into " + boardTable.name() + "(name,subject,content,readcount,date) "
					+ "values(?,?,?,?,?)";
			 pstmt = con.prepareStatement(sql1);
			System.out.println("articleInsertFile -> sql : " + sql1);

//			pstmt.setInt(1, num);
			pstmt.setString(1, name);
//			pstmt.setString(2, pass);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setInt(4, readcount);
			pstmt.setTimestamp(5, date);
			pstmt.executeUpdate();

			String sqlGetId = "SELECT LAST_INSERT_ID()";
			 pstmt2 = con.prepareStatement(sqlGetId);
			 rs = pstmt2.executeQuery();
			int n = -1;
			if (rs.next()) {
				n = rs.getInt("LAST_INSERT_ID()");
			}
			System.out.println("LAST_INSERT_ID() : " + n);
			String insertSQL = "insert into " + fileTable.name() + "(post_idx,file_name,file_path,uploaded, thumb_path) "
					+ "values(?,?,?,?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(insertSQL);
			System.out.println("insertSQL -> sql : " + insertSQL);

			for (FileBean f : fbList) {
				String file_name = f.getFile_name();
				String file_path = f.getFile_path();
				Timestamp uploaded = f.getDate();
				String thumb_path = f.getThumb_path();

				System.out.println("fbList -> " + file_name);
				pstmt3.setInt(1, n);
				pstmt3.setString(2, file_name);
				pstmt3.setString(3, file_path);
				pstmt3.setTimestamp(4, uploaded);
				pstmt3.setString(5, thumb_path);
				pstmt3.executeUpdate();
			}
//			pstmt3.executeBatch();
//			con.commit();

		} catch (Exception e) {
			// 에러 발생하면 에러메시지 출력
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
	}

	public List<FileBean> getArticleFileList(int post_idx) {

		List<FileBean> fbList = new ArrayList<FileBean>();
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		try {
			 con = getConnection();
			String sql = "select * from file_pds where post_idx=?";
			 pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, post_idx);
			// 4단계 SQL구문을 실행 (select 형태) 결과를 ResultSet내장객체 저장
			 rs = pstmt.executeQuery();
			while (rs.next()) {
				FileBean fb = new FileBean();
				String file_name = rs.getString("file_name");
				int post_idx1 = rs.getInt("post_idx");
				String fPath = rs.getString("file_path");

				fb.setFile_idx(rs.getInt("file_idx"));
				fb.setPost_idx(post_idx1);
				fb.setFile_name(file_name);
				fb.setFile_path(fPath);
				fb.setDate(rs.getTimestamp("uploaded"));
				System.out.println("articleDownloadFile() file_path : " + fPath + ", \n post_idx :" + post_idx1);
				fbList.add(fb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
		return fbList;
	}

	public FileBean getArticleThumbFile(int post_idx) {
		String sql = "select * from" + "file_pds "
				+ "WHERE post_idx=? and "
				+ "(file_name REGEXP ('jfif|jpg|gif|png') OR file_path REGEXP ('jfif|jpg|gif|png')) LIMIT 1;";
//				"select * from file where file_name like '%jpg%' and post_idx=? limit 1;";

		FileBean fb = new FileBean();
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			 con = getConnection();
			 pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, post_idx);
			// 4단계 SQL구문을 실행 (select 형태) 결과를 ResultSet내장객체 저장
			 rs = pstmt.executeQuery();
			if (rs.next()) {
				fb.setFile_name(rs.getString("file_name"));
				fb.setFile_path(rs.getString("file_path"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}

		return fb;
	}

	public FileBean getArticleThumbFile(int post_idx, String tableName) {
		String sql = "select * from " + tableName
				+ " WHERE post_idx=? and "
				+ "(thumb_path REGEXP ('jfif|jpg|gif|png') OR file_path REGEXP ('jfif|jpg|gif|png')) LIMIT 1";
//				"select * from " + tableName + " where file_name like '%jpg%' and post_idx=? limit 1;";

		System.out.println("getArticleThumbFile : " + sql);
		FileBean fb = new FileBean();
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		try {
			 con = getConnection();
			 pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, post_idx);
			// 4단계 SQL구문을 실행 (select 형태) 결과를 ResultSet내장객체 저장
			 rs = pstmt.executeQuery();
			if (rs.next()) {
				fb.setFile_name(rs.getString("file_name"));
				fb.setFile_path(rs.getString("file_path"));
				fb.setThumb_path(rs.getString("thumb_path"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}

		return fb;
	}

	public List<CommentBean> getArticleComment(int post_idx, String tableName) {
		String sql = "select * from " + tableName + " WHERE comment_board = ?";
		System.out.println("getArticleComment() : " + sql);
		List<CommentBean> commentList = new ArrayList<CommentBean>();
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			 con = getConnection();
			 pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, post_idx);
			// 4단계 SQL구문을 실행 (select 형태) 결과를 ResultSet내장객체 저장
			 rs = pstmt.executeQuery();
			if (rs.next()) {
				CommentBean cb = new CommentBean();
				cb.setComment_board(post_idx);
				cb.setComment_content(rs.getString(ColumnName.COMMENT_CONTENT.name()));
				cb.setComment_date(rs.getTimestamp(ColumnName.COMMENT_DATE.name()));
				cb.setComment_id(rs.getString(ColumnName.COMMENT_ID.name()));
				cb.setComment_num(rs.getInt(ColumnName.COMMENT_NUM.name()));
				cb.setComment_parent(0);
				commentList.add(cb);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}

		return commentList;
	}

	public void writeComment(CommentBean cb, String tableName) {
		String name = cb.getComment_id();
		String content = cb.getComment_content();
		int articleID = cb.getComment_board();
		Timestamp date = cb.getComment_date();

		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		try {
			 con = getConnection();

			String sql = "insert into " + tableName + "(COMMENT_BOARD, COMMENT_ID, COMMENT_DATE, COMMENT_CONTENT) "
					+ "values(?,?,?,?)";
			 pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, articleID);
			pstmt.setString(2, name);
			pstmt.setTimestamp(3, date);
			pstmt.setString(4, content);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// 에러 발생하면 에러메시지 출력
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
	}

	public int articleGetCount(String tableName) {
		int count = 0;
		String sql = "SELECT COUNT(*) FROM " + tableName;
		Connection con=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		
		try {
			 con = getConnection();
			 pstmt2 = con.prepareStatement(sql);
			// 4단계 실행 => 결과 rs 저장
			 rs = pstmt2.executeQuery();
			if (rs.next()) {
				count = rs.getInt("COUNT(*)"); //+ 1;
			}

		} catch (Exception e) {
			// 에러 발생하면 에러메시지 출력
			e.printStackTrace();
		}finally {
			// 예외 상관없이 마무리 작업(기억장소 해제) 
			if(rs!=null) try{ rs.close();}catch(SQLException ex) {}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex) {}
			if(pstmt2!=null) try {pstmt2.close();}catch(SQLException ex) {}
			if(con!=null) try{con.close();}catch(SQLException ex) {}
		}
		return count;
	}

}
