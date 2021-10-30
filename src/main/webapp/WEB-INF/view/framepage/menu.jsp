<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.1.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="static/css/user/user.css" />
		<link rel="stylesheet" type="text/css" href="static/css/fonts/iconfont.css" />
		<!-- 分页 -->
		<link rel="stylesheet" type="text/css" href="static/css/user/pagination.css" />
		<script src="static/js/menu/menupagination.js"></script>
		<!-- 模态窗 -->
		<link rel="stylesheet" type="text/css" href="static/css/user/model_box.css" />
		<script src="static/js/user/model_box.js"></script>
	</head>
	<body>
		<!-- 内容 -->
		<div id="content">
			<div id="search">
				<label for="user_id" class="uname" data-icon="">菜单:</label>
				<input id="user_id" name="user_name" required="required" type="text"
					placeholder="请输入菜单名" />
				<label for="user_name" class="uname" data-icon="">权限:</label>
				<input id="user_name" name="user_name" required="required" type="text"
					placeholder="请输入权限" />

				<input type="button" id="searchlist" value="查询" />
			</div>
			<div id="opation-all">

				<input type="button" id="adduserlist" value="新增" class="btn btn-danger" />
				<input type="button" id="deleteall" value="删除" class="btn btn-danger" />

			</div>
			<div id="tablehead_fixed">
			<table class="" id="tablehead">
				<colgroup>
					<col width="120px">
					<col width="120px">
					<col width="120px">
					<col width="120px">
					<col width="120px">
					<col width="120px">
					<col width="80px">
					<col width="9px">
				</colgroup>
				<thead>
			
					<tr id="theadhead">
						<th>id<input type="checkbox" id="checkAll" /></th>
						<th>菜单名称</th>
						<th>查看</th>
						<th>增加</th>
						<th>修改</th>
						<th>删除</th>
						<th align="center">操作</th>
						<th> </th>
					</tr>
				</thead>
			</table>
			</div>
			<div id="tablebody_scroll">
			<table class="" id="mytable">
				<colgroup>
					<col width="120px">
					<col width="120px">
					<col width="120px">
					<col width="120px">
					<col width="120px">
					<col width="120px">
					<col width="80px">
				</colgroup>
				<tbody id="listTable">
				</tbody>
			</table>
			</div>
			<!--分页 -->
			<div id="pages"></div>
			
		</div>
		
		<script type="text/javascript">
			$(function() {
				var userlist = ${userlist};
				var ul = ${ul};
				if (ul == true) {
					Load_userlist(userlist, top_pageIndex, top_pageSize)
				}
			})
		</script>

	</body>
</html>
