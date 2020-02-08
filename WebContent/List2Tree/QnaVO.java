import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class QnaVO {
	private int id;
	private String title;
	private Date date;
	private int viewcnt;
	private String content;
	private int parentId;
	private List<QnaVO> childrenItems;
	private boolean visited;
	
	public QnaVO() {
		this.id = 0;
		this.title = "";
		this.parentId = 0;
		this.childrenItems = new ArrayList<QnaVO>();
		this.visited = false;
	}
	
	public boolean getVisited() {
		return visited;
	}
	public void setVisited(boolean flag) {
		this.visited = flag;
	}
	
	public int getViewcnt() {
		return viewcnt;
	}
	
	public void setViewcnt(int viewcnt){
		this.viewcnt = viewcnt;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public int getParentId() {
		return parentId;
	}
	
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
	public List<QnaVO> getChildrenItems(){
		return childrenItems;
	}
	public void setChildrenItems(List<QnaVO> childrenItems) {
		this.childrenItems = childrenItems;
	}
	public void addChildrenItem(QnaVO childrenItem) {
		if(!this.childrenItems.contains(childrenItem))
			this.childrenItems.add(childrenItem);
	}
	
	@Override
	public String toString() {
		return "QnaVO [id="+id+", title=" + title+", parentId=" + parentId + ", childrenItems="+ childrenItems+"]";
	}
	
}
