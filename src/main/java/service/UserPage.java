package service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import dao.mappers;
import dao.dataconnect.GetMapper;

public class UserPage implements Query {
	private Collection<Object> qb = null;
	private List<Object> arrlist = new ArrayList<>();
	private mappers m = new GetMapper().mappers();

	@Override
	public List query(Map<String, Object> query_baseinfo) {
		return m.selectuserinfo(query_baseinfo);
	}

	@Override
	public List queryup(Map<String, Object> query_baseinfo) {
		// 查询userinfo获取id(user_id、id不是同一字段)
		List uilist = m.selectuserinfo(query_baseinfo);
		List ulss = (List) uilist.get(0);
		int userid = (int) ((Map<String, Object>) ulss.get(0)).get("id");
		// 查询user_role获取role_id
		Map<String, Object> msui = new HashMap<>();
		msui.put("user_id", userid);
		List urlist = m.selectuserrole(msui);
		// 查询roleinfo获取role_name
		List uls = (List) urlist.get(0);
		int roleid = (int) ((Map<String, Object>) uls.get(0)).get("role_id");
		Map<String, Object> msur = new HashMap<>();
		msur.put("role_id", roleid);
		List rilist = m.selectroleinfo(msur);
		rilist.add(uilist.get(0));
		rilist.add(urlist.get(0));
		return rilist;
	}

	@Override
	public List update(Map<String, Object> query_baseinfo) {
		int up = m.updateuserInfo(query_baseinfo);
		Map<String, Object> query_uu = new HashMap<String, Object>();
		query_uu.put("user_id", query_baseinfo.get("user_id"));
		List uilist = m.selectuserinfo(query_uu);
		List ulss = (List) uilist.get(0);

		int userid = (int) ((Map<String, Object>) ulss.get(0)).get("id");
		List rilist = m.selectroleinfo(query_baseinfo);
		List rlss = (List) rilist.get(0);
		int roleid = (int) ((Map<String, Object>) rlss.get(0)).get("role_id");
		query_baseinfo.put("user_id", userid);
		query_baseinfo.put("role_id", roleid);
		up += m.updateuser_role(query_baseinfo);
		arrlist.add(up);
		return arrlist;
	}

	@Override
	public List delete(Map<String, Object> query_baseinfo) {
		qb = query_baseinfo.values();
		List<String> list = new ArrayList<String>();
		for (Object obj : qb) {
			list.add(obj.toString());
		}
		int dlnum = m.deleteuserInfo(list);
		arrlist = m.selectuserinfo(query_baseinfo);
		arrlist.add(dlnum);
		return arrlist;
	}

	@Override
	public List insert(Map<String, Object> query_baseinfo) {
		int i = new Random().nextInt(27);
		char ran = (char) (65 + i);
		String auto_user_id = "KF" + ran + new Random().nextInt(10);
		query_baseinfo.put("user_id", auto_user_id);
		int data = m.insertuserInfo(query_baseinfo);
		Map<String, Object> miur = new HashMap<>();
		miur.put("user_id", query_baseinfo.get("id"));
		miur.put("role_id", 1);
		int dataur = m.insertuser_role(miur);
		if (data == 1 && dataur == 1) {
			Map<String, Object> msur = new HashMap<>();
			msur.put("id", query_baseinfo.get("id"));
			arrlist = m.selectuserinfo(msur);
		}
		return arrlist;
	}
}
