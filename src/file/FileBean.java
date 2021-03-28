package file;

import java.sql.Timestamp;

//CREATE TABLE IF NOT EXISTS `file` ( 
//		  file_idx int(11) AUTO_INCREMENT, 
//		  post_idx int(11), 
//		  file_name varchar(200), 
//		  file_path varchar(2000), 
//		  uploaded datetime, 
//		  PRIMARY KEY( file_idx ), 
//		  FOREIGN KEY (post_idx) REFERENCES board(num) 
//		) ENGINE=InnoDB DEFAULT CHARSET=utf8;
public class FileBean {
	private int file_idx;
	private int post_idx;
	private String file_name;
	private String file_path;
	private Timestamp date;

//	private String is_del = "N";	
	public int getFile_idx() {
		return file_idx;
	}

	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}

	public int getPost_idx() {
		return post_idx;
	}

	public void setPost_idx(int post_idx) {
		this.post_idx = post_idx;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

}
