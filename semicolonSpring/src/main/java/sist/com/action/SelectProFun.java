package sist.com.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import semicolon.com.dao.TaehoonDao;
import semicolon.com.team.SemiController;

public class SelectProFun implements Action{
	private String path;
	private boolean redirect;
	

	
	public SelectProFun() {
		super();
	}


	public SelectProFun(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}


	@Override
	public ActionForward execute(HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		//System.out.println(name);
		model.addAttribute("price", SemiController.stTdao.propriceCheck(name));
		
		return new ActionForward(path, redirect);
	}

}
