package sist.com.action;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import semicolon.com.dao.TaehoonDao;
import semicolon.com.team.SemiController;

public class SelectProductAction implements Action{
	private String path;
	private boolean redirect;
	
	
	
	public SelectProductAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}
	public SelectProductAction() {
		super();
	}
	@Override
	public ActionForward execute(HttpServletRequest request,Model model) {
		
		String no = request.getParameter("no");
		//System.out.println(no);
		
		/*List<String>list = TaehoonDao.selectProductName1(Integer.parseInt(no));
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}*/
//		model.addAttribute("list", SemiController.stTdao.selectProductName1(Integer.parseInt(no)));
		request.setAttribute("list", SemiController.stTdao.selectProductName1(Integer.parseInt(no)));
		
		return new ActionForward(path, redirect);
	}
	
	
}
