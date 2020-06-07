package semicolon.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import semicolon.com.bean.SemiReserveBean;
import semicolon.com.bean.SemiReviewBean;

@Component
public class SuyeonSemiDao extends SqlSessionDaoSupport{

	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}
	
	public List<SemiReviewBean> selectReview(Integer pno){
			return this.getSqlSession().selectList("selectReview",pno);
	
	}
	
	public void insertReview(SemiReviewBean bean) {
		this.getSqlSession().insert("insertReview",bean);
	
	}
	public Integer countReview() {
		return this.getSqlSession().selectOne("countReview");
		
	}
	public List<SemiReserveBean> selectReserved(String id){
			return this.getSqlSession().selectList("selectReserved",id);
		
	}
	public String selectProductName(int pno) {
			return this.getSqlSession().selectOne("selectProductName",pno);
	}
}
