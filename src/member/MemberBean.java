package member;

import java.sql.Timestamp;

public class MemberBean {
	// 전달할 데이터를 MemberBean 담아서 전달
	// 멤버변수 정의 => 외부에서 아무나 접근 못하게 막아서 전달
	// 데이터 은닉
	private String id;
	private String pass;
	private String name;
	private String email;	
	private String address;
	private String phone;
	private String mobile;
	
	private Timestamp date;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	// 멤버변수를 사용하기위해서  
	// 멤버변수에 값을 저장하기위해서 set메서드를 만들어서 접근
	public void setId(String id) {
//		멤버변수 id=외부에서 받은 id;
		this.id=id;
	}
	// 멤버변수에 값을 가져오기위해서 get메서드를 만들어서 접근
	public String getId() {
		// 멤버변수를 외부에 리턴
		return id;
	}
	// alt shfit s    r
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	
	
	
}
