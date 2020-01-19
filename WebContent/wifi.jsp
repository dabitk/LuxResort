<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<STYLE>
	TABLE, th, td{
		border: 1px solid black;
	}
	
	.wrapper{
		text-align: center;
		padding-top: 25px;
	}
	
	a{
		font-size: 22px;
		font-weight: bold;
		background-color: Transparent;
		backgroun-repeat: no-repeat;
		border: none;
		cursor: pointer;
		overflow: hideen;
		outline: none;
	}
	
	h1{
		padding-left:70px;
	}
</STYLE>
</head>
<body>
<h1>와이파이</h1>
<%! //멤버 변수 선언 및 함수 선언 부분
	private int fromPT = 0;
	private int cntPT = 0;
	private int curPg = 0; // (((fromPT)/100)*10) 식으로 현재 페이지를 저장하는 변수
	private int lastLine = getLastElement();	//최대 데이터 갯수를 저장하는 함수
	
	public int prevBtn(){	// << 버튼을 눌렀을 때의 로직 구현부
		curPg = (((fromPT)/100)*10);
		if(curPg == 0){
			return 0;
		}else{
			return (((((fromPT-100)/10)*10)/100)*100);
		}
	}
	
	public int nextBtn(){	
		curPg = (((fromPT)/100)*10);
		if((curPg*10)>=(lastLine/100)*100){
			return((lastLine-10));
		}else{
			return (((((fromPT+100)/10)*10)/100)*100);
		}
	}
	
	public int getLastElement(){
		File f = new File("*/var/lib/tomcat8/webapps/ROOT/Ch04/전국무료와이파이표준데이터.txt"); //엑셀로 csv파일을 열고 -> 파일 -> 내보내기
		//파일 형식 변경 -> 텍스트파일(탭으로 분리)
		
		BufferedReader br = null; //BufferedReader 참조변수를 null로 초기화해둔다. 안하면 try 블럭 안에서 컴파일에러가 발생한다.
		try{
			br = new BufferedReader(new FileReader(f)); //FileReader를 BufferedReader로 감싸서 br이 이 객체를 가리키도록 초기화한다.
		}catch(FileNotFoundException e){ //지정한 경로에서 파일을 발견하지 못했을 경우의 예외처리
			e.printStackTrace();
		}
		
		String readtxt = null; //한줄씩 읽어 들여서 저장할 문장열 형의 변수
		
		//한 줄을 먼저 읽어야 필드명을 알 수 있다.
		try{
			if((readtxt=br.readLine())==null){//파일 안에 읽을 라인이 존재하지 않는 경우
				return 0; //프로그램을 종료한다.
			}
		}catch(IOException e){ //파일의 내용을 조회하는 과정에서 문제가 생겼을 경우의 예외 처리
			e.printStackTrace();
		}
		String[] field_name=readtxt.split("\t");	//탭을 기준으로 분리해준다.
	
		int LineCnt=0;
		try{
			while((readtxt = br.readLine()) != null){
				String[] field = readtxt.split("\t");
				LineCnt++; //전체 데이터 개수를 알기위한 변수.
			}
		}catch(NumberFormatException e){ //printf함수 사용시에 지정한 포멧과 출력할 변수의 형식이 다를때의 예외처리
			e.printStackTrace();
		}catch(IOException e){ //파일의 줄을 읽어 오는 과정에서 생길 수 있는 예외에 대한 처리
			e.printStackTrace();
		}
		try{
			br.close();	//bufferedReader 객체를 닫아준다.
		}catch(IOException e){
			e.printStackTrace();
		}
		
		//LineCnt를 반환한다.
		return LineCnt;
	}
%>

