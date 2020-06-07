package semicolon.com.bean;

public class SemiProductBean {
	int pno;
	int cno;
	String pname;
	int pPrice;
	String ptype;
	String pfilename;
	int pstock;
	
	public int getPstock() {
		return pstock;
	}
	public void setPstock(int pstock) {
		this.pstock = pstock;
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
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getPfilename() {
		return pfilename;
	}
	public void setPfilename(String pfilename) {
		this.pfilename = pfilename;
	}
	@Override
	public String toString() {
		return "SemiProductBean [pno=" + pno + ", cno=" + cno + ", pname=" + pname + ", pPrice=" + pPrice + ", ptype="
				+ ptype + ", pfilename=" + pfilename + "]";
	}
	
	
}
