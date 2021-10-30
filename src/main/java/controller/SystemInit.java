package controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.mappers;
import dao.dataconnect.ConnectionMysql;

@Controller("SystemInit")
public class SystemInit {

	// 创建数据表
	@RequestMapping(value = "/create", method = { RequestMethod.GET, RequestMethod.POST, })
	public ModelAndView create(HttpServletRequest req, HttpServletResponse res) throws IOException {
		ModelAndView mv = new ModelAndView("/index");
		SqlSession ss = ConnectionMysql.build().openSession(true);
		mappers mp = ss.getMapper(mappers.class);
		// 数据表创建
		int userInfo = mp.createTable_userInfo();
		int roleInfo = mp.createTable_roleInfo();
		int user_role = mp.createTable_user_role();
		int promissionInfo = mp.createTable_promissionInfo();
		int role_promission = mp.createTable_role_promission();
		int menuInfo = mp.createTable_menuInfo();
		int elementInfo = mp.createTable_elementInfo();
		return mv;
	}

	@RequestMapping(value = "/insert", method = { RequestMethod.POST })
	public void insert(HttpServletRequest req, HttpServletResponse res) throws IOException {
		SqlSession ss = ConnectionMysql.build().openSession(true);
		mappers mp = ss.getMapper(mappers.class);
		Map<String, Object> md = new HashMap<>();
		md.put("menu_name", "userlist");
		md.put("parent", "top");
		int data = mp.insertmenuInfo(md);
		Map<String, Object> mdp = new HashMap<>();
		mdp.put("item_id", md.get("id"));
		mdp.put("type", "menu");
		int datap = mp.insertpromissionInfo(mdp);
		Map<String, Object> mdr = new HashMap<>();
		mdr.put("role_name", "admin");
		mdr.put("creator", "admin");
		Date date = new Date();
		mdr.put("creation_time", date);
		int datar = mp.insertroleInfo(mdr);
		Map<String, Object> mdrp = new HashMap<>();
		mdrp.put("pm_id", 1);
		mdrp.put("role_id", mdr.get("id"));
		int datarp = mp.insertrole_promission(mdrp);
	}
}