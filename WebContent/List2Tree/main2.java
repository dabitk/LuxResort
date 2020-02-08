import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;





public class main2 {
	
	private static main2 instance; // 한개의 객체만 만들어서 공유: 싱글턴 패턴
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rset = null;
	
	private main2() {}	//private 생성자.
	
	//BbsDAO객체를 리턴하는 메소드. 싱글턴 패턴 적용.
	public static main2 getInstance() {
		if(instance == null) {
			instance = new main2();
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
		
	public List<QnaVO> getTree(){
		
	getConnection();
		
	//입력값
	ArrayList<Pair> pairs = new ArrayList<Pair>();
	//DB로부터 자식, 부모 값을 가져와서 Pair 객체를 생성함.
//	pairs.add(new Pair("H","G"));
//	pairs.add(new Pair("F","G"));
//	pairs.add(new Pair("G","D"));
//	pairs.add(new Pair("J","D"));
//	pairs.add(new Pair("K","D"));
	try {
		pstmt = conn.prepareStatement("SELECT * FROM Qna ORDER BY id;");
		//pstmt.setInt(1, start);
		//pstmt.setInt(2, cnt);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			QnaVO article = new QnaVO();
			article.setId(rset.getInt(1));
			article.setTitle(rset.getString(2));
			article.setDate(rset.getDate(3));
			article.setContent(rset.getString(4));
			article.setViewcnt(rset.getInt(5));
			article.setParentId(rset.getInt(6));
			pairs.add(new Pair(article.getId(),article.getParentId()));
			//System.out.println(pairs);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
	//Arrange
	//String corresponds to the Id
	Map<Integer, QnaVO> hm = new HashMap<>();
	
	//MegaMenuDTO는 이전과 다음 링크를 가진 LinkedList로 사용된다.
	
	//Map을 채운다
	int temp = 100;
	//for(Pair p: pairs) {
	for(int i=0;i<pairs.size();i++) {
		//자식 노드
		Pair p = pairs.get(i);
		QnaVO mmdChild;
		if(hm.containsKey(p.getChildId())) { //맵에 이미 같은 id를 키로 가지는 QnaVO값이 있는 경우 (중복) mmdChild에 맵의 값을 할당
			mmdChild=hm.get(p.getChildId());
		}else { //맵에 중복되는 Qna값이 없다면 그 id값과 매칭되는 새로운 노드를 맵에 추가함
			mmdChild = new QnaVO();
			hm.put(p.getChildId(),mmdChild);
		}
		mmdChild.setId(p.getChildId()); //세터-자식. Pair 클래스로부터 자신의 ID값을 가져와서 저장.
		mmdChild.setParentId(p.getParentId()); //세터-자식. Pair 클래스로부터 부모의 ID값을 가져와서 저장.
		// 생성자에서 비어있는 리스트가 만들어지므로 별로의 자식노드 리스트를 생성할 필요는 없다.
		
		//부모노드
		QnaVO mmdParent;
		if(hm.containsKey(p.getParentId())) { //맵에 이미 있으면 그걸 사용.
			mmdParent = hm.get(p.getParentId());
		}else { //맵에 없으면 추가
			mmdParent = new QnaVO();
			hm.put(p.getParentId(),mmdParent);
		}
		mmdParent.setId(p.getParentId()); //세터-부모
		mmdParent.setParentId(temp);//세터-부모. 부모의 부모값.
		mmdParent.addChildrenItem(mmdChild);
		temp = mmdParent.getId();
	}
	
	//root를 얻는다
	List<QnaVO> DX = new ArrayList<QnaVO>();
	for(QnaVO mmd : hm.values()) {
		if(mmd.getParentId()==100) { //루트노트를 리스트에 추가
			DX.add(mmd);
			break;
		}
	}
	
	//Print
//	for(QnaVO mmd: DX) {
//		System.out.println("트리 사이즈는 " + DX.size()+" 이며 내용은 : " + mmd);
//	}
	
	DFS(DX.get(0));
	
	
	closeConnection();
	
	return DX;
	}
	
	public void DFS(QnaVO node) {
		node.setVisited(true); //중복이긴 한데...
		System.out.println("Id: "+node.getId()+" P_Id: "+node.getParentId());
		for(int i=0;i<node.getChildrenItems().size();i++) {
			QnaVO node2 = node.getChildrenItems().get(i); //자식노드를 순서대로 방문함.
			if(!node2.getVisited()) { //방문하지 않았다면 그 노드를 방문한다.
				//node2.setVisited(true);
				DFS(node2);
			}
		}
	}
	
	public static void main(String[] args) {
		instance = main2.getInstance();
		instance.getTree();
	}
	
}
