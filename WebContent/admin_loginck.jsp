<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.net.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인 페이지 입니다.</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	//String jump = request.getParameter("jump"); //jump 패러미터를 저장.
	String id = request.getParameter("admId"); //id 패러미터를 저장.
	String pass = request.getParameter("admPasswd");//passwd 패러미터를 저장.
	//여기서 엉뚱한 값을 체크해야하지만 지금은 생략.
	
	boolean bPassChk=false;
	
	//아이디, 패스워드 체크
	if(id.replaceAll(" ","").equals("admin")&&pass.replaceAll(" ","").equals("admin"))
	{
		System.out.println("아이디 비밀번호가 일치합니다.");
		bPassChk=true;
	}else{
		System.out.println("아이디 패스워드가 맞지 않습니다.");
		bPassChk=false;
	}

	//패스워드 체크가 끝나면, 세션을 기록하고 점프한다.
	if(bPassChk){
		session.setAttribute("login_ok","yes");
		//session.setAttribute("login_id",id);
		response.sendRedirect("admin_login.jsp");	//로그인체크 이후 돌아갈 곳
	}else{ //아이디 비밀번호가 틀리면 리다이렉션 전에 alert창을 띄운다.
		System.out.println("아이디 패스워드가 맞지 않습니다.");
 		response.sendRedirect("admin_login_form.jsp"); //아이디 또는 비밀번호가 일치하지 않는 경우 로그인 폼으로 돌려보낸다.
	}
%>


</body>
</html>