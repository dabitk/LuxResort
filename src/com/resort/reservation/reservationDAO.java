package com.resort.reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class reservationDAO {
	private static reservationDAO instance; // 한개의 객체만 만들어서 공유: 싱글턴 패턴
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rset = null;

	private reservationDAO() {
	} // private 생성자.

	// resvDAO객체를 리턴하는 메소드. 싱글턴 패턴 적용.
	public static reservationDAO getInstance() {
		if (instance == null) {
			instance = new reservationDAO();
		}
		return instance;
	}

	private void getConnection() { // 커넥션을 얻는 메소드
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection("jdbc:mysql://192.168.23.14:3306/jsptest", "root", "1234");

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void closeConnection() { // 커넥션을 닫는 메소드
		try {
			if (rset != null) {
				rset.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void createTable() {
		getConnection();
		try {
			pstmt = conn.prepareStatement("CREATE TABLE luxresv(\r\n" + "	NAME VARCHAR(20),\r\n"
					+ "	resv_date DATE NOT NULL,\r\n" + "	room INT NOT NULL,\r\n" + "	addr VARCHAR(100),\r\n"
					+ "	telnum VARCHAR(20),\r\n" + "	in_name VARCHAR(20),\r\n" + "	COMMENT TEXT,\r\n"
					+ "	WRITE_date DATE,\r\n" + "	processing INT,\r\n" + "	PRIMARY KEY(resv_date,room))\r\n"
					+ "	DEFAULT CHARSET=UTF8;");
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeConnection();
		return;
	}

	public int dropTable() {
		int isError = 0;

		getConnection();
		try {

			pstmt.execute("DROP TABLE luxresv;");
		} catch (Exception e) {
			e.printStackTrace();
			closeConnection();
			isError = 1;
			return isError;
		}
		closeConnection();
		return isError;
	}

	public List<calendarVO> getBookingInfo() {
		List<calendarVO> resv_arr = new ArrayList<calendarVO>();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");

		getConnection();
		try {
			pstmt = conn.prepareStatement(" SELECT resv_date, \r\n"
					+ "       MAX(CASE WHEN room = 1 THEN NAME END) room1,\r\n"
					+ "       MAX(CASE WHEN room = 2  THEN NAME END) room2,\r\n"
					+ "		 MAX(CASE WHEN room = 3 THEN NAME END) room3\r\n" + "  FROM luxresv WHERE resv_date=?;");

			for (int i = 0; i < 30; i++) {
				String d = dformat.format(cal.getTime());
				System.out.println("순서 : " + i);
				System.out.println("date : " + d);
				pstmt.setString(1, d);
				rset = pstmt.executeQuery();
				while (rset.next()) {
					String r1 = rset.getString(2) == null ? "예약가능" : rset.getString(2);
					String r2 = rset.getString(3) == null ? "예약가능" : rset.getString(3);
					String r3 = rset.getString(4) == null ? "예약가능" : rset.getString(4);
					resv_arr.add(new calendarVO(d, r1, r2, r3));
				}
				cal.add(cal.DATE, +1);
				System.out.println("순서2 : " + i);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resv_arr;
	}

	public int makeReservation(String name, String checkin, int room, String addr, String telnum, String in_name, String comment, String write_date, int processing) {
		int errorcode = 0;
		getConnection();
		try {
			pstmt = conn.prepareStatement("INSERT INTO luxresv (NAME,resv_date,room,addr,telnum,in_name,COMMENT,write_date,processing) VALUES (?,?,?,?,?,?,?,?,?);");
			pstmt.setString(1, name);
			pstmt.setString(2, checkin);
			pstmt.setInt(3, room);
			pstmt.setString(4, addr);
			pstmt.setString(5, telnum);
			pstmt.setString(6, in_name);
			pstmt.setString(7, comment);
			pstmt.setString(8, write_date);
			pstmt.setInt(9, processing);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			errorcode = 1;
			closeConnection();
			return errorcode;
		}
		closeConnection();
		return errorcode;
	}
	
	public reservationVO getReservInfo(String checkin, int room) {

		reservationVO singleResv = null;
		getConnection();
		try {
			pstmt = conn.prepareStatement(" SELECT * FROM luxresv WHERE resv_date = ? AND room = ?;");
			rset = pstmt.executeQuery();
			while (rset.next()) {
				singleResv = new reservationVO();
				singleResv.setName(rset.getString(1));
				singleResv.setResv_data(rset.getDate(2));
				singleResv.setRoom(rset.getInt(3));
				singleResv.setAddr(rset.getString(4));
				singleResv.setTelnum(rset.getString(5));
				singleResv.setIn_name(rset.getString(6));
				singleResv.setComment(rset.getString(7));
				singleResv.setWrite_date(rset.getDate(8));
				singleResv.setProcessing(rset.getInt(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("getReservInfo(c,r) 메소드에서 일어난 에러입니다.");
			singleResv = null;
		}
		closeConnection();
		return singleResv;
	}



	public static void main(String[] args) {
		// 디버그용 CODE STUB.
		// instance.getInstance();
		// Calendar cal = Calendar.getInstance();
		// SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd");

		// for(int i=0;i<30;i++) {
		// System.out.println("date : " + dformat.format(cal.getTime()));
		// cal.add(cal.DATE, +1);
		// System.out.println("date : " + dformat.format(cal.getTime()));
		// }
//		instance.getInstance();
//		instance.getBookingInfo();
	}

}
