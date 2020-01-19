package com.resort.qna;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class QnaDAO {
	private static QnaDAO instance; // 한개의 객체만 만들어서 공유: 싱글턴 패턴
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rset = null;
	
	private QnaDAO() {}	//private 생성자.
	
	//BbsDAO객체를 리턴하는 메소드. 싱글턴 패턴 적용.
	public static QnaDAO getInstance() {
		if(instance == null) {
			instance = new QnaDAO();
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
		}catch(SQLException e){
			e.printStackTrace();
		}		
	}
	
	private void closeConnection(){	//커넥션을 닫는 메소드
		try{
			if(rset != null){
				rset.close();
			}
			if(pstmt != null){
				pstmt.close();					
			}
			if(conn != null){
				conn.close();					
			}
		}catch(SQLException e){
			e.printStackTrace();
		}	
	}
	
	public List<QnaVO> getPage(int start, int cnt){	//시작 글번호와 한페이지에 출력되는 글 갯수를 매개변수로 받아 출력할 데이터를 리스트로 반환함.
		List<QnaVO> list = new ArrayList<QnaVO>();
		getConnection();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM Qna ORDER BY rootid DESC, recnt ASC LIMIT ?, ?;");
			pstmt.setInt(1, start);
			pstmt.setInt(2, cnt);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				QnaVO article = new QnaVO();
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
			e.printStackTrace();
		}
		closeConnection();
		return list;
	}	
	
	public void increaseViewcnt(int id) {
	//조회수를 올리는 메소드.
		getConnection();
		try {
			pstmt = conn.prepareStatement("UPDATE Qna SET viewcnt=viewcnt+1 WHERE id=?;");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		closeConnection();
	}
	
	public QnaVO getArticle(int id) { //id를 기준으로 레코드를 탐색해서 반환하는 메소드
		
		QnaVO b = null;
		getConnection();
		try {
			pstmt=conn.prepareStatement("SELECT * FROM Qna where id=?;");
			pstmt.setInt(1, id);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				b = new QnaVO();
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
	
	public QnaVO getArticle() { //매개변수가 없을 경우는 가장 마지막 엔트리를 반환하는 메소드.
		QnaVO b = null;
		getConnection();
		try {
			pstmt=conn.prepareStatement("SELECT * FROM Qna ORDER BY id DESC LIMIT 1");
			rset = pstmt.executeQuery();
			while(rset.next()) {
				b = new QnaVO();
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
			pstmt = conn.prepareStatement("INSERT INTO Qna(title,date,content,rootid,relevel,recnt) VALUES(?,CURDATE(),?,?,?,?);");
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, rootid);
			pstmt.setInt(4, relevel);
			pstmt.setInt(5, recnt);
			pstmt.executeUpdate();
			
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
			pstmt=conn.prepareStatement("UPDATE Qna SET title=?,content=? WHERE id=?;");
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			errorcode = e.getErrorCode();
			closeConnection();
			return errorcode;
		}
		closeConnection();
		return errorcode;		
	}	
	public void updateWonGul(int id) {
		//rootid를 id와 동일하게 업데이트 하는 메소드. 원글 삽입 후에 쓴다.
		//댓글 삽입시에는 쓰이지 않는다.
		getConnection();
		try {
			pstmt = conn.prepareStatement("UPDATE Qna SET rootid=? WHERE id=?;");
			pstmt.setInt(1,id);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("updateWonGul에서 발생한 에러");
		}
		closeConnection();
	}	

	public void prepareDatGul(int rootid, int recnt) {
		//댓글 삽입 전에 게시글들의 recnt값을 조절하는 메소드.
		//신규 글 삽입 시에는 호출되지 않는다.
		getConnection();
		try {
			pstmt = conn.prepareStatement("UPDATE Qna SET recnt = recnt+1 WHERE rootid = ? AND recnt >= ?+1;");
			//동일한 rootid 그룹내의 부모의 recnt+1과 같거나 더 큰 글들의 recnt에 전부 1씩 더한다.
			pstmt.setInt(1, rootid);
			pstmt.setInt(2, recnt);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("prepareDatGul에서 발생한 에러");
		}
		closeConnection();
	}	
	
	public int deleteArticle(int id) {
		int errorcode=0;
		getConnection();
		try {
			pstmt=conn.prepareStatement("DELETE FROM Qna WHERE id=?");
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
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
