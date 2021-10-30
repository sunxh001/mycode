package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSON;

import dao.mappers;
import dao.dataconnect.ConnectionMysql;
import middleware.InitService;
import middleware.JoinMap;
import middleware.handler.JsonParse;

@Controller
public class AjaxRequest {

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/UserPage", method = { RequestMethod.POST, RequestMethod.GET })
	public void userInfo(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setContentType("text/json;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new JsonParse().getAjaxHandleResult(req);
		List<Object> rolemap = (List<Object>) new InitService().getResult(map);
		PrintWriter pw = res.getWriter();
		pw.write(JSON.toJSONString(rolemap));
		pw.flush();
		pw.close();
	}

	// 角色---查询、删除、插入
	@RequestMapping(value = "/RolePage", method = { RequestMethod.POST, RequestMethod.GET })
	public void roleInfo(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setContentType("text/json;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new JsonParse().getAjaxHandleResult(req);
		List<Object> rolemap = (List<Object>) new InitService().getResult(map);
		PrintWriter pw = res.getWriter();
		pw.write(JSON.toJSONString(rolemap));
		pw.flush();
		pw.close();
	}

	// 角色权限---查询、删除、插入
	@RequestMapping(value = "/RolePermission", method = { RequestMethod.POST, RequestMethod.GET })
	public void rolepermission(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setContentType("text/json;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new JsonParse().getAjaxHandleResult(req);
		List<Object> rolemap = (List<Object>) new InitService().getResult(map);
		PrintWriter pw = res.getWriter();
		pw.write(JSON.toJSONString(rolemap));
		pw.flush();
		pw.close();
	}

	@RequestMapping(value = "/MenuPage", method = { RequestMethod.POST, RequestMethod.GET })
	public void menuInfo(HttpServletRequest req, HttpServletResponse res) throws Exception {
		res.setContentType("text/json;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		Map<String, Object> map = new JsonParse().getAjaxHandleResult(req);
		map.put("pathname", "Menu");
		List<Object> ma = (List<Object>) new InitService().getResult(map);
		map.put("pathname", "PermissionQuery");
		List<Object> pa = (List<Object>) new InitService().getResult(map);
		String uas = new JoinMap(ma, pa).join();
		System.out.println("count:" + uas.toString());
		PrintWriter pw = res.getWriter();
		pw.write(uas);
		pw.flush();
		pw.close();
	}

	// 登录验证
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/validate", method = RequestMethod.POST)
	public void validate(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		String username = req.getParameter("username");// 账号
		String password = req.getParameter("password");
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("user_id", username);
		m.put("password", password);
		SqlSession ss = ConnectionMysql.build().openSession(true);
		mappers mp = ss.getMapper(mappers.class);
		List<Object> ulist = mp.selectuserinfo(m);
		List<Map> current_user = (List<Map>) ulist.get(0);
		int unum = current_user.size();
		HttpSession session = req.getSession();
		Map<String, Object> en = (Map<String, Object>) current_user.get(0);
		int id = (int) en.get("id");
		session.setAttribute("current_id", id);
		session.setAttribute("user_name", en.get("user_name"));
		if (unum == 1) {
			session.setAttribute("state_flag", "s1234");
		}
		session.setAttribute("uvflag", unum);
		Map<String, Object> uv = new HashMap<String, Object>();
		uv.put("user_id", username);
		uv.put("uvflag", unum); // user vallidate flag: unum=1 login success;
		PrintWriter pw = res.getWriter();
		pw.write(JSON.toJSONString(uv));
		pw.flush();
		pw.close();
	}

}