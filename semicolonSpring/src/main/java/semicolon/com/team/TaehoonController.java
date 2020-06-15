package semicolon.com.team;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semicolon.com.bean.GoodOrBadBean;
import semicolon.com.dao.APListDao;
import semicolon.com.dao.AddressDao;
import semicolon.com.dao.AppleDao;
import semicolon.com.dao.MyPageDao;
import semicolon.com.dao.SungsuDao;
import semicolon.com.dao.SuyeonSemiDao;
import semicolon.com.dao.TaehoonDao;

@Controller
public class TaehoonController {

	public static SungsuDao stSdao;
	public static AppleDao stAdao;
	public static SuyeonSemiDao stSuyeonsemidao;
	public static TaehoonDao stTdao;
	public static APListDao stAplistdao;
	public static AddressDao stAddressdao;
	public static MyPageDao stmyPageDao;
	@Inject
	TaehoonDao tdao;
	@Resource
	AddressDao Adrdao;
	@Resource
	SungsuDao Sdao;
	@Resource
	AppleDao Adao;
	@Resource
	SuyeonSemiDao suyeonSemiDao;
	@Resource
	APListDao apListdao;
	@Resource
	AddressDao addressDao;
	@Resource
	MyPageDao myPageDao;
	
	@RequestMapping(value = "gogoGood.do")
	public String testGood(GoodOrBadBean gob,Model model,HttpSession session,int no, String action,HttpServletRequest request) {
		String id = (String)session.getAttribute("id");
		//String id = request.getParameter("id");
		gob.setId(id);
		gob.setNo(no);
		System.out.println(id+" : "+action+" : "+no);
		
		if(action.equals("plusG")) {
			tdao.deleteGoodandBad(gob);
			tdao.insertGood(gob);
			return "redirect:/team/info.do";
		}else if(action.equals("minus")) {
			tdao.deleteGoodandBad(gob);
			return "redirect:/team/info.do";
		}else if(action.equals("plusB")) {
			tdao.deleteGoodandBad(gob);
			tdao.insertBad(gob);
			return "redirect:/team/info.do";
		}
		
		return "redirect:/team/info.do";
	}
	
}
