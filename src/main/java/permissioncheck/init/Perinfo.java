package permissioncheck.init;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.mappers;
import dao.dataconnect.GetMapper;

public class Perinfo {
	private List<Object> arrlist = new ArrayList<>();
	private static mappers m = new GetMapper().mappers();

	public static final List getAllPer() {
		Map<String, Object> map = new HashMap<String, Object>();
		return m.selectpromissioninfo(map);
	}

}
