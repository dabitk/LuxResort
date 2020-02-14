<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,com.resort.reservation.*"%>

<%
	request.setCharacterEncoding("utf-8"); //request객체를 utf-8로 인코딩
	int room = Integer.parseInt(request.getParameter("room")); // 객실을 뜻하는 room 패러미터를 저장.
    String checkin = request.getParameter("checkin"); //체크인 날짜를 저장.
	int numOfNights = Integer.parseInt(request.getParameter("numOfNights")); //숙박일수를 저장.
	reservationDAO bbs = reservationDAO.getInstance(); //DAO객체를 얻는다.
	
	int dupExists =	bbs.checkDuplicate(room, checkin, numOfNights); //중복이 존재하면 1을 반환, 중복이 존재하지 않으면 0을 반환.
	
	String returnString = "{\"dupExists\": "+dupExists+"}"; //JSON형태로 중복 플래그 값을 저장한다.
	System.out.println("d_roomCheckAjax의 returnString 값 : "+returnString); //디버그용 로그.
	out.println(returnString); //JSON 반환.
%>  