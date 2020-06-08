package semicolon.com.bean;

public class GoodOrBadBean {

	private String id;
	private int no;
	private int good;
	private int bad;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public int getBad() {
		return bad;
	}

	public void setBad(int bad) {
		this.bad = bad;
	}

	@Override
	public String toString() {
		return "GoodOrBadBean [id=" + id + ", no=" + no + ", good=" + good + ", bad=" + bad + "]";
	}
	
	
}
