package semicolon.com.dao;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.support.RequestContextUtils;

public class BeanLoader {
	public static Object getBean(final HttpServletRequest request, final String beanId) throws Exception {
		Object beanObject = null;
		ServletContext sc;
		HttpSession hs;
		WebApplicationContext webApplicationContext;
		// DispatcherServlet으로 로딩된 context를 가져 온다.
		webApplicationContext = RequestContextUtils.getWebApplicationContext(request);
		// 빈을 검색해서 해당 빈 오브젝트를 가져 온다.
		if (webApplicationContext.containsBean(beanId)) {
			beanObject = webApplicationContext.getBean(beanId);
			return beanObject;
		}
		hs = request.getSession();
		sc = hs.getServletContext();
		// ContextLoaderListener으로 로딩된 context를 가져 온다.
		webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(sc);
		if (webApplicationContext.containsBean(beanId)) {
			beanObject = webApplicationContext.getBean(beanId);
			return beanObject;
		}
		return beanObject;
	}
}
