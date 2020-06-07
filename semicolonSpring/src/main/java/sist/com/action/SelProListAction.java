package sist.com.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import semicolon.com.dao.APListDao;
import semicolon.com.team.SemiController;

public class SelProListAction implements Action{
	private String path;
	private boolean redirect;
	
	public SelProListAction() {
		super();
	}

	public SelProListAction(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}

	@Override
	public ActionForward execute(HttpServletRequest request, Model model) {
		//String id=request.getParameter("id");
		String id = request.getParameter("id");
		model.addAttribute("id", id);
		model.addAttribute("proList", SemiController.stAplistdao.selectProduct());
		return new ActionForward(path,redirect);
	}


	
}
