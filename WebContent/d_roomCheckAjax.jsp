<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*,com.resort.reservation.*"%>

<%
	request.setCharacterEncoding("utf-8");
	int room = Integer.parseInt(request.getParameter("room"));
    String checkin = request.getParameter("checkin");
	int numOfNights = Integer.parseInt(request.getParameter("numOfNights"));
	reservationDAO bbs = reservationDAO.getInstance();
	
	int dupExists =	bbs.checkDuplicate(room, checkin, numOfNights);
	
	String returnString = "{\"dupExists\": "+dupExists+"}";
	System.out.println("d_roomCheckAjax의 returnString 값 : "+returnString);
	out.println(returnString);
%>  