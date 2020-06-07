package semicolon.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import semicolon.com.bean.zipBean;

@Component
public class AddressDao extends SqlSessionDaoSupport {

	
	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
		
		this.setSqlSessionTemplate(st);

	}

	public List<zipBean>selectDong(String dong) {
		return this.getSqlSession().selectList("selectDong",dong);
		
	}
	
}
