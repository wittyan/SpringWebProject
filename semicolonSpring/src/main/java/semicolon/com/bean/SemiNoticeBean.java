package semicolon.com.bean;

public class SemiNoticeBean {
	private int nno;
	private String id;
	private String ntitle;
	private int nhit;
	private String ndate;
	private String ncontents;
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public int getNhit() {
		return nhit;
	}
	public void setNhit(int nhit) {
		this.nhit = nhit;
	}
	public String getNdate() {
		return ndate;
	}
	public void setNdate(String ndate) {
		this.ndate = ndate;
	}
	public String getNcontents() {
		return ncontents;
	}
	public void setNcontents(String ncontents) {
		this.ncontents = ncontents;
	}
	@Override
	public String toString() {
		return "SemiNoticeBean [nno=" + nno + ", id=" + id + ", ntitle=" + ntitle + ", nhit=" + nhit + ", ndate="
				+ ndate + ", ncontents=" + ncontents + "]";
	}
	

}
