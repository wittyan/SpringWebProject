package sist.com.action;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import semicolon.com.bean.SemiProductBean;
import semicolon.com.dao.APListDao;
import semicolon.com.team.SemiController;

public class ModProductAction implements Action{
	private String path;
	private boolean redirect;

	
	public ModProductAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}
	@Override
	public ActionForward execute(HttpServletRequest request, Model model) {
		String pno=request.getParameter("pno");
		String pname=request.getParameter("pname");
		String cno=request.getParameter("cno");
		String pPrice=request.getParameter("pPrice");
		String ptype=request.getParameter("ptype");
		String pfilename=request.getParameter("pfilename");
		String pstock=request.getParameter("pstock");

		SemiProductBean bean=new SemiProductBean();
		bean.setPno(Integer.parseInt(pno));
		bean.setPname(pname);
		bean.setCno(Integer.parseInt(cno));
		bean.setpPrice(Integer.parseInt(pPrice));
		bean.setPtype(ptype);
		bean.setPfilename(pfilename);
		bean.setPstock(Integer.parseInt(pstock));
		
		System.out.println(bean);
		SemiController.stAplistdao.updateProduct(bean);
		return new ActionForward(path, redirect);
	}
	
	
}
