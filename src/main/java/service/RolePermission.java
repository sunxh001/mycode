package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.mappers;
import dao.dataconnect.GetMapper;
import middleware.DataOption;

public class RolePermission implements Query {
	private List<Object> arrlist = new ArrayList<>();
	private mappers m = new GetMapper().mappers();

	@Override
	public List query(Map<String, Object> query_baseinfo) {
		return arrlist = m.selectrole_promission(query_baseinfo);
	}

	public List modify(Map<String, Object> query_baseinfo) {
		List<Integer> old_list = new ArrayList<>();
		DataOption dataOption = new DataOption();
		List<Object> list = dataOption.separate(query_baseinfo, "role_id");
		arrlist = m.selectrole_promission((Map<String, Object>) list.get(0));
		List<Object> olist = (List<Object>) arrlist.get(0);
		List<Integer> new_list = (List<Integer>) list.get(1);
		for (var i = 0; i < olist.size(); i++) {
			int pid = (int) ((Map<String, Object>) olist.get(i)).get("pm_id");
			old_list.add(pid);
		}
		dataOption.updataRolePermission(new_list, old_list);
		int arp = 0;
		int drp = 0;
		if (dataOption.getAdd_per().size() != 0) {
			System.out.println("add:" + dataOption.getAdd_per());
			Map<String, Object> add_map = new HashMap<String, Object>();
			add_map.put("role_id", query_baseinfo.get("role_id"));
			for (var i = 0; i < dataOption.getAdd_per().size(); i++) {
				add_map.put("pm_id", dataOption.getAdd_per().get(i));
				arp += m.insertrole_promission(add_map);
			}
		}
		;
		if (dataOption.getDel_per().size() != 0) {
			List<Map> del_list = new ArrayList<>();
			Map<String, Object> del_map = new HashMap<String, Object>();
			del_map.put("role_id", query_baseinfo.get("role_id"));
			for (var i = 0; i < dataOption.getDel_per().size(); i++) {
				del_map.put("pm_id", dataOption.getDel_per().get(i));
				System.out.println("del_list:" + del_list);
				int d = m.deleterole_promission(del_map);
				drp += d;
			}
		}
		;
		arrlist.clear();
		arrlist.add(arp);
		arrlist.add(drp);
		return arrlist;
	}

	@Override
	public List queryup(Map<String, Object> m) {
		return null;
	}

	@Override
	public List insert(Map<String, Object> m) {
		return null;
	}

	@Override
	public List delete(Map<String, Object> m) {
		return null;
	}

	@Override
	public List update(Map<String, Object> m) {
		return null;
	}

}