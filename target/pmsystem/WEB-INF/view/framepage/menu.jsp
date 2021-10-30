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

				//Ajax用户数据，生成详情列表
				//var userlist = JSON.parse('${userlist}');
				var userlist = ${userlist};
				var ul = ${ul};
				// var top_pageSize=20;
				// var top_pageIndex;
				console.log("jiazia:" + userlist);
				if (ul == true) {
					Load_userlist(userlist, top_pageIndex, top_pageSize)
				}

				//判断条数减页
				// function load_judge(total_a,pageSize_a,pageIndex_a,arr){
				// 	var total_b=total_a-arr.length;
				// 	var total_c=(pageIndex_a-1)*pageSize_a;
				// 	if(pageIndex_a>1&&total_b==total_c){

				// 		return (pageIndex_a-2)*pageSize_a;
				// 	}else{
				// 		return (pageIndex_a-1)*pageSize_a;
				// 	}
					
				// }
				//修改
				// $(document).on('click', '.btn-info' ,function(){
					
				// 	var updateid = $(this).parent().parent().find("input[name='item']").prop("id");
					
				// 	$.ajax({
				// 		url: "http://localhost:8080/pmsystem/userinfo",
				// 		type: "post",
				// 		dataType: "json",
				// 		data: {
				// 			user_id:updateid,
				// 			flag: "queryup"
				// 		},
				// 		contentType: "application/json; charset=utf-8",
				// 		success: function(return_json_data2) {
				// 			console.log("返回数据2:" + return_json_data2.toString());
				// 			// Ajax_Pagination_query("http://localhost:8080/pmsystem/pagination",top_pageIndex,top_pageSize,"query");
				// 			//引入数据处理函数
				// 			console.log("rolename:" + return_json_data2[0][0].role_name);
				// 			console.log("username:" + return_json_data2[2][0].user_name);
				// 			// $("#checkAll").attr("checked",false);
				// 			$("input[name='user_name']").val(return_json_data2[2][0].user_name);
				// 			$("input[name='dapartment_name']").val(return_json_data2[2][0].dapartment_name);
				// 			$("input[name='role_name']").val(return_json_data2[0][0].role_name);
				// 			$("#addlist").css("display", "block");
				
				// 		}
					
				// 	});
				// });

				//单点删除,iframe使用$(document).on(）
				// $(document).on('click', '.btn-delete' ,function(){
				// 	var delete_list2 = [];
				// 	// //注意1.6之后prop与attr区别
				// 	// var delid=$(this).parent().parent().find("input")[0].getAttribute("id");
				// 	var delid = $(this).parent().parent().find("input[name='item']").prop("id");
				// 	console.log("delid");
				// 	delete_list2.push(delid);
				// 	var startLine_num=load_judge(top_total,top_pageSize,top_pageIndex,delete_list2);
				// 	$.ajax({
				// 		url: "http://localhost:8080/pmsystem/userinfo",
				// 		type: "post",
				// 		dataType: "json",
				// 		data: {
				// 			delete_list2,
				// 			currentPage: top_pageSize,
				// 			startLine: startLine_num,
				// 			flag: "delete"
				// 		},
				// 		contentType: "application/json; charset=utf-8",
				// 		success: function(return_json_data2) {
				// 			console.log("返回数据2:" + return_json_data2.toString());
				// 			// Ajax_Pagination_query("http://localhost:8080/pmsystem/pagination",top_pageIndex,top_pageSize,"query");
				// 			//引入数据处理函数
				// 			console.log("gaibian:" + top_pageSize);
				// 			Load_userlist(return_json_data2, top_pageIndex, top_pageSize);
				// 			// $("#checkAll").attr("checked",false);
				// 			$("#checkAll").prop("checked",false);
							
				// 		},
				// 		error: function(xhr, textStatus, errorThrown) {
				// 			console.log("进入error");
				// 			console.log("状态码：" + xhr
				// 				.status
				// 				); //404,500("状态:"+xhr.readyState)；当前状态,0-未初始化，1-正在载入，2-已经载入，3-数据进行交互，4-完成。
				// 			console.log("状态码的错误信息:" + xhr
				// 				.statusText
				// 				); //对应状态码的错误信息，404错误信息是not found,500是Internal Server Error
				// 			console.log("返回响应信息：" + xhr.responseText); //这里是详细的信息,服务器响应返回的文本信息。
				// 			console.log("请求状态：" +
				// 				textStatus
				// 				); //返回的状态,"timeout"（超时）, "error"（错误）, "abort"(中止), "parsererror"（解析错误），可能返回空值。 　　　　　　　　
				// 			console.log("服务器返回的错误信息:" + errorThrown); //服务器抛出返回的错误信息　　　　　　　
				// 			console.log("请求失败-end");
				// 		},
				// 		complete: function() {
				// 			console.log("AJAX请求已执行");
				// 		}
				// 	})
				// });


				// $("#checkAll").click(function() {

				// 	var status = this.checked;
				// 	var oItems = document.getElementsByName('item');
				// 	for (var i = 0; i < oItems.length; i++) {
				// 		oItems[i].checked = status;
				// 	}
				// })


				//delAll功能
				// $("#deleteall").click(function() {
				// 	var delete_list = [];
				// 	// var olistTable = document.getElementById('listTable');
				// 	var items = document.getElementsByName("item");
				// 	for (var j = 0; j < items.length; j++) {
				// 		if (items[j].checked) //如果item被选中
				// 		{
				// 			delete_list.push(items[j].id);
				// 		}
				// 	}

				// 	console.log(delete_list);
				// 	if (delete_list.length != 0) {
				// 		console.log(top_pageSize);
				// 		console.log(top_pageIndex);
				// 		// Ajax_Pagination_query("http://localhost:8080/pmsystem/pagination",top_pageIndex,top_pageSize,"delete");
				// 		var startLine_nums=load_judge(top_total,top_pageSize,top_pageIndex,delete_list)
				// 		$.ajax({
				// 			url: "http://localhost:8080/pmsystem/userinfo",
				// 			type: "post",
				// 			dataType: "json",
				// 			data: {
				// 				delete_list,
				// 				currentPage: top_pageSize,
				// 				startLine: startLine_nums,
				// 				flag: "delete"
				// 			},
				// 			contentType: "application/json; charset=utf-8",
				// 			success: function(return_json_data) {
				// 				console.log("返回数据:" + return_json_data.toString());
				// 				// Ajax_Pagination_query("http://localhost:8080/pmsystem/pagination",top_pageIndex,top_pageSize,"query");
				// 				//引入数据处理函数
				// 				Load_userlist(return_json_data, top_pageIndex, top_pageSize);
				// 				$("#checkAll").prop("checked",false);
								
				// 			},
				// 			error: function(xhr, textStatus, errorThrown) {
				// 				console.log("进入error");
				// 				console.log("状态码：" + xhr
				// 					.status
				// 					); //404,500("状态:"+xhr.readyState)；当前状态,0-未初始化，1-正在载入，2-已经载入，3-数据进行交互，4-完成。
				// 				console.log("状态码的错误信息:" + xhr
				// 					.statusText
				// 					); //对应状态码的错误信息，404错误信息是not found,500是Internal Server Error
				// 				console.log("返回响应信息：" + xhr.responseText); //这里是详细的信息,服务器响应返回的文本信息。
				// 				console.log("请求状态：" +
				// 					textStatus
				// 					); //返回的状态,"timeout"（超时）, "error"（错误）, "abort"(中止), "parsererror"（解析错误），可能返回空值。 　　　　　　　　
				// 				console.log("服务器返回的错误信息:" + errorThrown); //服务器抛出返回的错误信息　　　　　　　
				// 				console.log("请求失败-end");
				// 			},
				// 			complete: function() {
				// 				console.log("AJAX请求已执行");
				// 			}
				// 		})

				// 	}

				// })
				//end$	
			})

		</script>

	</body>
</html>
