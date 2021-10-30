package permissioncheck.init;

public class Transformation {
	// 菜单路径转换menu_name
	public static final String getMenuName(String path) {
		String menuname = null;
		switch (path) {
		case "UserPage":
		case "User":
			menuname = "用户管理";
			break;
		case "RolePage":
		case "RolePermission":
		case "Role":
			menuname = "角色管理";
			break;
		case "MenuPage":
		case "PermissionQuery":
		case "Menu":
			menuname = "菜单目录";
			break;
		}
		return menuname;

	}

	// flag换取element_id
	public static final int getElementId(String eleflag) {
		int ele = 0;
		switch (eleflag) {
		case "query":
			ele = ElementEnum.query.ordinal() + 1;
			break;
		case "insert":
			ele = ElementEnum.insert.ordinal() + 1;
			break;
		case "queryup":
		case "modify":
		case "updata":
			ele = ElementEnum.updata.ordinal() + 1;
			break;
		case "delete":
			ele = ElementEnum.updata.ordinal() + 1;
			break;
		}
		return ele;

	}
}
