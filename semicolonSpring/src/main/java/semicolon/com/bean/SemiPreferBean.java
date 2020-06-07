package semicolon.com.bean;

public class SemiPreferBean {
	private int preno;
	private int pno;
	private int cno;
	private String pfagegroup;
	private String pffilename;
	private int pfprice;
	private int pfbuycount;
	public int getPreno() {
		return preno;
	}
	public void setPreno(int preno) {
		this.preno = preno;
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
	public String getPfagegroup() {
		return pfagegroup;
	}
	public void setPfagegroup(String pfagegroup) {
		this.pfagegroup = pfagegroup;
	}
	public String getPffilename() {
		return pffilename;
	}
	public void setPffilename(String pffilename) {
		this.pffilename = pffilename;
	}
	public int getPfprice() {
		return pfprice;
	}
	public void setPfprice(int pfprice) {
		this.pfprice = pfprice;
	}
	public int getPfbuycount() {
		return pfbuycount;
	}
	public void setPfbuycount(int pfbuycount) {
		this.pfbuycount = pfbuycount;
	}
	@Override
	public String toString() {
		return "SemiPreferBean [preno=" + preno + ", pno=" + pno + ", cno=" + cno + ", pfagegroup=" + pfagegroup
				+ ", pffilename=" + pffilename + ", pfprice=" + pfprice + ", pfbuycount=" + pfbuycount + "]";
	}
	

}
