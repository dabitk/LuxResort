# LuxResort
A full-stack website development for self-educational purpose. last update 02/20/2020

Home page (Desktop): 
![alt text](https://github.com/dabitk/LuxResort/blob/master/main_page.gif "Main Page")

Home page (Mobile):
![alt text](https://github.com/dabitk/LuxResort/blob/master/mobilePg.JPG "Mobile Page")

Session-authentication(member):

Member Register

![alt text](https://github.com/dabitk/LuxResort/blob/master/session_memberRegister.gif "Session Auth1")
Member Login

![alt text](https://github.com/dabitk/LuxResort/blob/master/session_memberLogin.gif "Session Auth2")

Session-authentication(admin):
![alt text](https://github.com/dabitk/LuxResort/blob/master/session_login.gif "Session Auth3")

Reservation system(new):

![alt text](https://github.com/dabitk/LuxResort/blob/master/Ajax_reservation.gif "Reservation System1")

Reservation system(old):
![alt text](https://github.com/dabitk/LuxResort/blob/master/reservation_system.gif "Reservation System2")

Hierarchical BBS:
![alt text](https://github.com/dabitk/LuxResort/blob/master/hierarchical_bbs.gif "Bbs")


02/16/2020 수정 사항 :
1. datepicker에서 체크아웃 날짜가 체크인 날짜보다 이전 날짜를 선택할 수 없도록 수정.

2. 예약하기 폼 UI 변경 및 기능 수정 <br/>
	2-1. 이름은 한글과 영어만 입력가능. 최소 2글자 이상 6글자 이하만 입력가능.<br/>
	2-2. 체크인 날짜/체크아웃 날짜 설정 가능.<br/>
	2-3. select 박스로 객실1, 객실2, 객실3 선택 및 변경 가능.<br/>

3. 예약현황 페이지와 관리자 예약관리 페이지 기능 통합 (d_01.jsp) <br/>
	3-1. 관리자 로그인시 예약한 객실의 내용을 수정 가능. <br/>
	3-2. 관리자 미 로그인시는 예약자 이름이 *로 가려져서 출력됨.<br/> 

4. 모바일 전용 페이지 개수 증가.</br>

5. Q & A 게시판 원글 삭제 시 댓글도 같이 삭제. <br/>
	5-1. Q & A 게시판 댓글 삭제 시 '삭제된 댓글입니다' 출력. <br/>

6. 공지사항 게시판 댓글 달기 기능 삭제. <br/>

7. 네비게이션 바에서 하위 메뉴가 어느 카테고리에 속하는지 (사용자가) 쉽게 알 수 있도록 수정. <br/>
	7-1. '공지사항 게시판','답글 게시판' -> '공지사항','Q & A' 수정. <br/>

8. 게시글 조회시 CKEditor 안보이게 하였음. 수정페이지에서는 보임. <br/>

