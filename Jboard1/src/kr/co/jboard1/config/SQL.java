package kr.co.jboard1.config;

public class SQL {

	// ȸ�� ����
	// �Խù� ����
	public final static String SELECT_ARTICLE = "SELECT * FROM `JBOARD_ARTICLE` "
												+ "WHERE `seq`=?";
	
	public final static String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `JBOARD_ARTICLE` AS a "  
												+ "JOIN `JBOARD_MEMBER` AS b "
												+ "ON a.uid = b.uid";
	
	public final static String INSERT_ARTICLE = "INSERT INTO `JBOARD_ARTICLE` SET "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "`uid`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
		   
	
	
}
