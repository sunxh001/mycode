package service;

import java.util.Map;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import permissioncheck.OperationPermission;

@Configuration
@EnableAspectJAutoProxy
@Aspect
public class AspectModule {
	private int a = 1;
	private int b = 1;

	@Pointcut("execution(* middleware.Service_instance.*(..))")
	private void myPointCut() {
	}

	@Around("myPointCut()")
	public Object aroundAdvice(ProceedingJoinPoint jp) throws Throwable {
		Object si = null;
		System.out.println("around1·½·¨:" + b++);
		Object[] obj = jp.getArgs();
		if (new OperationPermission().state((Map<String, Object>) obj[0])) {
			si = jp.proceed();
		} else {
			System.out.println("lanjie---------------------------------------------------");
		}
		return si;
	}
}
