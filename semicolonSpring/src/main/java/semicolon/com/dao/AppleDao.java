package semicolon.com.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import semicolon.com.bean.SemiCompanyBean;
import semicolon.com.bean.SemiEventBean;
import semicolon.com.bean.SemiMemberBean;
import semicolon.com.bean.SemiNoticeBean;
import semicolon.com.bean.SemiProductBean;
import semicolon.com.bean.SemiQnaBean;


@Component("appleDao")
public class AppleDao extends SqlSessionDaoSupport {

	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}

	public SemiProductBean anSelectProductFromPno(Integer pno) {
		
		return this.getSqlSession().selectOne("anSelectProductFromPno", pno);
		
	}
	public SemiMemberBean anSelectMemberInfo(String str) {
		
		return this.getSqlSession().selectOne("anSelectMemberInfo", str);

	}
	public SemiCompanyBean anSelectCompany(Integer pno) {
		
		return this.getSqlSession().selectOne("anSelectCompany", pno);
		
	}
	public List<SemiProductBean> selectPreferProductFromAge(String str) {
		
		return this.getSqlSession().selectList("selectPreferProductFromAge", str);
		
	}

	public String selectAgeGroup(String id) {

		return this.getSqlSession().selectOne("selectAgeGroup", id);

	}

	public void updateQstate(Integer qno) {

		this.getSqlSession().update("updateQstate", qno);
		

	}

	public void updateEprogress(Integer eno) {

		this.getSqlSession().update("updateEprogress", eno);
//		

	}

	public Integer getProductTotalRow() {

		return this.getSqlSession().selectOne("getProductTotalRow");

	}

	public void deleteReview(Integer num) {

		this.getSqlSession().delete("deleteReview", num);
//		

	}

	public void updateReview(HashMap<String, Object> map) {

		this.getSqlSession().update("updateReview", map);

//		

	}

	public Integer getReviewTotalRow() {

		return this.getSqlSession().selectOne("getReviewTotalRow");

	}

	public Object ReviewInfo(int no) {

		return this.getSqlSession().selectOne("ReviewInfo", no);

	}

	public boolean companyIdCheck(String cname) {

		String rsId = null;

		rsId = this.getSqlSession().selectOne("companyIdCheck", cname);

		return rsId == null || rsId.equals("") ? false : true;

	}

	public List<SemiCompanyBean> selectCompany() {

		return this.getSqlSession().selectList("selectCompany");

	}

	public List<SemiEventBean> selectEvent(HashMap<String, Object> map) {

		return this.getSqlSession().selectList("selectEvent", map);

	}

	public List<SemiNoticeBean> selectNotice(HashMap<String, Object> map) {

		return this.getSqlSession().selectList("selectNotice", map);

	}

	public List<SemiQnaBean> selectQna(HashMap<String, Object> map) {

		return this.getSqlSession().selectList("selectQna", map);

	}

	public void insertQna(SemiQnaBean sq) {

		this.getSqlSession().insert("insertQna", sq);
//		

	}

	public void insertNotice(SemiNoticeBean sn) {

		this.getSqlSession().insert("insertNotice", sn);
//		

	}

	public void insertEvent(SemiEventBean se) {

		this.getSqlSession().insert("insertEvent", se);
//		

	}

	public void insertCompany(SemiCompanyBean sc) {

		this.getSqlSession().insert("insertCompany", sc);
//		

	}

	public void insertProduct(SemiProductBean sc) {

		this.getSqlSession().insert("insertProduct", sc);
		

	}

	public void deleteQna(Integer num) {

		this.getSqlSession().delete("deleteQna", num);
		

	}

	public void deleteNotice(Integer num) {

		this.getSqlSession().delete("deleteNotice", num);
		

	}

	public void deleteEvent(Integer num) {
		this.getSqlSession().delete("deleteEvent", num);
		

	}

	public void updateQna(SemiQnaBean sqb) {

		this.getSqlSession().update("updateQna", sqb);
		

	}

	public void updateNotice(SemiNoticeBean snb) {
		this.getSqlSession().update("updateNotice", snb);

		

	}

	public void updateEvent(SemiEventBean seb) {
		this.getSqlSession().update("updateEvent", seb);

		

	}

	public void updateStep(HashMap<String, Object> map) {
		this.getSqlSession().update("updateStep", map);

		

	}

	public void updateReply(HashMap<String, Object> map) {
		this.getSqlSession().update("updateReply", map);

		

	}

	public Integer getQnaSequence() {
		return this.getSqlSession().selectOne("getQnaSequence");

	}

	public Integer getNoticeSequence() {
		return this.getSqlSession().selectOne("getNoticeSequence");

	}

	public Integer getEventSequence() {
		return this.getSqlSession().selectOne("getEventSequence");

	}

	public Integer getReviewSequence() {
		return this.getSqlSession().selectOne("getReviewSequence");

	}

	public Integer getCompanySequence() {
		return this.getSqlSession().selectOne("getCompanySequence");

	}

	public Integer getReserveSequence() {
		return this.getSqlSession().selectOne("getReserveSequence");

	}

	public Integer getPreferSequence() {
		return this.getSqlSession().selectOne("getPreferSequence");

	}

	public Integer getProductSequence() {
		return this.getSqlSession().selectOne("getProductSequence");

	}

	public String getCnameFromPno(Integer pno) {
		return this.getSqlSession().selectOne("getCnameFromPno", pno);

	}

	public Integer getCnoFromPno(Integer pno) {
		return this.getSqlSession().selectOne("getCnoFromPno", pno);

	}

	public Integer getEventTotalRow() {

		return this.getSqlSession().selectOne("EventTotalRow");

	}

	public Integer getNoticeTotalRow() {
		return this.getSqlSession().selectOne("NoticeTotalRow");

	}

	public Integer getQnaTotalRow() {
		return this.getSqlSession().selectOne("QnaTotalRow");
	}

	public List<SemiProductBean> selectProduct(HashMap<String, Object> map) {
		return this.getSqlSession().selectList("selectProduct", map);
	}

	public List<SemiProductBean> selectAllProduct() {

		return this.getSqlSession().selectList("selectAllProduct");

	}

	public Object qnaInfo(int no) {

		return this.getSqlSession().selectOne("qnaInfo", no);

	}

	public Object noticeInfo(int no) {

		return this.getSqlSession().selectOne("noticeInfo", no);

	}

	public Object eventInfo(int no) {

		return this.getSqlSession().selectOne("eventInfo", no);

	}

	public boolean idcheckProcess(String id, String password) {

		String dbPass = this.getSqlSession().selectOne("idcheckProcess", id);

		if (dbPass != null && dbPass.equals(password)) {
			return true;
		}

		return false;

	}

	public void insertMember(SemiMemberBean mb) {

		this.getSqlSession().insert("insertMember", mb);

	}

	public String selectPnameFromPno(Integer no) {

		return this.getSqlSession().selectOne("selectPnameFromPno", no);

	}
}
