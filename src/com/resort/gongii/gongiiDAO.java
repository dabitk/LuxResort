package com.resort.gongii;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;





public class gongiiDAO {
	private static gongiiDAO instance;	//한개의 객체만 만들어서 공유: 싱글턴 패턴
	private Connection conn = null;
	private Statement stmt = null;
	private ResultSet rset = null;


	private gongiiDAO() {}	//private 생성자.
	
	//BbsDAO객체를 리턴하는 메소드. 싱글턴 패턴 적용.
	public static gongiiDAO getInstance() {
		if(instance == null) {
			instance = new gongiiDAO();
		}
		return instance;
	}
	
	private void getConnection() {	//커넥션을 얻는 메소드
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		try{
			conn = DriverManager.getConnection("jdbc:mysql://192.168.23.14:3306/jsptest","root","1234");
			stmt = conn.createStatement();
			
		}catch(SQLException e){
			e.printStackTrace();
		}		
	}
	
	private void closeConnection(){	//커넥션을 닫는 메소드
		try{
			if(rset != null){
				rset.close();
			}
			if(stmt != null){
				stmt.close();					
			}
			if(conn != null){
				conn.close();					
			}
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}
	
	public List<gongiiVO> getPage(int start, int cnt){	//시작 글번호와 한페이지에 출력되는 글 갯수를 매개변수로 받아 출력할 데이터를 리스트로 반환함.
		List<gongiiVO> list = new ArrayList<gongiiVO>();
		getConnection();
		try {
			rset = stmt.executeQuery("SELECT * FROM gongii ORDER BY rootid DESC, recnt ASC LIMIT "+start+", "+cnt+";");
			while(rset.next()) {
				gongiiVO article = new gongiiVO();
				article.setId(rset.getInt(1));
				article.setTitle(rset.getString(2));
				article.setDate(rset.getDate(3));
				article.setContent(rset.getString(4));
				article.setRootid(rset.getInt(5));
				article.setRelevel(rset.getInt(6));
				article.setRecnt(rset.getInt(7));
				article.setViewcnt(rset.getInt(8));
				list.add(article);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		closeConnection();
		return list;
	}	
	
	public void increaseViewcnt(int id) {
	//조회수를 올리는 메소드.
		getConnection();
		try {
			stmt.execute("UPDATE gongii SET viewcnt=viewcnt+1 WHERE id="+id+";");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		closeConnection();
	}
	
	public gongiiVO getArticle(int id) { //id를 기준으로 레코드를 탐색해서 반환하는 메소드
		
		gongiiVO b = null;
		getConnection();
		try {
			rset = stmt.executeQuery("SELECT * FROM gongii where id="+id+";");
			while(rset.next()) {
				b = new gongiiVO();
				b.setId(rset.getInt(1));
				b.setTitle(rset.getString(2));
				b.setDate(rset.getDate(3));
				b.setContent(rset.getString(4));
				b.setRootid(rset.getInt(5));
				b.setRelevel(rset.getInt(6));
				b.setRecnt(rset.getInt(7));
				b.setViewcnt(rset.getInt(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getArticle(int) 메소드에서 일어난 에러입니다.");
			b=null;
		}
		closeConnection();		
		return b;
	}
	
	public gongiiVO getArticle() { //매개변수가 없을 경우는 가장 마지막 엔트리를 반환하는 메소드.
		gongiiVO b = null;
		getConnection();
		try {
			rset = stmt.executeQuery("SELECT * FROM gongii ORDER BY id DESC LIMIT 1;");
			while(rset.next()) {
				b = new gongiiVO();
				b.setId(rset.getInt(1));
				b.setTitle(rset.getString(2));
				b.setDate(rset.getDate(3));
				b.setContent(rset.getString(4));
				b.setRootid(rset.getInt(5));
				b.setRelevel(rset.getInt(6));
				b.setRecnt(rset.getInt(7));
				b.setViewcnt(rset.getInt(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getArticle 메소드에서 일어난 에러입니다.");
			b=null;
		}
		closeConnection();
		return b;		
	}
	
	public int insertArticle(String title, String content, int rootid, int relevel, int recnt) {
		int errorcode = 0;
		getConnection();
		try {

			stmt.execute("INSERT INTO gongii(title,date,content,rootid,relevel,recnt) VALUES('"+title+"',CURDATE(),'"+content+"',"+rootid+","+relevel+","+recnt+");");
			
		} catch (SQLException e) {
			e.printStackTrace();
			errorcode = e.getErrorCode();
			return errorcode;
		}
		closeConnection();
		return errorcode;
	}
	
	public int updateArticle(int id, String title, String content) {
		int errorcode = 0;
		getConnection();
		try {
			stmt.execute("UPDATE gongii SET title='"+title+"', content='"+content+"' WHERE id="+id+";");
		} catch (SQLException e) {
			e.printStackTrace();
			errorcode = e.getErrorCode();
			return errorcode;
		}
		closeConnection();
		return errorcode;		
	}	
	public void updateWonGul(int id) { //rootid를 id와 동일하게 업데이트 하는 메소드. 원글 삽입 후에 쓴다.
		getConnection();
		try {
			stmt.execute("UPDATE gongii SET rootid="+id+" WHERE id = "+id+";");
		}catch(SQLException e) {
			e.printStackTrace();
		}
		closeConnection();
	}	

	public int deleteArticle(int id) {
		int errorcode=0;
		getConnection();
		try {
			stmt.execute("DELETE FROM gongii WHERE id="+id+";");
		} catch (SQLException e) {
			e.printStackTrace();
			errorcode = e.getErrorCode();
			return errorcode;
		}
		closeConnection();
		return errorcode;
	}	
	
	public static void main(String[] args) {
		//DEBUGGING CODE STUB
	}
}