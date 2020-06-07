package sist.com.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import semicolon.com.dao.TaehoonDao;
import semicolon.com.team.SemiController;

public class SelectComNameFun implements Action{
	private String path;
	private boolean redirect;
	
	
	
	
	public SelectComNameFun(String path, boolean redirect) {
		super();
		this.path = path;
		this.redirect = redirect;
	}
	public SelectComNameFun() {
		super();
	}
	@Override
	public ActionForward execute(HttpServletRequest request, Model model) {
		// TODO Auto-generated method stub
		String no = request.getParameter("no");
		System.out.println(no);
		model.addAttribute("cname", SemiController.stTdao.SeleComNameFun1(Integer.parseInt(no)));
		
		return new ActionForward(path, redirect);
	}
	
	
	
	
	
	
}
