package kr.famstory2.config;

public class SQL {

	// 회원 관련
	public final static String SELECT_TERMS = "SELECT * FROM `JBOARD_TERMS`";
	public final static String SELECT_CHECK_UID  = "SELECT COUNT(`uid`) FROM `JBOARD_MEMBER` WHERE `uid`=?";
	public final static String SELECT_CHECK_NICK = "SELECT COUNT(`nick`) FROM `JBOARD_MEMBER` WHERE `nick`=?";
	public final static String INSERT_MEMBER = "INSERT INTO `JBOARD_MEMBER` SET "
												+ "`uid`=?, "
												+ "`pass`=PASSWORD(?), "
												+ "`name`=?, "
												+ "`nick`=?, "
												+ "`email`=?, "
												+ "`hp`=?, "
												+ "`zip`=?, "
												+ "`addr1`=?, "
												+ "`addr2`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
	
	public final static String SELECT_MEMBER  = "SELECT * FROM `JBOARD_MEMBER` "
												+ "WHERE `uid`=? AND `pass`=PASSWORD(?)";
	
	// 게시물 관련
	public final static String SELECT_LATEST_ARTICLE = "(SELECT `seq`, `title`, `rdate` FROM `JBOARD_ARTICLE` WHERE `cate`='grow' AND `parent`=0 ORDER BY `seq` DESC LIMIT 5) "
													 + "UNION "
													 + "(SELECT `seq`, `title`, `rdate` FROM `JBOARD_ARTICLE` WHERE `cate`='school' AND `parent`=0 ORDER BY `seq` DESC LIMIT 5) "
													 + "UNION "
													 + "(SELECT `seq`, `title`, `rdate` FROM `JBOARD_ARTICLE` WHERE `cate`='croptalk' AND `parent`=0 ORDER BY `seq` DESC LIMIT 5)";
	
	public final static String SELECT_TOTAL_COUNT = "SELECT COUNT(`seq`) FROM `JBOARD_ARTICLE` WHERE `parent`=0 AND `cate`=?";
	
	public final static String UPDATE_ARTICLE = "UPDATE `JBOARD_ARTICLE` SET `title`=?, `content`=? "
												+ "WHERE `seq`=?";
	
	public final static String DELETE_ARTICLE = "DELETE FROM `JBOARD_ARTICLE` WHERE `seq`=? OR `parent`=?";
	public final static String DELETE_COMMENT = "DELETE FROM `JBOARD_ARTICLE` WHERE `seq`=?";
	public final static String UPDATE_HIT     = "UPDATE `JBOARD_ARTICLE` SET `hit`=`hit`+1 WHERE `seq`=?";
	
	public final static String SELECT_ARTICLE = "SELECT * FROM `JBOARD_ARTICLE` AS a "
												+ "LEFT JOIN `JBOARD_FILE` AS b "
												+ "ON a.seq = b.parent "
												+ "WHERE a.`seq`=?";
	
	public final static String SELECT_ARTICLES = "SELECT a.*, b.nick FROM `JBOARD_ARTICLE` AS a "  
												+ "JOIN `JBOARD_MEMBER` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=0 AND `cate`=? "
												+ "ORDER BY `seq` DESC "
												+ "LIMIT ?, 10";
	
	public final static String SELECT_ARTICLE_MAX_SEQ = "SELECT MAX(`seq`) FROM `JBOARD_ARTICLE`";
	
	public final static String INSERT_ARTICLE = "INSERT INTO `JBOARD_ARTICLE` SET "
												+ "`cate`=?, "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "`file`=?, "
												+ "`uid`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
	
	public final static String INSERT_FILE = "INSERT INTO `JBOARD_FILE` SET "
											+ "`parent`=?, "
											+ "`oldName`=?, "
											+ "`newName`=?, "
											+ "`rdate`=NOW()";
	
	public final static String UPDATE_FILE_DOWN_COUNT = "UPDATE `JBOARD_FILE` SET `download`=`download`+1 WHERE `seq`=?";    
	
	
	public final static String SELECT_COMMENTS = "SELECT a.*, b.nick FROM `JBOARD_ARTICLE` AS a "
												+ "JOIN `JBOARD_MEMBER` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=? "
												+ "ORDER BY `seq` ASC";
	
	public final static String INSERT_COMMENT = "INSERT INTO `JBOARD_ARTICLE` SET "
												+ "`parent`=?, "
												+ "`cate`=?, "
												+ "`content`=?, "
												+ "`uid`=?, "
												+ "`regip`=?, "
												+ "`rdate`=NOW()";
	
	public final static String UPDATE_COMMENT_COUNT = "UPDATE `JBOARD_ARTICLE` SET `comment` = `comment` + 1 " 
													+ "WHERE `seq`=?";
	
}











