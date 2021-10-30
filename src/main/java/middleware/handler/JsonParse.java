package middleware.handler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Configuration

@Component("jsonParse")
public class JsonParse {
	private Map<String, Object> rjp = new HashMap<String, Object>();
	private Boolean isDigit_state = false;

	public Map getAjaxHandleResult(HttpServletRequest req) throws UnsupportedEncodingException {
		if (!req.getParameterMap().containsKey("flag")) {
			getJsonParse(req);
		} else {
			getFormParse(req);
		}
		rjp.put("pathname", req.getServletPath().substring(1));
		return rjp;

	}

	// json×Ö·û´®½âÎö
	private Map getJsonParse(HttpServletRequest req) throws UnsupportedEncodingException {
		StringBuilder sb = new StringBuilder();
		try (BufferedReader reader = req.getReader();) {
			char[] buff = new char[1024];
			int len;
			while ((len = reader.read(buff)) != -1) {
				sb.append(buff, 0, len);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		if (sb.toString() != null && sb.toString() != "") {
			String str = URLDecoder.decode(sb.toString(), "UTF-8");
			// JSON json = JSON.parseObject(str);
			String[] rjp_arr;
			if (str.indexOf("&") > 0) {
				rjp_arr = str.split("&");
			} else {
				String[] arr_arr = new String[1];
				arr_arr[0] = str;
				rjp_arr = arr_arr;
			}

			for (String rjp_c : rjp_arr) {
				String[] rjp_arr_c = rjp_c.split("=");
				String rjpkey = rjp_arr_c[0];
				if (!this.isDigit(rjp_arr_c[1])) {
					String rjp_value = rjp_arr_c[1];
					if (rjp.containsKey(rjpkey)) {
						rjp.put(rjpkey + rjp_value, rjp_value);
					}
					if (!rjp.containsKey(rjpkey)) {
						rjp.put(rjpkey, rjp_value);
					}
				} else {
					int rjp_value = Integer.parseInt(rjp_arr_c[1]);
					if (rjp.containsKey(rjpkey)) {
						rjp.put(rjpkey + rjp_value, rjp_value);
					}
					if (!rjp.containsKey(rjpkey)) {
						rjp.put(rjpkey, rjp_value);
					}
				}
			}

		}
		HttpSession session = req.getSession();
		rjp.put("current_id", session.getAttribute("current_id"));
		rjp.put("state_flag", session.getAttribute("state_flag"));
		return rjp;
	}

	// ÅÐ¶ÏÊý×Ö
	public Boolean isDigit(String rjp_c_c) {
		for (int i = 0; i < rjp_c_c.length(); i++) {
			if (!Character.isDigit(rjp_c_c.charAt(i))) {
				isDigit_state = false;
				break;
			} else {
				isDigit_state = true;
			}

		}
		return isDigit_state;
	}

	// ±íµ¥½âÎö
	private Map getFormParse(HttpServletRequest req) throws UnsupportedEncodingException {
		Map map = req.getParameterMap();
		java.util.Enumeration<String> enums = req.getParameterNames();
		while (enums.hasMoreElements()) {
			String paramName = (String) enums.nextElement();
			String[] values = req.getParameterValues(paramName);
			if (values.length == 1) {
				rjp.put(paramName, values[0]);
			} else {
				rjp.put(paramName + "List", values);
			}
		}
		HttpSession session = req.getSession();
		rjp.put("current_id", session.getAttribute("current_id"));
		rjp.put("state_flag", session.getAttribute("state_flag"));
		return rjp;
	}

}