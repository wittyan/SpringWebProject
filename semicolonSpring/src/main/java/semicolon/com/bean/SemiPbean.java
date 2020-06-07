package semicolon.com.bean;

public class SemiPbean {
	private String id;
	private int cnt;
	private int sum;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getSum() {
		return sum;
	}
	public void setSum(int sum) {
		this.sum = sum;
	}
	public SemiPbean(String id, int cnt, int sum) {
		super();
		this.id = id;
		this.cnt = cnt;
		this.sum = sum;
	}
	public SemiPbean() {
		super();
	}
	@Override
	public String toString() {
		return "SemiPbean [id=" + id + ", cnt=" + cnt + ", sum=" + sum + "]";
	}
	
	


}
