package semicolon.com.team;

import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sun.xml.bind.v2.schemagen.xmlschema.List;

import semicolon.com.bean.GoodOrBadBean;
import semicolon.com.bean.PageBean;
import semicolon.com.bean.SemiEventBean;
import semicolon.com.bean.SemiNoticeBean;
import semicolon.com.bean.SemiProductBean;
import semicolon.com.bean.SemiQnaBean;
import semicolon.com.bean.SemiReviewBean;
import semicolon.com.bean.zipBean;
import semicolon.com.dao.APListDao;
import semicolon.com.dao.AddressDao;
import semicolon.com.dao.AppleDao;
import semicolon.com.dao.MyPageDao;
import semicolon.com.dao.SungsuDao;
import semicolon.com.dao.SuyeonSemiDao;
import semicolon.com.dao.TaehoonDao;
import sist.com.action.Action;
import sist.com.action.ActionFactory;
import sist.com.action.ActionForward;

@Controller
public class SemiController {

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
	
	String locations = "C:\\Users\\user\\git\\semicoloweb\\semicolonSpring\\src\\main\\webapp\\semiupload\\";
//	ActionFactory�κ��� Spring���� ����

	@RequestMapping(value = { "sProAction.do", "selectProFun.do", "comName.do", "selemblt.do", "selemblt2.do",
			"comList.do", "seleme.do", "modCompany.do", "proList.do", "modProduct.do" ,"companyList.do"})
	public String ActionFactory(String cmd, HttpServletRequest request, Model model) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Action action = ActionFactory.getAction(cmd, model);
		ActionForward af = action.execute(request, model);
		if (af.isRedirect()) {

			return "redirect:" + af.getPath();
		} else {

			return af.getPath();
		}
	}

	@PostConstruct
	private void initStaticDao() {
		stAdao = this.Adao;
		stTdao = this.tdao;
		stSuyeonsemidao = this.suyeonSemiDao;
		stSdao = this.Sdao;
		stAplistdao = this.apListdao;
		stAddressdao = this.addressDao;
		stmyPageDao = this.myPageDao;
	}

	
	@RequestMapping(value = "admincontrolMain.do")
	public String admincontrolMain() {
		
		return "admincontrolMain";
	}
	@RequestMapping(value = "login.do")
	public String login() {

		return "login";
	}
	@RequestMapping(value = "loginFun.do")
	public String loginCheck(String id, String password, HttpSession session) {
		String pass = tdao.loginIdCheckFun(id);
		if (pass!=null && pass.equals(password)) {
			session.setAttribute("id", id);
			session.setMaxInactiveInterval(600);
			return "redirect:/index.do";
		}
		return "loginMain";
	}


	@RequestMapping(value = "logout.do")
	public String logoutProcess(HttpSession session) {
		session.invalidate();
		return "redirect:/index.do";
	}

	@RequestMapping(value = "mypage.do")
	public String myPageGoGo(HttpSession session) {
		String id = (String) session.getAttribute("id");
		if (id != null)
			return "redirect:/myInfo.do";
		return "loginMain";

	}

	@RequestMapping(value = "communityList.do")
	public String communityListProcess(HttpServletRequest request, Model model) {
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("/communtyList.do");

		String type = request.getParameter("type");
		type = type == null ? "qna" : type;

//	 	session.setAttribute("id", "admin");

		String id = (String) request.getSession().getAttribute("id");

		model.addAttribute("id", id);
		model.addAttribute("type", type);

		int pageScale = 10;

		int qnatotalRow = 0;
		int eventtotalRow = 0;
		int noticetotalRow = 0;

		int qnatotalPage = 1;
		int eventtotalPage = 1;
		int noticetotalPage = 1;

		int noticecurrentPage = 1;
		int eventcurrentPage = 1;
		int qnacurrentPage = 1;

		qnatotalRow = Adao.getQnaTotalRow();
		eventtotalRow = Adao.getEventTotalRow();
		noticetotalRow = Adao.getNoticeTotalRow();

		qnatotalPage = (qnatotalPage = qnatotalRow % pageScale == 0 ? (qnatotalRow / pageScale)
				: (qnatotalRow / pageScale) + 1) == 0 ? 1 : qnatotalPage;
		eventtotalPage = (eventtotalPage = eventtotalRow % pageScale == 0 ? (eventtotalRow / pageScale)
				: (eventtotalRow / pageScale) + 1) == 0 ? 1 : eventtotalPage;
		noticetotalPage = (noticetotalPage = noticetotalRow % pageScale == 0 ? (noticetotalRow / pageScale)
				: (noticetotalRow / pageScale) + 1) == 0 ? 1 : noticetotalPage;
		try {
			qnacurrentPage = 1;
			eventcurrentPage = 1;
			noticecurrentPage = 1;
			String pageData = request.getParameter("page");
			pageData = pageData == null ? "1" : pageData;
			if (type.equals("qna")) {
				qnacurrentPage = Integer.parseInt(pageData);
			} else if (type.equals("event")) {
				eventcurrentPage = Integer.parseInt(pageData);
			} else if (type.equals("notice")) {
				noticecurrentPage = Integer.parseInt(pageData);
			}
		} catch (Exception e) {

		}
		PageBean pageBean = new PageBean(qnacurrentPage, noticecurrentPage, eventcurrentPage, qnatotalPage,
				noticetotalPage, eventtotalPage, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		// 1page --->1 10
		// 2page---->11 20
		/*
		 * 1BLOCK STARTPAGE ENDPAGE [1][2]....[10] 2BLOCK STARTPAGE ENDPAGE
		 * [11][2]....[20]
		 */
		int start = 1 + (qnacurrentPage - 1) * pageScale;
		int end = pageScale + (qnacurrentPage - 1) * pageScale;
		int currentBlock = qnacurrentPage % pageScale == 0 ? (qnacurrentPage / pageScale)
				: (qnacurrentPage / pageScale) + 1;
		int startPage = 1 + (currentBlock - 1) * pageScale;
		int endPage = (pageScale + (currentBlock - 1) * pageScale);
		endPage = (endPage) >= qnatotalPage ? qnatotalPage : endPage;

		pageBean.setQnastartPage(startPage);
		pageBean.setQnaendPage(endPage);
		pageBean.setQnacurrentBlock(currentBlock);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		ArrayList<SemiQnaBean> QnaList = (ArrayList<SemiQnaBean>) Adao.selectQna(map);

		start = 1 + (eventcurrentPage - 1) * pageScale;
		end = pageScale + (eventcurrentPage - 1) * pageScale;
		currentBlock = eventcurrentPage % pageScale == 0 ? (eventcurrentPage / pageScale)
				: (eventcurrentPage / pageScale) + 1;
		startPage = 1 + (currentBlock - 1) * pageScale;
		endPage = (pageScale + (currentBlock - 1) * pageScale);
		endPage = (endPage) >= eventtotalPage ? eventtotalPage : endPage;

		pageBean.setEventstartPage(startPage);
		pageBean.setEventendPage(endPage);
		pageBean.setEventcurrentBlock(currentBlock);

		map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		ArrayList<SemiEventBean> EventList = (ArrayList<SemiEventBean>) Adao.selectEvent(map);

		start = 1 + (noticecurrentPage - 1) * pageScale;
		end = pageScale + (noticecurrentPage - 1) * pageScale;
		currentBlock = noticecurrentPage % pageScale == 0 ? (noticecurrentPage / pageScale)
				: (noticecurrentPage / pageScale) + 1;
		startPage = 1 + (currentBlock - 1) * pageScale;
		endPage = (pageScale + (currentBlock - 1) * pageScale);
		endPage = (endPage) >= noticetotalPage ? noticetotalPage : endPage;

		pageBean.setNoticestartPage(startPage);
		pageBean.setNoticeendPage(endPage);
		pageBean.setNoticecurrentBlock(currentBlock);

		map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		ArrayList<SemiNoticeBean> NoticeList = (ArrayList<SemiNoticeBean>) Adao.selectNotice(map);

		model.addAttribute("QnaList", QnaList);
		model.addAttribute("EventList", EventList);
		model.addAttribute("NoticeList", NoticeList);

		model.addAttribute("pageBean", pageBean);

		return "community";
	}

	@RequestMapping(value = "eventForm.do")
	public String eventFormFunc(Model model, HttpServletRequest request) {

		/*
		 * type = ���� �� �Խ��� mode = new, reply, modify pageData = ���ư� page
		 */
		String type = request.getParameter("type");
		String mode = request.getParameter("mode");
		String pageData = request.getParameter("page");
		String id = (String) request.getSession().getAttribute("id");

//	 		String mode = "new";
//	 		String pageData="1";

		if (mode == null) {
			mode = "new";
		}
		SemiEventBean seb = null;
		if (mode != null && mode.equals("modify")) {
			String no = request.getParameter("no");
			seb = (SemiEventBean) Adao.eventInfo(Integer.parseInt(no));
		}

		model.addAttribute("type", type);
		model.addAttribute("mode", mode);
		model.addAttribute("pageData", pageData);
		model.addAttribute("id", id);
		model.addAttribute("seb", seb);

		return "eventForm";
	}

	@RequestMapping(value = "qnaForm.do")
	public String qnaFormFunc(HttpServletRequest request, Model model) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * type = ���� �� �Խ��� mode = new, reply, modify pageData = ���ư� page
		 */
		String type = request.getParameter("type");
		String mode = request.getParameter("mode");
		String pageData = request.getParameter("page");
		String id = (String) request.getSession().getAttribute("id");

		model.addAttribute("type", type);
		model.addAttribute("mode", mode);
		model.addAttribute("page", pageData);
		model.addAttribute("id", id);

//	 		String mode = "new";
//	 		String pageData="1";

		int ref = 0, step = 0, lev = 0, pnum = 0;
		if (mode == null) {
			mode = "new";
		}
		if (mode != null && mode.equals("reply")) {
			ref = Integer.parseInt(request.getParameter("ref"));
			step = Integer.parseInt(request.getParameter("step"));
			lev = Integer.parseInt(request.getParameter("lev"));
			pnum = Integer.parseInt(request.getParameter("pnum"));
		}

		SemiQnaBean sqb = null;
		String no = "";
		if (mode != null && mode.equals("modify")) {
			no = request.getParameter("no");
			sqb = (SemiQnaBean) Adao.qnaInfo(Integer.parseInt(no));
			String pname = Adao.selectPnameFromPno(sqb.getPno());
			model.addAttribute("pname", pname);
		}

		model.addAttribute("ref", ref);
		model.addAttribute("step", step);
		model.addAttribute("lev", lev);
		model.addAttribute("pnum", pnum);

		model.addAttribute("sqb", sqb);

		HashMap<String, Object> map = new HashMap();
		ArrayList<SemiProductBean> list = (ArrayList<SemiProductBean>) Adao.selectAllProduct();

		model.addAttribute("list", list);

		return "qnaForm";

	}

	@RequestMapping(value = "noticeForm.do")
	public String noticeFomrFunc(HttpServletRequest request, Model model) {

		/*
		 * type = ���� �� �Խ��� mode = new, reply, modify pageData = ���ư� page
		 */
		String type = request.getParameter("type");
		String mode = request.getParameter("mode");
		String pageData = request.getParameter("page");
		String id = (String) request.getSession().getAttribute("id");

//		String mode = "new";
//		String pageData="1";

		if (mode == null) {
			mode = "new";
		}

		SemiNoticeBean snb = null;
		if (mode != null && mode.equals("modify")) {
			String no = request.getParameter("no");
			snb = (SemiNoticeBean) Adao.noticeInfo(Integer.parseInt(no));

		}

		model.addAttribute("type", type);
		model.addAttribute("pageData", pageData);
		model.addAttribute("mode", mode);
		model.addAttribute("id", id);
		model.addAttribute("snb", snb);

		return "noticeForm";
	}

	@RequestMapping(value = "delete.do")
	public String communityDeleteProcess(HttpServletRequest request, Model model) {

		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int no = Integer.parseInt(request.getParameter("no"));
		String pageData = request.getParameter("page");
		String type = request.getParameter("type");

		if (type.equals("qna")) {
			Adao.deleteQna(no);
			/* �θ��� REPLY�� ��ȭ */
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("num", request.getParameter("pno"));
			map.put("mode", "del");

			Adao.updateReply(map);
		} else if (type.equals("notice")) {
			Adao.deleteNotice(no);

		} else if (type.equals("event")) {
			Adao.deleteEvent(no);

		}
		return "redirect:/communityList.do?type=" + type + "&page=" + pageData;

	}

	@RequestMapping(value = "insert.do")
	public String insertFunc(@RequestParam(value = "file", required = false) MultipartFile file,
			MultipartHttpServletRequest mrequest, HttpServletRequest request) {

		int no = 0;

		String type = mrequest.getParameter("type");
		String mode = mrequest.getParameter("mode");
		String pageData = mrequest.getParameter("page");

		if (type.equals("eprogress")) {

			int eno = Integer.parseInt(mrequest.getParameter("no"));
			Adao.updateEprogress(eno);

			return "redirect:/communityList.do?page=" + pageData + "&type=event";

		} else {

			/* �Խ��Ǻ� �б� */
			if (type.equals("qna")) {
				SemiQnaBean qnaBean = new SemiQnaBean();

				if (mode.equals("new") || mode.equals("reply")) {
					qnaBean.setQno(Adao.getQnaSequence());

				}

				if (mode.equals("modify")) {
					no = Integer.parseInt(mrequest.getParameter("no"));
					qnaBean.setQno(no);
				}

				if (mode.equals("reply")) {
					qnaBean.setRef(Integer.parseInt(mrequest.getParameter("ref")));
					qnaBean.setStep(Integer.parseInt(mrequest.getParameter("step")));
					qnaBean.setLev(Integer.parseInt(mrequest.getParameter("lev")));
					qnaBean.setPnum(Integer.parseInt(mrequest.getParameter("pnum")));
				}

				qnaBean.setId(mrequest.getParameter("id"));

				qnaBean.setQtitle(mrequest.getParameter("title"));

				System.out.println(mrequest.getParameter("title"));
				qnaBean.setPno(Integer.parseInt(mrequest.getParameter("selectproduct")));
				qnaBean.setQcontents(mrequest.getParameter("contents"));

				String fileName = file.getOriginalFilename();
				FileOutputStream fos = null;

				if (fileName.length() > 0) {
					try {
						fos = new FileOutputStream(new File(locations + fileName));
						fos.write(file.getBytes());
						qnaBean.setQfilename(fileName);
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					} finally {
						try {
							if (fos != null)
								fos.close();
						} catch (Exception e2) {
							// TODO: handle exception
						}
					}
				}
				qnaBean.setQfilename(qnaBean.getQfilename() == null ? "noimg.jpg" : qnaBean.getQfilename());
				if (mode.equals("new")) {
					qnaBean.setRef(qnaBean.getQno());
					qnaBean.setPnum(qnaBean.getQno());

				} else if (mode.equals("reply")) {

					// updateReply
					HashMap<String, Object> map = new HashMap<String, Object>();

					/* �θ��� REPLY�� ��ȭ */
					map.put("num", qnaBean.getPnum());
					map.put("mode", "reply");

					/* ref���� step��ȭ */
					map.put("ref", qnaBean.getRef());

					map.put("step", qnaBean.getStep());
					// updateStep
					Adao.updateStep(map);
					Adao.updateReply(map);

					Adao.updateQstate(qnaBean.getRef());

					qnaBean.setStep(qnaBean.getStep() + 1);
					qnaBean.setLev(qnaBean.getLev() + 1);
				} else if (mode.equals("modify")) {
					Adao.updateQna(qnaBean);
					return "redirect:/qnaContents.do?no=" + no;

				}
				if (!mode.equals("modify")) {
					int cno = Adao.getCnoFromPno(qnaBean.getPno());
					qnaBean.setCno(cno);
					Adao.insertQna(qnaBean);
					return "redirect:/communityList.do?page=" + pageData + "&type=" + type;
				}
			} // if
			else if (type.equals("notice")) {

				SemiNoticeBean noticeBean = new SemiNoticeBean();
				if (mode.equals("new")) {
					noticeBean.setNno(Adao.getNoticeSequence());
				}

				if (mode.equals("modify")) {

					no = Integer.parseInt(request.getParameter("no"));
					noticeBean.setNno(no);

				}
				noticeBean.setId(request.getParameter("id"));
				noticeBean.setNtitle(request.getParameter("title"));
				noticeBean.setNcontents(request.getParameter("contents"));

				if (mode.equals("modify")) {
					Adao.updateNotice(noticeBean);
					return "redirect:/noticeContents.do?no=" + no;

				}
				if (!mode.equals("modify")) {

					Adao.insertNotice(noticeBean);

					return "redirect:/communityList.do?page=" + pageData + "&type=" + type;

				}

			}

			else if (type.equals("event")) {

				SemiEventBean eventBean = new SemiEventBean();
				if (mode.equals("new")) {
					eventBean.setEno(Adao.getEventSequence());
				}
				if (mode.equals("modify")) {
					no = Integer.parseInt(mrequest.getParameter("no"));
					eventBean.setEno(no);
				}
				eventBean.setId(mrequest.getParameter("id"));
				eventBean.setEtitle(mrequest.getParameter("title"));
				eventBean.setEcontents(mrequest.getParameter("contents"));

				String fileName = file.getOriginalFilename();
				FileOutputStream fos = null;

				if (fileName.length() > 0) {
					try {
						fos = new FileOutputStream(new File(locations + fileName));
						fos.write(file.getBytes());
						eventBean.setEfilename(fileName);
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					} finally {
						try {
							if (fos != null)
								fos.close();
						} catch (Exception e2) {
							// TODO: handle exception
						}
					}
				}

				eventBean.setEfilename(eventBean.getEfilename() == null ? "noimg.jpg" : eventBean.getEfilename());

				if (mode.equals("modify")) {
					Adao.updateEvent(eventBean);
					return "redirect:/eventContents.do?no=" + no;
				}
				if (!mode.equals("modify")) {
					eventBean.setEprogress("true");
					Adao.insertEvent(eventBean);
					return "redirect:/communityList.do?page=" + pageData + "&type=" + type;

				}
			}
		}
		return "";
	}

	@RequestMapping(value = "qnaContents.do")
	public String qnaContentsFunc(HttpServletRequest request, Model model) {

		int no = Integer.parseInt(request.getParameter("no"));
		String pageData = request.getParameter("page");
		SemiQnaBean sqb = null;
		if (no != 0) {
			sqb = (SemiQnaBean) Adao.qnaInfo(no);
		}

		String id = (String) request.getSession().getAttribute("id");

		model.addAttribute("id", id);
		model.addAttribute("pageData", pageData);
		model.addAttribute("no", no);
		model.addAttribute("sqb", sqb);

		return "qnaContents";
	}

	@RequestMapping(value = "eventContents.do")
	public String eventContentsFunc(HttpServletRequest request, Model model) {

		int no = 0;
		if (request.getParameter("no") != null) {
			no = Integer.parseInt(request.getParameter("no"));
		}
		String pageData = request.getParameter("page");

		SemiEventBean seb = null;
		if (no != 0) {
			seb = (SemiEventBean) Adao.eventInfo(no);
		}

		/* ID�������� */
		String id = (String) request.getSession().getAttribute("id");

		model.addAttribute("id", id);
		model.addAttribute("pageData", pageData);
		model.addAttribute("no", no);
		model.addAttribute("seb", seb);

		return "eventContents";
	}

	@RequestMapping(value = "noticeContents.do")
	public String noticeContentsFunc(HttpServletRequest request, Model model) {

		int no = 5;
		if (request.getParameter("no") != null) {
			no = Integer.parseInt(request.getParameter("no"));
		}
		String pageData = request.getParameter("page");

		SemiNoticeBean snb = null;
		if (no != 0) {
			snb = (SemiNoticeBean) Adao.noticeInfo(no);
		}

		// String id = (String)request.getSession().getAttribute("id");
		String id = request.getParameter("id");

		model.addAttribute("id", id);
		model.addAttribute("pageData", pageData);
		model.addAttribute("no", no);
		model.addAttribute("snb", snb);

		return "noticeContents";
	}

	@RequestMapping(value = "idAjax.do")
	public String idAjaxFunc(String id, Model model) {

		model.addAttribute("idCheck", Adao.companyIdCheck(id));
		return "idAjax";
	}

	@RequestMapping(value = "list.do")
	public String listFunc(HttpServletRequest request, Model model) {

		model.addAttribute("sungsuDao", Sdao);
		model.addAttribute("appleDao", Adao);
		model.addAttribute("taehoonDao", tdao);

		return "list";
	}

	@RequestMapping(value = "idcheck2.do")
	public String idcheck2Func(HttpServletRequest request, Model model) {

		model.addAttribute("sungsuDao", Sdao);
		model.addAttribute("appleDao", Adao);
		model.addAttribute("taehoonDao", tdao);

		return "idcheck2";
	}

	@RequestMapping(value = "index.do")
	public String indexFunc(HttpServletRequest request, HttpServletResponse response, Model model) {

		model.addAttribute("sungsuDao", Sdao);
		model.addAttribute("appleDao", Adao);
		model.addAttribute("taehoonDao", tdao);
		model.addAttribute("suyeonSemiDao", suyeonSemiDao);
		model.addAttribute("addressDao", addressDao);
		model.addAttribute("myPageDao", myPageDao);
		return "index";
	}
	
	@RequestMapping(value = "adminProductList.do")
	public String adminProductListFunc(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		model.addAttribute("sungsuDao", Sdao);
		model.addAttribute("appleDao", Adao);
		model.addAttribute("taehoonDao", tdao);
		model.addAttribute("suyeonSemiDao", suyeonSemiDao);
		model.addAttribute("addressDao", addressDao);
		model.addAttribute("myPageDao", myPageDao);
		
		return "adminProductList";
	}
	@RequestMapping(value = "address.do")
	public String addressFunc(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		model.addAttribute("addressDao", addressDao);
		
		return "address";
	}

	@RequestMapping(value = "info.do")
	public String infoFunc(GoodOrBadBean gob,int no,HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		model.addAttribute("sungsuDao", Sdao);
		model.addAttribute("appleDao", Adao);
		model.addAttribute("taehoonDao", tdao);
		model.addAttribute("suyeonSemiDao", suyeonSemiDao);
		model.addAttribute("addressDao", addressDao);
		model.addAttribute("myPageDao", myPageDao);
		
		gob.setId(id);
		gob.setNo(no);
		
		try {
			model.addAttribute("mygood", tdao.selemyGood(gob));
			model.addAttribute("mybad", tdao.selemyBad(gob));
		} catch (Exception e) {
			model.addAttribute("mygood", 0);
			model.addAttribute("mybad", 0);
		}
		
		
		return "info";
	}
	@RequestMapping(value = "inforeserveProcess.do")
	public String inforeserveProcessFunc(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		model.addAttribute("sungsuDao", Sdao);
		model.addAttribute("appleDao", Adao);
		model.addAttribute("taehoonDao", tdao);
		model.addAttribute("suyeonSemiDao", suyeonSemiDao);
		model.addAttribute("addressDao", addressDao);
		model.addAttribute("myPageDao", myPageDao);
		
		model.addAttribute("date", request.getParameter("date"));
		model.addAttribute("count", request.getParameter("count"));
		model.addAttribute("pno", request.getParameter("pno"));
		model.addAttribute("id", request.getParameter("id"));
		
		return "inforeserveProcess";
	}
	@RequestMapping(value = "myReservation.do")
	public String myReservationFunc(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		model.addAttribute("sungsuDao", Sdao);
		model.addAttribute("appleDao", Adao);
		model.addAttribute("taehoonDao", tdao);
		model.addAttribute("suyeonSemiDao", suyeonSemiDao);
		model.addAttribute("addressDao", addressDao);
		model.addAttribute("myPageDao", myPageDao);
		
		return "myReservation";
	}
	@RequestMapping(value = "myInfoProcess.do")
	public String myInfoProcessFunc(HttpServletRequest request, HttpServletResponse response, Model model) {
		
	
		model.addAttribute("myPageDao", myPageDao);
		
		return "myInfoProcess";
	}
	
	@RequestMapping(value = "myInfo.do")
	public String myInfo(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		
		model.addAttribute("myPageDao", myPageDao);
		
		return "myInfo";
	}

	@RequestMapping(value = "registerProcess.do")
	public String registerProcessFunc(HttpServletRequest request, HttpServletResponse response, Model model) {

		model.addAttribute("appleDao", Adao);
		
		return "registerProcess";
	}
	@RequestMapping(value = "registerProduct.do")
	public String registerProductFunc(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		model.addAttribute("appleDao", Adao);
		
		return "registerProduct";
	}
	@RequestMapping(value = "registerReview.do")
	public String registerReviewFunc(@RequestParam(value="rvfilename",required=false)MultipartFile file ,HttpServletRequest request, HttpServletResponse response, Model model) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		SemiReviewBean srb=new SemiReviewBean();
		
				srb.setRvcontents(request.getParameter("rvcontents"));
				
				String pno=request.getParameter("pno");
				int cno = Adao.getCnoFromPno(Integer.parseInt(pno));
				
				String id=(String) request.getSession().getAttribute("id");
				srb.setPno(Integer.parseInt(pno));
				srb.setCno(cno);
				srb.setId(id);
				srb.setRvgrade("5");
				
				
				String fileName = file.getOriginalFilename();
				FileOutputStream fos = null;

				if (fileName.length() > 0) {
					try {
						fos = new FileOutputStream(new File(locations + fileName));
						fos.write(file.getBytes());
						srb.setRvfilename(fileName);
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					} finally {
						try {
							if (fos != null)
								fos.close();
						} catch (Exception e2) {
							// TODO: handle exception
						}
					}
				}
				srb.setRvfilename(srb.getRvfilename() == null ? "noimg.jpg" : srb.getRvfilename());

				suyeonSemiDao.insertReview(srb);
			
		return "redirect:/info.do?pno="+pno+"&id="+id;
	}
	@RequestMapping(value = "signup.do")
	public String signupFunc(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		model.addAttribute("taehoonDao", tdao);
		
		return "signup";
	}
	
	@RequestMapping(value = "signupProcess.do")
	public String signupProcessFunc(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		model.addAttribute("taehoonDao", tdao);
		
		return "signupProcess";
	}
	
	@RequestMapping(value = "memberList.do")
	public String memberListFunc(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		model.addAttribute("sungsuDao", Sdao);
		model.addAttribute("appleDao", Adao);
		model.addAttribute("taehoonDao", tdao);
		model.addAttribute("suyeonSemiDao", suyeonSemiDao);
		model.addAttribute("addressDao", addressDao);
		model.addAttribute("myPageDao", myPageDao);
		return "memberList";
	}
	
	@RequestMapping(value="inforeserveCheck.do")
	public String inforeserveCheckFunc(HttpServletRequest request,Model model) {
		
//		String date = request.getParameter("date");
//		String count = request.getParameter("count");
	
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		String id = (String)request.getSession().getAttribute("id");

		int cno = Adao.getCnoFromPno(pno);
		
		model.addAttribute("spb",Adao.anSelectProductFromPno(pno));
		model.addAttribute("company",Adao.anSelectCompany(cno));
		model.addAttribute("member", Adao.anSelectMemberInfo(id));
		model.addAttribute("date", request.getParameter("date"));
		model.addAttribute("count", request.getParameter("count"));
		model.addAttribute("pno", request.getParameter("pno"));
		model.addAttribute("id", request.getParameter("id"));
		
		return "inforeserveCheck";
	}
	@RequestMapping(value="caddress.do")
	public String cadressFunc(HttpServletRequest request,Model model) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String dong = request.getParameter("dong");  
		java.util.List<zipBean>list = dong!=null?Adrdao.selectDong(dong):null;

		System.out.println("caddress.do");
		System.out.println(list);
		System.out.println(dong);
		model.addAttribute("list", list);
		model.addAttribute("dong", dong);
		return "caddress";
	}
}
