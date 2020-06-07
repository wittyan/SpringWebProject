package sist.com.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import semicolon.com.dao.TaehoonDao;
import semicolon.com.team.SemiController;
public class SeleMblt1 implements Action {
	private String path;
	private boolean redirect;
	
	

	public SeleMblt1() {
		super();
	}



	public SeleMblt1(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}



	@Override
	public ActionForward execute(HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		String no = request.getParameter("no");
		if(no.equals("1")) {
	    model.addAttribute("list", SemiController.stTdao.SeleMbltIwannt());
		}else {
			model.addAttribute("list", SemiController.stTdao.SeleMbltIwannt1());
		}
		return new ActionForward(path, redirect);
	}

}
