package middleware;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.stereotype.Component;

import middleware.handler.JsonParse;
import service.AspectModule;
import service.Query;

@Configuration
@ComponentScan({ "service", "middleware", "permissioncheck" })
@Import({ AspectModule.class })
@Component("service_instance")
public class Service_instance {
	public List loadQuery(Map<String, Object> baseinfo) throws Exception {
		String className = (String) baseinfo.get("pathname");
		Class<?> c = Class.forName("service." + className);
		// java9÷Æ«∞”√clazz.newInstance()
		Query query = (Query) c.getDeclaredConstructor().newInstance();
		Method method = c.getMethod((String) baseinfo.get("flag"), Map.class);
		return (List) method.invoke(query, baseinfo);
	}
}
