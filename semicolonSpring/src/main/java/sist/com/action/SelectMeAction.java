package sist.com.action;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import semicolon.com.dao.TaehoonDao;
import semicolon.com.team.SemiController;
public class SelectMeAction implements Action{

	private String path;
	private boolean redirect;
	
	
	
	public SelectMeAction() {
		super();
	}


	public SelectMeAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}


	@Override
	public ActionForward execute(HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		//System.out.println(id);
		model.addAttribute("list", SemiController.stTdao.selectMe(id));
		//request.setAttribute("mepri", TaehoonDao.selectMeprice(id));
		return new ActionForward(path, redirect);
	}

}
