package state;

public enum CheckState {
	OK,	// 문제 없음
	WRONG_PASSWORD,	// "비밀번호틀림" 뒤로이동
	WRONG_ID,
	NO_NUM_VALUE	// 해당 게시물 번호 없음
}
