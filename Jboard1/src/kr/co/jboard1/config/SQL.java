package kr.co.jboard1.config;

public class SQL {

	// ȸ�� ����
	// �Խù� ����
	public final static String SELECT_ARTICLES = "SELECT * FROM `JBOARD_ARTICLE`";
	
	public final static String INSERT_ARTICLE = "INSERT INTO `JBOARD_ARTICLE` SET "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "`uid`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
		   
	
	
}
