package middleware;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import middleware.handler.JsonParse;

//@GET
//@SET
public class DataOption {
	/*
	 * query_baseinfo:查询参数 baseinfo：分拆query_baseinfo生成两个map封装到LIST
	 * 
	 */
	private List<Object> baseinfo = new ArrayList<>();

	public List<Object> getBaseinfo() {
		return baseinfo;
	}

	private Map<String, Integer> role_map = new HashMap<String, Integer>();
	private List<Integer> per_map = new ArrayList<>();

	public List<Integer> getAdd_per() {
		return add_per;
	}

	public void setAdd_per(List<Integer> add_per) {
		this.add_per = add_per;
	}

	public List<Integer> getDel_per() {
		return del_per;
	}

	public void setDel_per(List<Integer> del_per) {
		this.del_per = del_per;
	}

	private List<Integer> add_per = new ArrayList<>();
	private List<Integer> del_per = new ArrayList<>();

	public List<Object> separate(Map<String, Object> query_baseinfo, String key) {

		for (Entry<String, Object> entry : query_baseinfo.entrySet()) {
			if (entry.getKey().equals(key)) {
				role_map.put(entry.getKey(), (int) entry.getValue());
			}
		}
		Map<String, Object> per_map_a = new HashMap<String, Object>();
		per_map_a.putAll(query_baseinfo);
		per_map_a.remove("flag");
		per_map_a.remove("role_id");
		per_map_a.remove("pathname");
		per_map_a.remove("state_flag");
		per_map_a.remove("current_id");
		System.out.println(per_map_a);
		JsonParse jp = new JsonParse();
		for (Entry<String, Object> entry : per_map_a.entrySet()) {
			int str = (int) entry.getValue();
			per_map.add(str);
		}

		baseinfo.add(role_map);
		baseinfo.add(per_map);
		return baseinfo;
	}

	public void updataRolePermission(List<Integer> new_per, List<Integer> old_per) {
		add_per.addAll(new_per);
		add_per.removeAll(old_per);
		del_per.addAll(old_per);
		del_per.removeAll(new_per);
	}

}
