package semicolon.com.bean;

public class SemiReserveBean {
    private	int rno;
	private String id;
	private int cno;
	private int pno;
	private int rcount;
	private String rdate;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	@Override
	public String toString() {
		return "SemiReserveBean [rno=" + rno + ", id=" + id + ", cno=" + cno + ", pno=" + pno + ", rcount=" + rcount
				+ ", rdate=" + rdate + "]";
	}
	
	
}
