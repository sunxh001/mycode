package service;

import java.util.List;
import java.util.Map;

public interface Query {
	public List query(Map<String, Object> m);

	public List queryup(Map<String, Object> m);

	public List insert(Map<String, Object> m);

	public List delete(Map<String, Object> m);

	public List update(Map<String, Object> m);
}
