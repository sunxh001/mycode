package permissioncheck.init;

public class Transformation {
	// �˵�·��ת��menu_name
	public static final String getMenuName(String path) {
		String menuname = null;
		switch (path) {
		case "UserPage":
		case "User":
			menuname = "�û�����";
			break;
		case "RolePage":
		case "RolePermission":
		case "Role":
			menuname = "��ɫ����";
			break;
		case "MenuPage":
		case "PermissionQuery":
		case "Menu":
			menuname = "�˵�Ŀ¼";
			break;
		}
		return menuname;

	}

	// flag��ȡelement_id
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
