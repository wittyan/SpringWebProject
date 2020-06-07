package semicolon.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.aspectj.org.eclipse.jdt.core.dom.ThisExpression;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import semicolon.com.bean.SemiProductBean;

@Component
public class APListDao extends SqlSessionDaoSupport{

	
	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
		
		this.setSqlSessionTemplate(st);
		
	}
	public List<SemiProductBean> selectProduct(){
	
			return this.getSqlSession().selectList("APselectProduct");
	
	}
	public void updateProduct(SemiProductBean bean) {

		this.getSqlSession().update("APupdateProduct", bean);
	
	}
}
