package middleware;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;

public class JoinMap {
	private List<Object> ma;
	private List<Object> pa;

	public JoinMap(List<Object> ma, List<Object> pa) {
		this.ma = ma;
		this.pa = pa;
	}

	public String join() {

		List<Map> mam = (List<Map>) this.ma.get(0);
		List<Map> pam = (List<Map>) this.pa.get(0);

		for (int i = 0; i < mam.size(); i++) {
			List<Object> pam_a = new ArrayList<Object>();
			int k = (int) mam.get(i).get("menu_id");
			for (int j = 0; j < pam.size(); j++) {
				if (k == (int) pam.get(j).get("menu_id")) {
					pam_a.add(pam.get(j));
				}
			}
			if (pam_a != null) {
				mam.get(i).put("premission", pam_a);
			}

		}
		return JSON.toJSONString(ma);
	}

}
