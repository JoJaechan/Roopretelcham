package email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

import member.MemberBean;
import member.MemberDAO;
import table.Table;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;

	public GoogleAuthentication() {
		String userName;
		String password;
		MemberDAO dao = new MemberDAO();
		MemberBean mb = dao.getAdminMailInfo(Table.GMAIL);
		userName = mb.getName();
		password = mb.getPass();
		
		passAuth = new PasswordAuthentication(userName, password);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return passAuth;
	}
}