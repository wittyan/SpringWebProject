package semicolon.com.bean;

public class SemiQnaBean {
 private int qno;
 private String id;	
 private int pno;
 private int cno;
 private String qtitle;
 private int qhit;
 private String qdate;
 private String qfilename;
 private String qcontents;
 private String qstate;
 private int ref;
 private int pnum;
 private int lev;
 private int step;
 private int reply;
public int getQno() {
	return qno;
}
public void setQno(int qno) {
	this.qno = qno;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
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
public String getQtitle() {
	return qtitle;
}
public void setQtitle(String qtitle) {
	this.qtitle = qtitle;
}
public int getQhit() {
	return qhit;
}
public void setQhit(int qhit) {
	this.qhit = qhit;
}
public String getQdate() {
	return qdate;
}
public void setQdate(String qdate) {
	this.qdate = qdate;
}
public String getQfilename() {
	return qfilename;
}
public void setQfilename(String qfilename) {
	this.qfilename = qfilename;
}
public String getQcontents() {
	return qcontents;
}
public void setQcontents(String qcontents) {
	this.qcontents = qcontents;
}
public String getQstate() {
	return qstate;
}
public void setQstate(String qstate) {
	this.qstate = qstate;
}
public int getRef() {
	return ref;
}
public void setRef(int ref) {
	this.ref = ref;
}
public int getPnum() {
	return pnum;
}
public void setPnum(int pnum) {
	this.pnum = pnum;
}
public int getLev() {
	return lev;
}
public void setLev(int lev) {
	this.lev = lev;
}
public int getStep() {
	return step;
}
public void setStep(int step) {
	this.step = step;
}
public int getReply() {
	return reply;
}
public void setReply(int reply) {
	this.reply = reply;
}
@Override
public String toString() {
	return "SemiQnaBean [qno=" + qno + ", id=" + id + ", pno=" + pno + ", cno=" + cno + ", qtitle=" + qtitle + ", qhit="
			+ qhit + ", qdate=" + qdate + ", qfilename=" + qfilename + ", qcontents=" + qcontents + ", qstate=" + qstate
			+ ", ref=" + ref + ", pnum=" + pnum + ", lev=" + lev + ", step=" + step + ", reply=" + reply + "]";
}
 

}
