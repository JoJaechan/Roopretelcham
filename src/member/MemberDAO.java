package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {
	// 회원관련 데이터베이스 작업
	private Connection getConnection() throws Exception {		
		// 예기치 못한 에러가 발생한는 코드
		// 1단계 JDBC프로그램 불러오기 com\mysql\jdbc Driver.class
		Class.forName("com.mysql.jdbc.Driver");
		// 2단계 불러온 프로그램을 이용해서 DB서버
		// (디비주소,디비접근아이디,디비접근비밀번호) 접속 => 디비연결 정보를 저장
		String dbUrl = "jdbc:mysql://localhost:3306/jspdb7";
		String dbUser = "jspid";
		String dbPass = "jsppass";
		Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);

		return con;
	}

	// 회원가입 기능(회원가입 메서드)
	// public void insertMember(전달받은 값을 저장하는 변수)
	public boolean insertMember(MemberBean mem) {
		boolean isOk = false;
		
		String id = mem.getId();
		String pass = mem.getPass();
		String name = mem.getName();
		Timestamp date = mem.getDate();
		String email = mem.getEmail();
		String address = mem.getAddress();
		String phone = mem.getPhone();
		String mobile = mem.getMobile();		
		
		System.out.println("전달받은 아이디 : " + id);
		System.out.println("전달받은 비밀번호 : " + pass);
		System.out.println("전달받은 이름 : " + name);
		System.out.println("전달받은 이메일 : " + email);
		System.out.println("전달받은 주소 : " + address);
		System.out.println("전달받은 전화 : " + phone);
		System.out.println("전달받은 휴대전화 : " + mobile);

		// 외부에 있는 파일,데이터베이스 서버에 접근하기 위해서는
		// 예기치 못한 에러가 발생하면 자바코드중에 자동으로 에러를 처리
		try {
			Connection con = getConnection();

			// 3단계 디비연결정보를 이용해서 SQL구문(insert)을 만들고 실행할 준비
			// SQL구문을 만들고 실행할수 있는 내장객체
			String sql = "insert into member(id,pass,name,date, email, address, phone, mobile) values(?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, name);
			pstmt.setTimestamp(4, date);
			pstmt.setString(5, email);
			pstmt.setString(6, address);
			pstmt.setString(7, phone);
			pstmt.setString(8, mobile);
			// 4단계 SQL구문을 실행 (insert형태)
			pstmt.executeUpdate();
			isOk = true;
		} catch (Exception e) {
			// 에러 발생하면 에러메시지 출력			
			e.printStackTrace();
			return isOk;
		}
		return isOk;
	}

	public MemberBean getMember(String id) {
		MemberBean mb = new MemberBean();
		try {
			Connection con = getConnection();

			// 3단계 디비연결정보를 이용해서 SQL구문(insert)을 만들고 실행할 준비
			// SQL구문을 만들고 실행할수 있는 내장객체
			String sql = "select * from member where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4단계 SQL구문을 실행 (insert형태)
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				mb.setDate(rs.getTimestamp("date"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setPass(rs.getString("pass"));
				
				mb.setAddress(rs.getString("address"));
				mb.setEmail(rs.getString("email"));
				mb.setMobile(rs.getString("mobile"));
				mb.setPhone(rs.getString("phone"));
			}
			System.out.println("date : " + mb.getDate());

		} catch (Exception e) {
			// 에러 발생하면 에러메시지 출력
			e.printStackTrace();
		}
		return mb;
	}	
	
	public List<MemberBean> getMemberList() {
		MemberBean mb = new MemberBean();
		List<MemberBean> mbList = new ArrayList<MemberBean>();
		
		try {
			Connection con = getConnection();
			String sql = "select * from member";
			PreparedStatement pstmt = con.prepareStatement(sql);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				mb.setDate(rs.getTimestamp("date"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setPass(rs.getString("pass"));
				
				mb.setAddress(rs.getString("address"));
				mb.setEmail(rs.getString("email"));
				mb.setMobile(rs.getString("mobile"));
				mb.setPhone(rs.getString("phone"));
				mbList.add(mb);
			}			

		} catch (Exception e) {
			// 에러 발생하면 에러메시지 출력
			e.printStackTrace();
		}
		return mbList;
	}

	public int userCheck(String id, String pass) {
		int result = -1;
		System.out.println("userCheck() id :" + id);
		MemberBean mb = getMember(id);

		if (mb.getId() == null) {
			System.out.println("id불일치");
			return result;
		}
		// 1 : id,pw 일치, 0 : id일치 pw틀림, -1 : id 불일치
		if (id.equals(mb.getId()) && pass.equals(mb.getPass())) {
			System.out.println("id, pw 일치");
			
			result = 1;
		} else if (id.equals(mb.getId()) && pass.equals(mb.getPass()) == false) {
			System.out.println("id일치, pw 불일치");
			result = 0;
		}

		return result;
	}
	
	public int userCheck(MemberBean mb, String id, String pass) {
		int result = -1;

		if (mb.getId() == null) {
			System.out.println("id불일치");
			return result;
		}
		// 1 : id,pw 일치, 0 : id일치 pw틀림, -1 : id 불일치
		if (id.equals(mb.getId()) && pass.equals(mb.getPass())) {
			System.out.println("id, pw 일치");
			
			result = 1;
		} else if (id.equals(mb.getId()) && pass.equals(mb.getPass()) == false) {
			System.out.println("id일치, pw 불일치");
			result = 0;
		}

		return result;
	}

	public void updateMember(MemberBean mb) {
		// 3단계 update //4단계 실행 // main.jsp 이동
		try {
			Connection con = getConnection();
			String sql2 = "update member set name=?,"
					+ "pass=?, email=?, address=?, phone=?,"
					+ "mobile=? where id=?";
			PreparedStatement pstmt2 = con.prepareStatement(sql2);
			pstmt2.setString(1, mb.getName());
			pstmt2.setString(2, mb.getPass());
			pstmt2.setString(3, mb.getEmail());
			pstmt2.setString(4, mb.getAddress());
			pstmt2.setString(5, mb.getPhone());
			pstmt2.setString(6, mb.getMobile());
			
			pstmt2.setString(7, mb.getId());
			pstmt2.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean updateMemberPassword(String newPassword, String id) {
		// 3단계 update //4단계 실행 // main.jsp 이동
		try {
			Connection con = getConnection();
			String sql2 = "update member set pass=? where id=?";
			PreparedStatement pstmt2 = con.prepareStatement(sql2);
			pstmt2.setString(1, newPassword);
			pstmt2.setString(2,  id);
			pstmt2.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// 리턴값 없음 mdao.deleteMember(mb);
	public void deleteMember(MemberBean mb) {
		try {
			Connection con = getConnection();
			// 3단계 delete
			String sql = "delete from member where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			// 4단계 실행
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberBean getMemberInfoByEmail(String email) {
		MemberBean mb = new MemberBean();
		try {
			Connection con = getConnection();

			String sql = "select * from member where email=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				mb.setDate(rs.getTimestamp("date"));
				mb.setId(rs.getString("id"));
				mb.setName(rs.getString("name"));
				mb.setPass(rs.getString("pass"));
				
				mb.setAddress(rs.getString("address"));
				mb.setEmail(rs.getString("email"));
				mb.setMobile(rs.getString("mobile"));
				mb.setPhone(rs.getString("phone"));
			}
			System.out.println("date : " + mb.getDate());

		} catch (Exception e) {
			// 에러 발생하면 에러메시지 출력
			e.printStackTrace();
		}
		return mb;
<<<<<<< HEAD
	}
=======
	}	
>>>>>>> branch 'master' of https://github.com/imrutel/Roopretelcham

}
