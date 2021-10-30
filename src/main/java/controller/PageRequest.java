package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

import dao.mappers;
import dao.dataconnect.ConnectionMysql;
import middleware.InitService;
import middleware.JoinMap;
import middleware.handler.HandleData;

@Controller("PageRequest")
public class PageRequest {
	public static final Log log = LogFactory.getLog(PageRequest.class);

	// 登陆后首页
	@RequestMapping(value = "/index", method = { RequestMethod.GET, RequestMethod.POST, })
	public ModelAndView index(HttpServletRequest req, HttpServletResponse res) throws Exception {
		log.info("start");
		log.info("this is the first message");
		return new ModelAndView("/index");
	}

	@RequestMapping(value = "/iframe", method = { RequestMethod.GET, RequestMethod.POST, })
	public ModelAndView iframe(HttpServletRequest req, HttpServletResponse res) throws IOException {
		return new ModelAndView("/index/iframe");
	}

	// 登录页
	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST, })
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res) throws IOException {
		return new ModelAndView("/login");
	}

	// 角色页
	@RequestMapping(value = "/Role", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView role(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView("/framepage/role");
		Map<String, Object> baseinfo = new HandleData().handlePageRequest(req);
		baseinfo.put("startLine", 0);
		baseinfo.put("currentPage", 20);
		baseinfo.put("flag", "query");
		@SuppressWarnings("unchecked")
		List<Object> ma = (List<Object>) new InitService().getResult(baseinfo);
		if (ma != null) {
			String uas = JSON.toJSONString(ma);
			mv.addObject("userlist", uas);
			mv.addObject("ul", true);
		} else {
			mv.addObject("ul", false);
			;
		}
		return mv;
	}

	// 用户列表
	@RequestMapping(value = "/User", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView userinfo(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ModelAndView mv = new ModelAndView("/framepage/user");
		Map<String, Object> baseinfo = new HandleData().handlePageRequest(req);
		baseinfo.put("flag", "query");
		@SuppressWarnings("unchecked")
		List<Object> m = (List<Object>) new InitService().getResult(baseinfo);
		if (m != null) {
			String uas = JSON.toJSONString(m);
			mv.addObject("userlist", uas);
			mv.addObject("ul", true);
		} else {
			mv.addObject("ul", false);
			;
		}
		return mv;
	}

	// 菜单列表
	@RequestMapping(value = "/Menu", method = { RequestMethod.GET, RequestMethod.POST, })
	public ModelAndView menu(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		ModelAndView mv = new ModelAndView("/framepage/menu");
		Map<String, Object> baseinfo = new HandleData().handlePageRequest(req);
		baseinfo.put("startLine", 0);
		baseinfo.put("currentPage", 20);
		baseinfo.put("flag", "query");
		@SuppressWarnings("unchecked")
		List<Object> ma = (List<Object>) new InitService().getResult(baseinfo);
		baseinfo.put("pathname", "PermissionQuery");
		@SuppressWarnings("unchecked")
		List<Object> pa = (List<Object>) new InitService().getResult(baseinfo);
		String uas = new JoinMap(ma, pa).join();
		mv.addObject("userlist", uas);
		System.out.println(uas);
		if (uas != null) {
			mv.addObject("userlist", uas);
			mv.addObject("ul", true);
		} else {
			mv.addObject("ul", false);
			;
		}
		return mv;
	}

	// 注册---测试，需整理，添加加密，cookie、session，唯一user_id生成库
	@RequestMapping(value = "/register", method = { RequestMethod.GET, RequestMethod.POST, })
	public ModelAndView register(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		SqlSession ss = ConnectionMysql.build().openSession(true);
		mappers mp = ss.getMapper(mappers.class);
		int i = new Random().nextInt(27);
		char ran = (char) (65 + i);
		String userid = "KF" + ran + new Random().nextInt(10);
		String username = req.getParameter("username");
		String department = req.getParameter("department");
		String password = req.getParameter("password");
		Map<String, Object> md = new HashMap<>();
		md.put("user_id", userid);
		md.put("user_name", username);
		md.put("dapartment_name", department);
		md.put("password", password);
		int data = mp.insertuserInfo(md);
		Map<String, Object> mdur = new HashMap<>();
		mdur.put("user_id", md.get("id"));
		mdur.put("role_id", 1);
		int dataur = mp.insertuser_role(mdur);
		if (data == 1 & dataur == 1) {
			session.setAttribute("massage", "注册成功");
			session.setAttribute("id", md.get("id"));
			session.setAttribute("userid", md.get("user_id"));
			session.setAttribute("username", md.get("user_name"));
			res.sendRedirect("/index");
		} else {
			session.setAttribute("massage", "注册失败");
			session.setAttribute("url", "login");
			res.sendRedirect("/massage");
		}
		return new ModelAndView("/register");
	}
}