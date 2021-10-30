<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="Login and Registration " />
		<meta name="keywords" content="permission,system" />
		<meta name="author" content="sunxh" />
		<title>权限管理系统</title>
		<!--前端新世界HTML5CSS3可切换注册登录表单 -->
		<link rel="stylesheet" type="text/css" href="static/css/animate-custom.css" />
		<link rel="stylesheet" type="text/css" href="static/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="static/css/style-login.css" />
		<script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.1.1/jquery.min.js"></script>
		<script src="static/js/form-login.js"></script>

	</head>
	<body>

		<!-- 表单 -->
		<div class="container" style="opacity: 0.8;position: absolute;top: 100px;left:0px;z-index: 5;">
			<section>
				<div id="container_demo">

					<!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
					<a class="hiddenanchor" id="toregister"></a>
					<a class="hiddenanchor" id="tologin"></a>
					<div id="wrapper">

						<div id="login" class="animate form">
							<form id="login_form" name="login_form" action="http://localhost:8080/pmsystem/index" method="post"  autocomplete="on">
								<h1>Log in</h1>
								<p style="position: relative;">
									<label for="username" class="uname" data-icon="u"> 用户名 </label>
									<input id="username" name="username" required="required" type="text"
										placeholder="请输入用户名" />
									
								</p>
								<p>
									<label for="password" class="youpasswd" data-icon="p"> 密码 </label>
									<input id="password" name="password" required="required" type="password"
										placeholder="请输入密码" />
								</p>
								<p class="keeplogin" style="position: relative;">
									<input type="checkbox" name="loginkeeping" id="loginkeeping" value="loginkeeping" />
									<label for="loginkeeping">保持登录</label>
									<span id="login-validate" style="display:none;position: absolute;top: 0%;right: 0%;padding: 0px;margin: 0px;border-width: 0px;color: darkred;"></span>
								</p>


								<p class="login button">
									<input id="loginsubmit" type="button" value="登录" />
								</p>
								<p class="change_link">
									没有账号 ?
									<a href="#toregister" class="to_register">注册</a>
									忘记密码 ?
									<a href="#toregister" class="to_register">联系客服</a>
								</p>
							</form>
						</div>

						<div id="register" class="animate form">
							<form action="${pageContext.request.contextPath}/register" autocomplete="on">
								<h1> Sign up </h1>
								<p id="p-usernamesignup" style="position: relative;">
									<label for="usernamesignup" class="uname" data-icon="u">用户名</label>
									<input id="usernamesignup" name="username" required="required" type="text"
										placeholder="请输入用户名" />
									<span id="span-usernamesignup"
										style="display:none;position: absolute;top: 0%;right: 0%;padding: 0px;margin: 0px;border-width: 0px;color: darkred;"></span>
								</p>

								<p id="p-departmentsignup" style="position: relative;">
									<label for="emailsignup" class="youmail" data-icon="e">部门</label>
									<input id="departmentsignup" name="department" required="required" type="text"
										placeholder="请输入部门名称" />
									<span id="span-departmentsignup"
										style="display:none;position: absolute;top: 0%;left: 70%;padding: 0px;margin: 0px;border-width: 0px;color: darkred;"></span>
								</p>

								<p id="p-passwordsignup" style="position: relative;">
									<label for="passwordsignup" class="youpasswd" data-icon="p">密码</label>
									<input id="passwordsignup" name="password" required="required" type="password"
										placeholder="请输入密码" />
									<span id="span-passwordsignup"
										style="display:none;position: absolute;top: 0%;left: 70%;padding: 0px;margin: 0px;border-width: 0px;color: darkred;"></span>
								</p>

								<p id="p-passwordsignup_confirm" style="position: relative;">
									<label for="passwordsignup_confirm" class="youpasswd" data-icon="p">确认密码</label>
									<input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required"
										type="password" placeholder="请确认密码" />
									<span id="span-passwordsignup_confirm"
										style="display:none;position: absolute;top: 0%;left: 70%;padding: 0px;margin: 0px;border-width: 0px;color: darkred;"></span>
								</p>

								<p class="signin button">
									<input id="registersubmit" type="submit" value="注册" disabled="disabled" />
								</p>
								<p class="change_link">
									已有帐号 ?
									<a href="#tologin" class="to_register"> 登录 </a>
								</p>
							</form>
						</div>

					</div>

				</div>
			</section>

		</div>

	</body>
</html>
