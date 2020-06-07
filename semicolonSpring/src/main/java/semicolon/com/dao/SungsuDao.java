package semicolon.com.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import semicolon.com.bean.SemiProductBean;
import semicolon.com.bean.SemiReserveBean;

//import sist.com.dto.SemiProductBean;
//import sist.com.dto.SemiReserveBean;


@Component
public class SungsuDao extends SqlSessionDaoSupport{
	
	@Autowired
	protected void initDao(SqlSessionTemplate st) throws Exception {
		this.setSqlSessionTemplate(st);
	}
	
	public SemiProductBean anselectProductFromCno(Integer cno) {
			return this.getSqlSession().selectOne("anselectProductFromCno", cno);
	}
	
	public SemiProductBean selectProductFromPname(String pname) {
			return this.getSqlSession().selectOne("selectProductFromPname",pname);
	
	}
	public void anInsertsemireserve(SemiReserveBean srb) {
			this.getSqlSession().insert("anInsertsemireserve",srb);
			

	}
	public  SemiProductBean anselectProductFromPno(int pno) {
		return this.getSqlSession().selectOne("anselectProductFromPno", pno);
		
		
	}
	public  List<SemiProductBean> selectPreferProductFromAge(String agegroup){
		return this.getSqlSession().selectList("selectPreferProductFromAge", agegroup);
	
	}
	
	public  int anSelectGradeFromPno(int i) {
			return (Integer) (this.getSqlSession().selectOne("anSelectGradeFromPno", i)!=null?this.getSqlSession().selectOne("anSelectGradeFromPno", i):0);
	
	}
	
	public  int anSelectReviewCountFromPno(int pno) {
		
			return (Integer) (this.getSqlSession().selectOne("anSelectReviewCountFromPno", pno)!=null?this.getSqlSession().selectOne("anSelectReviewCountFromPno", pno):0);
		
		
	}
}
