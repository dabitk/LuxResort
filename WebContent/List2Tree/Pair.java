public class Pair {
	private int childId;
	private int parentId;
	
	public Pair(int childId, int parentId) {
		this.childId = childId; //즉, 자기자신의 id를 뜻함.
		this.parentId = parentId;
	}
	
	public int getChildId() {
		return childId;
	}
	
	public void setChildId(int childId) {
		this.childId = childId;
	}
	
	public int getParentId() {
		return parentId;
	}
	
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
}
