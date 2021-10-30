<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>权限管理系统</title>
		<link rel="stylesheet" type="text/css" href="static/css/index/index.css" />
		<link rel="stylesheet" type="text/css" href="static/css/index/left-side-menu.css" />
		<link rel="stylesheet" type="text/css" href="static/css/fonts/iconfont.css" />
		<script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.1.1/jquery.min.js"></script>
		<script src="static/js/index/jquery.slimscroll.min.js"></script>
		<script src="static/js/index/left-side-menu.js"></script>	
	</head>
	<body>
		<div class="top">
			<div class="title">
				<img src="static/img/tubiao.jpg" />
				<span>权限管理系统</span>
			</div>
			<div class="top_weather">
				<span>天气---------------------------------</span>
			</div>
			<div id="userinfo" class="top_info">
				<img src="static/img/photo.jpg" />

					<span>欢迎，<%=session.getAttribute("user_name") %></span>

			</div>
			
		</div>
		<!--侧边菜单-->
		<div class="left-side-menu">
			<div class="lsm-expand-btn">
				<div class="lsm-mini-btn">
					<label>
						<input type="checkbox" checked="checked">
						<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
							<circle cx="50" cy="50" r="30" />
							<path class="line--1" d="M0 40h62c18 0 18-20-17 5L31 55" />
							<path class="line--2" d="M0 50h80" />
							<path class="line--3" d="M0 60h62c18 0 18 20-17-5L31 45" />
						</svg>
					</label>

				</div>
				<!--        <input type="text">-->

			</div>
			<div class="lsm-container">
				<div class="lsm-scroll">
					<div class="lsm-sidebar">
						<ul>
							<li class="lsm-sidebar-item">
								<a href="javascript:;">
									<i class="my-icon lsm-sidebar-icon icon_1"></i>
									<span>系统设置</span>
									<i class="my-icon lsm-sidebar-more"></i>
								</a>
								<ul>
									<li><a class="active" href="http://localhost:8080/pmsystem/user" target="content_iframe"><span>用户管理</span></a></li>
									<li><a href="http://localhost:8080/pmsystem/role" target="content_iframe"><span>角色管理</span></a></li>
									<li class="lsm-sidebar-item">
										<a href="javascript:;"><i
												class="my-icon lsm-sidebar-icon "></i><span>菜单配置</span><i
												class="my-icon lsm-sidebar-more"></i></a>
										<ul>
											<li><a href="http://localhost:8080/pmsystem/menu" target="content_iframe"><span>菜单目录</span></a></li>
										</ul>
									</li>
								
								</ul>
							</li>
							<li class="lsm-sidebar-item">
								<a href="javascript:;"><i
										class="my-icon lsm-sidebar-icon icon_2"></i><span>业务模块</span><i
										class="my-icon lsm-sidebar-more"></i></a>
								<ul>
									<li><a href="javascript:;"><span>业务1</span></a></li>
									<li><a href="javascript:;"><span>业务2</span></a></li>

								</ul>
							</li>
							<li class="lsm-sidebar-item">
								<a href="javascript:;"><i
										class="my-icon lsm-sidebar-icon icon-iconset0308"></i><span>商品管理</span><i
										class="my-icon lsm-sidebar-more"></i></a>
								<ul>
									<li><a href="javascript:;"><span>商品列表</span></a></li>
									<li><a href="javascript:;"><span>商品分类</span></a></li>
								</ul>
							</li>
							<li class="lsm-sidebar-item">
								<a href="javascript:;"><i
										class="my-icon lsm-sidebar-icon icon-chongzhi1"></i><span>支付中心</span><i
										class="my-icon lsm-sidebar-more"></i></a>
								<ul>
									<li><a href="javascript:;"><span>支付配置</span></a></li>
								</ul>
							</li>
							<li class="lsm-sidebar-item">
								<a href="javascript:;"><i
										class="my-icon lsm-sidebar-icon icon-chongzhi"></i><span>订单管理</span><i
										class="my-icon lsm-sidebar-more"></i></a>
								<ul>
									<li><a href="javascript:;"><span>购物车</span></a></li>
								</ul>
							</li>

							<li class="lsm-sidebar-item">
								<a href="javascript:;"><i
										class="my-icon lsm-sidebar-icon icon-users"></i><span>考勤管理</span><i
										class="my-icon lsm-sidebar-more"></i></a>
								<ul>
									<li><a href="javascript:;"><span>考勤列表</span></a></li>
									<li><a href="javascript:;"><span>考勤设置</span></a></li>
								</ul>
							</li>
							<li class="lsm-sidebar-item">
								<a href="javascript:;"><i
										class="my-icon lsm-sidebar-icon icon_3"></i><span>绩效管理</span><i
										class="my-icon lsm-sidebar-more"></i></a>
								<ul>
									<li><a href="javascript:;"><span>考核方案</span></a></li>
									<li><a href="javascript:;"><span>考评</span></a></li>
								</ul>
							</li>
							<li class="lsm-sidebar-item">
								<a href="javascript:;"><i
										class="my-icon lsm-sidebar-icon icon_3"></i><span>退出系统</span><i
										class="my-icon lsm-sidebar-more"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</div>

		<iframe id="content_iframe" name="content_iframe" src="http://localhost:8080/pmsystem/iframe"></iframe>
		
			<!-- 模态框 -->
			<div id="model_box_mask" class="model_box_mask"></div>
			<!-- 表单 -->

			</div>

	</body>
	<script type="text/javascript">

	</script>
</html>
