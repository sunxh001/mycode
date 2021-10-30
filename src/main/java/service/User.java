package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;

import dao.mappers;
import dao.dataconnect.GetMapper;
import permissioncheck.OperationPermission;

@Component("user")
public class User implements Query {
	private mappers mp = new GetMapper().mappers();

	@Override
	public List<Object> query(Map<String, Object> m) {
		Map<String, Object> mu = new HashMap<String, Object>();
		mu.put("startLine", 0);
		mu.put("currentPage", 20);
		List<Object> ua = mp.selectuserinfo(mu);
		return ua;
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
