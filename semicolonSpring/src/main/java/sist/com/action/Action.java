package sist.com.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Component
public interface Action {
	public ActionForward execute(HttpServletRequest request,Model model);
}
