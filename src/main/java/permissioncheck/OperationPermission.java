package permissioncheck;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dao.mappers;
import dao.dataconnect.GetMapper;
import permissioncheck.init.Perinfo;
import permissioncheck.init.Transformation;

public class OperationPermission {
	private Boolean b = false;

	public Boolean state(Map<String, Object> baseinfo) {
		mappers mp = new GetMapper().mappers();
		List<Object> ur = mp.selectuser_promission(baseinfo);
		// 获取访问菜单ID----mk
		String menuname = Transformation.getMenuName((String) baseinfo.get("pathname"));
		baseinfo.put("menu_name", menuname);
		System.out.println(baseinfo);
		List<Object> menulist = mp.selectmenuinfo(baseinfo);
		List<Object> mlist = (List<Object>) menulist.get(0);
		int mk = (int) ((Map<String, Object>) mlist.get(0)).get("menu_id");
		// 获取操作元素ID----eh
		int eh = Transformation.getElementId((String) baseinfo.get("flag"));
		List allper = Perinfo.getAllPer();
		List<Object> plist = (List<Object>) allper.get(0);
		int a = 0;
		/*
		 * 权限表数据全局只查询一次
		 * 通过element_id、menu_id查询权限表pm_id----(menulist--mlist--mk,eh,allper--plist--a)
		 * 与登录账户角色中pm_id比对(ur--c)
		 */
		end: for (int i = 0; i < plist.size(); i++) {
			int k = (int) ((Map<String, Object>) plist.get(i)).get("menu_id");
			int h = (int) ((Map<String, Object>) plist.get(i)).get("element_id");
			System.out.println("k:" + k + "mk:" + mk);
			System.out.println("h:" + h + "eh:" + eh);
			if (k == mk && h == eh) {
				a = (int) ((Map<String, Object>) plist.get(i)).get("pm_id");
				for (int j = 0; j < ur.size(); j++) {
					Map<String, Object> c = (Map<String, Object>) ur.get(j);
					System.out.println("a:" + a + "c:" + c.get("pm_id"));
					if (a == (int) c.get("pm_id")) {
						b = true;
						break end;
					}
				}
			}
		}
		baseinfo.remove("menu_name");
		return b;
	}
}
