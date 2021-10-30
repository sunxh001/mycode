package service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dao.mappers;
import dao.dataconnect.GetMapper;

public class PermissionQuery implements Query{
	private List<Object> arrlist = new ArrayList<>();
	private mappers m = new GetMapper().mappers();
	@Override
	public List query(Map<String, Object> baseinfo) {
		List<Object> arrlist = m.selectpromissioninfo(baseinfo);
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
