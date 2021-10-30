package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.mappers;

public class Role implements Query {

	private Collection<Object> qb = null;
	private List<Object> arrlist = new ArrayList<>();
	private mappers m = new dao.dataconnect.GetMapper().mappers();

	@Override
	public List query(Map<String, Object> query_baseinfo) {

		if (query_baseinfo.containsKey("role_name") && query_baseinfo.get("role_name").equals("allrole_name")) {
			query_baseinfo.remove("role_name");
		}
		if (query_baseinfo.containsKey("creator") && query_baseinfo.get("creator").equals("allcreator")) {
			query_baseinfo.remove("creator");
		}
		return arrlist = m.selectroleinfo(query_baseinfo);

	}

	@Override
	public List update(Map<String, Object> query_baseinfo) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = simpleDateFormat.parse((String) query_baseinfo.get("creation_time"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		query_baseinfo.put("creation_time", date);
		int up = m.updateroleInfo(query_baseinfo);

		arrlist.add(up);
		return arrlist;

	}

	@Override
	public List delete(Map<String, Object> query_baseinfo) {
		Map<String, Object> qb_m = new HashMap<String, Object>();
		qb_m.putAll(query_baseinfo);
		qb_m.remove("flag");
		qb_m.remove("startLine");
		qb_m.remove("currentPage");
		qb = qb_m.values();
		List<String> list = new ArrayList<String>();
		for (Object obj : qb) {

			list.add(obj.toString());
		}
		int dlnum = m.deleteroleInfo(list);
		arrlist = m.selectroleinfo(query_baseinfo);
		arrlist.add(dlnum);
		return arrlist;

	}

	@Override
	public List insert(Map<String, Object> query_baseinfo) {

		if (query_baseinfo.get("flag").equals("insert")) {
			query_baseinfo.remove("flag");
			int data = m.insertroleInfo(query_baseinfo);

			Map<String, Object> miur = new HashMap<>();
			miur.put("role_id", query_baseinfo.get("id"));

			arrlist = m.selectuserinfo(miur);
		}

		return arrlist;
	}

	@Override
	public List queryup(Map<String, Object> m) {
		return null;
	}
}
