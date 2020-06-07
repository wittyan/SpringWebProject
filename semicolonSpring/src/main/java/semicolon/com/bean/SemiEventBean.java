package semicolon.com.bean;

public class SemiEventBean {
	private int eno;
	private String id;
	private String etitle;
	private int ehit;
	private String edate;
	private String econtents;
	private String efilename;
	private String eprogress;
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}
	public int getEhit() {
		return ehit;
	}
	public void setEhit(int ehit) {
		this.ehit = ehit;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public String getEcontents() {
		return econtents;
	}
	public void setEcontents(String econtents) {
		this.econtents = econtents;
	}
	public String getEfilename() {
		return efilename;
	}
	public void setEfilename(String efilename) {
		this.efilename = efilename;
	}
	public String getEprogress() {
		return eprogress;
	}
	public void setEprogress(String eprogress) {
		this.eprogress = eprogress;
	}
	@Override
	public String toString() {
		return "SemiEventBean [eno=" + eno + ", id=" + id + ", etitle=" + etitle + ", ehit=" + ehit + ", edate=" + edate
				+ ", econtents=" + econtents + ", efilename=" + efilename + ", eprogress=" + eprogress + "]";
	}
	

}
