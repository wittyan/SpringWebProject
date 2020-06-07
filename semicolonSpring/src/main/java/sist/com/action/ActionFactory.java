package sist.com.action;

import org.springframework.ui.Model;

public class ActionFactory {
	public static Action getAction(String cmd,Model model) {
		Action action = null;
		if (cmd.equals("sProAction")) {
			action = new SelectProductAction("test", false);
		} else if (cmd.equals("selectProFun")) {
			action = new SelectProFun("test1", false);
		} else if (cmd.equals("comName")) {
			action = new SelectComNameFun("test2", false);
		} else if (cmd.equals("selemblt")) {
			action = new SeleMbltallAction("test3", false);
		}  else if (cmd.equals("selemblt2")) {
			action = new SeleMblt1("test4", false);
		} else if (cmd.equals("comList")) {
			action = new SeleComListAction("companyList", false);
		}  else if (cmd.equals("seleme")) {
				action = new SelectMeAction("test3",false);
		}  else if (cmd.equals("modCompany")) {
			action = new ModCompany("comList.do?cmd=comList", true);
	    } 
		//�삙由�
		else if (cmd.equals("proList")) {
			action = new SelProListAction("productList", false);
		} else if(cmd.equals("modProduct")) {
			action=new ModProductAction("proList.do?cmd=proList", false);
		}
		return action;
	}
}
