package board;

import java.sql.Timestamp;

enum ColumnName {
	COMMENT_NUM,		// 댓글 글번호
	COMMENT_BOARD,		// 게시글 글번호	
	COMMENT_ID,		// 댓글 작성자
	COMMENT_DATE,	// 댓글 작성일
	COMMENT_PARENT,		// 부모 댓글
	COMMENT_CONTENT,	// 댓글 내용
}

public class CommentBean {
	private int comment_num;		// 댓글 글번호
	private int comment_board;		// 게시글 글번호	
	private String comment_id;		// 댓글 작성자
	private Timestamp comment_date;	// 댓글 작성일
	private int comment_parent;		// 부모 댓글
	private String comment_content;	// 댓글 내용
	
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getComment_board() { 
		return comment_board;
	}
	public void setComment_board(int comment_board) {
		this.comment_board = comment_board;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public Timestamp getComment_date() {
		return comment_date;
	}
	public void setComment_date(Timestamp comment_date) {		
		this.comment_date = comment_date;
	}
	public int getComment_parent() {
		return comment_parent;
	}
	public void setComment_parent(int comment_parent) {
		this.comment_parent = comment_parent;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	
	
}
