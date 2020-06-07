package semicolon.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import semicolon.com.bean.SemiCompanyBean;
import semicolon.com.bean.SemiMemberBean;
import semicolon.com.bean.SemiProductBean;
import semicolon.com.bean.SemiReserveBean;


@Component
public class MyPageDao extends SqlSessionDaoSupport{
	
	
	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}
	
	public SemiMemberBean selectMember(String id) {
			return this.getSqlSession().selectOne("mySelectMember", id);
		
	}
	public List<SemiReserveBean> selectReserve(String id){
			return this.getSqlSession().selectList("mySelectReserve", id);
		
	}
	public SemiProductBean selectProduct(int pno) {
			return this.getSqlSession().selectOne("mySelectProduct", pno);
		
	}
	public SemiCompanyBean selectCompany(int cno) {
			return this.getSqlSession().selectOne("mySelectCompany", cno);
		
	}
	public void updateMember(SemiMemberBean bean) {
			this.getSqlSession().update("myUpdateMember", bean);
		
	}
}
