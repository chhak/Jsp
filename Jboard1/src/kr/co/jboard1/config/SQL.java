package kr.co.jboard1.config;

public class SQL {

	// 회원 관련
	// 게시물 관련
	public final static String INSERT_ARTICLE = "INSERT INTO `JBOARD_ARTICLE` SET "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "`uid`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
		   
	
	
}
