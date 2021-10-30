package middleware.handler;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class HandleData {
	private HttpServletRequest req;
	private Map<String, Object> baseinfo = new HashMap<>();

	public Map<String, Object> handlePageRequest(HttpServletRequest req) {
		Enumeration<String> req_enum = req.getParameterNames();
		while (req_enum.hasMoreElements()) {
			baseinfo.put(req_enum.nextElement(), req.getParameter(req_enum.nextElement()));
		}
		HttpSession session = req.getSession();
		Enumeration<String> session_enum = session.getAttributeNames();
		while (session_enum.hasMoreElements()) {
			String se = session_enum.nextElement();
			baseinfo.put(se, session.getAttribute(se));
		}
		baseinfo.put("pathname", req.getServletPath().substring(1));
		return baseinfo;
	}
}
