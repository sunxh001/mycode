package middleware;

import java.util.List;
import java.util.Map;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import middleware.Service_instance;
import service.Query;

public class InitService {

	public List getResult(Map<String, Object> baseinfo) throws Exception {
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext();
		ctx.register(Service_instance.class);
		ctx.refresh();
		Service_instance si = (Service_instance) ctx.getBean("service_instance");
		return si.loadQuery(baseinfo);
	}

}
