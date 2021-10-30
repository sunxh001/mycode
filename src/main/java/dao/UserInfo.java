package dao;

import javax.validation.constraints.NotNull;

//≥÷æ√¿‡Bean
public class UserInfo {
	@NotNull
	private String user_id;
	private String user_name;
	private String dapartment_name;
	private String password;
	private String id;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getDapartment_name() {
		return dapartment_name;
	}

	public void setDapartment_name(String dapartment_name) {
		this.dapartment_name = dapartment_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
