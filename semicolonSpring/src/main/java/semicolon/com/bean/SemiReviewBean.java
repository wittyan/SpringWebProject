package semicolon.com.bean;

public class SemiReviewBean {
	private int rvno;
	private int pno;
	private int cno;
	private String id;
	private String rvcontents;
	private String rvfilename;
	private String rvdate;
	private String rvgrade;
	public int getRvno() {
		return rvno;
	}
	public void setRvno(int rvno) {
		this.rvno = rvno;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRvcontents() {
		return rvcontents;
	}
	public void setRvcontents(String rvcontents) {
		this.rvcontents = rvcontents;
	}
	public String getRvfilename() {
		return rvfilename;
	}
	public void setRvfilename(String rvfilename) {
		this.rvfilename = rvfilename;
	}
	public String getRvdate() {
		return rvdate;
	}
	public void setRvdate(String rvdate) {
		this.rvdate = rvdate;
	}
	public String getRvgrade() {
		return rvgrade;
	}
	public void setRvgrade(String rvgrade) {
		this.rvgrade = rvgrade;
	}
	@Override
	public String toString() {
		return "SemiReviewBean [rvno=" + rvno + ", pno=" + pno + ", cno=" + cno + ", id=" + id + ", rvcontents="
				+ rvcontents + ", rvfilename=" + rvfilename + ", rvdate=" + rvdate + ", rvgrade=" + rvgrade + "]";
	}

	
	

}