<%
	if(request.getParameter("from") != null && request.getParameter("cnt")!=null){
		fromPT = Integer.parseInt(request.getParameter("from"));
		cntPT = Integer.parseInt(request.getParameter("cnt"));
	}else{
		fromPT = 0;
		cntPT = 10;
	}

	File f = new File("/var/lib/tomcat8/webapps/ROOT/Ch04/전국무료와이파이표준데이터.txt"); //엑셀로 csv파일을 열고 -> 파일 -> 내보내기
	//파일 형식 변경 -> 텍스트 파일(탭으로 분리)
	
	BufferedReader br = null; //BufferedReader 참조변수를 null로 초기화해둔다.
	try{
		br = new BufferedReader(new FileReader(f)); //FileReader을 BufferedReader로 감싸서 br이 이 객체를 가리키도록 초기화한다.		
	}catch(FileNotFoundException e){ //지정한 경로에서 파일을 발견하지 못했을 경우의 예외처리
		e.printStackTrace();
	}
	
	String readtxt = null; //한줄씩 읽어 들여서 저장할 문자열 형의 변수
	
	//한 줄을 먼저 읽어야 필드명을 알 수 있음.
	try{
		if((readtxt=br.readLine())==null){ //파일 안에 읽을 라인이 존재하지 않는 경우
			out.println("빈 파일입니다");
			return; //프로그램을 종료한다.
		}
	}catch(IOException e){	//파일의 내용을 조회하는 과정에서 문제가 생겼을 경우의 예외 처리
		e.printStackTrace();
	}
	String[] field_name = readtxt.split("\t");	//탭을 기준으로 분리해준다.
	
	//융합기술교육원 위도 경도
	double lat = 37.3860821;
	double lng = 127.1214038;
	
	int LineCnt = 0;
	try{
		out.println("<div><TABLE width=800px align=center><TR><TD width=100px>번호</TD><TD width=400px>주소</TD><TD width=100px>위도</TD><TD width=100px>경도</TD><TD width=100px>거리</TD></TR>");
		//System.out.println을 하면 콘솔 로그에 출력된다. 브라우저 화면 상에 출력하기 위해서는 out.println을 사용한다.
		while((readtxt=br.readLine())!=null){
			if(LineCnt++<fromPT) continue;
			if(LineCnt>fromPT+cntPT)break;
			
			String[] field = readtxt.split("\t");
			
			double dist = (Math.sqrt(Math.pow(Double.parseDouble(field[12])-lat,2)
					+ Math.pow(Double.parseDouble(field[13])-lng,2))); //sqrt((x2-x1)^2 + (y2-y1)^2) 거리 공식.
			dist = Math.round(dist*100.0)/100.0;
					
			out.println("<TR><TD>"+LineCnt+"</TD><TD>"+field[9]+"</TD><TD>"+field[12]+"</TD><TD>"
					+field[13]+"</TD><TD>"+String.valueOf(dist)+"</TD></TR>");
			
		}
		out.println("</TABLE></div>");
		
		out.println("<div class='wrapper'>");
		out.println("<a href=</a>");
		curPg = (((fromPT)/100)*10);
		int i = 0;
		
		//100의 자리로 내림한 위치
		out.println("<a href=http://192.168.56.1:8080/Ch04/wifi.jsp?from="+prevBtn()+"&cnt=10'><<</a>");
		
		for(i=curPg;i<(curPg+10);i++){
			if((i*10)>((lastLine-10)))break;
			out.println("<a href='http://192.168.56.1:8080/Ch04/wifi.jsp?from="+i*10+"&cnt=10'>"+i+"</a>");
		}
		//100의 자리로 올림한 위치
		out.println("<a href=http://192.168.56.1:8080/Ch04/wifi.jsp?from="+nextBtn()+"&cnt=10'>>></a>");
	}catch(NumberFormatException e){ //printf 함수 사용시에 지정한 포맷과 출력할 변수의 형식이 다를때의 예외처리
		e.printStackTrace();
	}catch(IOException e){//파일의 줄을 읽어 오는 과정에서 생길 수 있는 예외에 대한 처리
		e.printStackTrace();
	}
	
	try{
		br.close();	//bufferedReader 객체를 닫아준다.
	}catch(IOException e){
		e.printStackTrace();
	}
%>
	<br/>19/12/09 김정후 <br/>
</body>
</html>