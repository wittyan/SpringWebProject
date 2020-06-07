package semicolon.com.bean;

public class SemiList1 {
	private String id;
	private String cname;
	private String pname;
	private int rcount;
	private int pprice;
	private String rdate;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "SemiList1 [id=" + id + ", cname=" + cname + ", pname=" + pname + ", rcount=" + rcount + ", pprice="
				+ pprice + ", rdate=" + rdate + "]";
	}
	public SemiList1(String id, String cname, String pname, int rcount, int pprice, String rdate) {
		super();
		this.id = id;
		this.cname = cname;
		this.pname = pname;
		this.rcount = rcount;
		this.pprice = pprice;
		this.rdate = rdate;
	}
	public SemiList1() {
		super();
	}
	
	


}
