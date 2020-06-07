package semicolon.com.bean;

public class SemiCompanyBean {
	int cno;
	String cname;
	String ctel;
	String cadd;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getCadd() {
		return cadd;
	}
	public void setCadd(String cadd) {
		this.cadd = cadd;
	}
	@Override
	public String toString() {
		return "SemiCompanyBean [cno=" + cno + ", cname=" + cname + ", ctel=" + ctel + ", cadd=" + cadd + "]";
	}
	
	
}
