package semicolon.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import semicolon.com.bean.GoodOrBadBean;
import semicolon.com.bean.SemiCompanyBean;
import semicolon.com.bean.SemiList1;
import semicolon.com.bean.SemiMemberBean;
import semicolon.com.bean.SemiProductBean;
import semicolon.com.bean.SemiQnaBean;


@Component
public class TaehoonDao extends SqlSessionDaoSupport{
	
	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
		// TODO Auto-generated method stub
		this.setSqlSessionTemplate(st);
	}
	public boolean idcheckProcess(String id) {
	    String rsId = this.getSqlSession().selectOne("idcheckProcess",id);
	   
	      return rsId==null||rsId.equals("")?false:true;
	   }
	public String loginIdCheckFun(String id) {
		return this.getSqlSession().selectOne("loginIdCheckFun", id);
	}
	public List<SemiQnaBean> selectQna() {
		return this.getSqlSession().selectList("selectQna");
	}
	public List<String> selectProductName1(int cno) {
		return this.getSqlSession().selectList("selectProductName1",cno);
	}
	public List<String> selectComName1() {
		return this.getSqlSession().selectList("selectComName1");
	}	
	public void insertMember(SemiMemberBean mb) {
		this.getSqlSession().insert("insertMember", mb);
	}	
	public int propriceCheck(String name) {
	    return this.getSqlSession().selectOne("propriceCheck",name);	         
	}
	public String SeleComNameFun1(int no) {
	    return this.getSqlSession().selectOne("SeleComNameFun1",no);	         
	}
	public List<SemiList1> SeleMbltall() {
	    return this.getSqlSession().selectList("SeleMbltall");	         
	}
	public List<SemiList1> SeleMbltIwannt() {
	    return this.getSqlSession().selectList("SeleMbltIwannt");	         
	}
	public List<SemiList1> SeleMbltIwannt1() {
	    return this.getSqlSession().selectList("SeleMbltIwannt1");	         
	}
	public List<SemiList1> seleComList() {
	    return this.getSqlSession().selectList("seleComList");	         
    }
	public int selePriceSum() {
        return this.getSqlSession().selectOne("selePriceSum");	         
    }
	public List<SemiList1> selectMe(String id) {
	    return this.getSqlSession().selectList("selectMe111",id);	         
    }
	public int selectMeprice(String id) {
        return this.getSqlSession().selectOne("selectMeprice",id);	         
    }
	public void updateCompanyList(SemiCompanyBean scb) {
	    this.getSqlSession().update("updateCompanyList", scb);
    }
	public List<SemiProductBean> selectTop4() {
	    return this.getSqlSession().selectList("selectTop4");         
    }
	public int selemyGood(GoodOrBadBean gob) {
		return this.getSqlSession().selectOne("selemyGood", gob);
	}
	public int selemyBad(GoodOrBadBean gob) {
		return this.getSqlSession().selectOne("selemyBad", gob);
	}
	public void insertGood() {
		this.getSqlSession().insert("insertGood");
	}
	
}


