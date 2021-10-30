package dao;

import java.util.List;
import java.util.Map;

public interface mappers {

	public int createTable_userInfo();

	public int createTable_roleInfo();

	public int createTable_user_role();

	public int createTable_promissionInfo();

	public int createTable_role_promission();

	public int createTable_menuInfo();

	public int createTable_elementInfo();

	public int insertuserInfo(Map<String, Object> bi);

	public int insertuserInfo_pl(List<UserInfo> bi);

	public int insertroleInfo(Map<String, Object> bi);

	public int insertuser_role(Map<String, Object> bi);

	public int insertpromissionInfo(Map<String, Object> bi);

	public int insertrole_promission(Map<String, Object> bi);

	public int insertmenuInfo(Map<String, Object> bi);

	public int insertelementInfo(Map<String, Object> bi);

	public List<Object> selectdata(Map<String, Object> bi);

	public List<Object> selectuser_promission(Map<String, Object> bi);

	public List<Object> selectuserinfo(Map<String, Object> bi);

	public List<Object> selectuserrole(Map<String, Object> bi);

	public List<Object> selectroleinfo(Map<String, Object> bi);

	public List<Object> selectpromissioninfo(Map<String, Object> bi);

	public List<Object> selectmenuinfo(Map<String, Object> bi);

	public List<Object> selectelementinfo(Map<String, Object> bi);

	public List<Object> selectrole_promission(Map<String, Object> bi);

	public int updateroleInfo(Map<String, Object> bi);

	public int updateuserInfo(Map<String, Object> bi);

	public int updateuser_role(Map<String, Object> bi);

	public int deleteuserInfo(List<String> bi);

	public int deleterole_promission(Map<String, Object> bi);

	public int deleteroleInfo(List<String> bi);

}
