package semicolon.com.team;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String testGood(Model model,HttpSession session) {
		String id = (String)session.getAttribute("id");
		return "";
	}
	
}
