<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="Pragma" content="no-catche" />
		<script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.1.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="static/css/user/user.css" />
		<link rel="stylesheet" type="text/css" href="static/css/fonts/iconfont.css" />
		<!-- 分页 -->
		<link rel="stylesheet" type="text/css" href="static/css/role/pagination.css" />
		<script src="static/js/role/rolepagination.js"></script>
		<!-- 模态窗 -->
		<link rel="stylesheet" type="text/css" href="static/css/user/model_box.css" />
		<script src="static/js/role/role_model_box.js"></script>
		<link rel="stylesheet" type="text/css" href="static/css/role/boxmenu.css" />
	</head>
	<body>
		<!-- 内容 -->
		<div id="content">
			<div id="search">
				<label for="one_search" class="uname" data-icon="">角色名称:</label>
				<input id="one_search" name="one_search" required="required" type="text" placeholder="请输入角色名" />
				<label for="two_search" class="uname" data-icon="">创建人:</label>
				<input id="two_search" name="two_search" required="required" type="text" placeholder="请输入创建人" />
				<input type="button" id="searchlist" value="查询" />
			</div>
			<div id="opation-all">

				<input type="button" id="adduserlist" value="新增角色" class="btn btn-danger" />
				<input type="button" id="deleteall" value="全部删除" class="btn btn-danger" />

			</div>
			<div id="tablehead_fixed">
				<table class="" id="tablehead">
					<colgroup>
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
							<th>选择<input type="checkbox" id="checkAll" /></th>
							<th>序号</th>
							<th>角色名称</th>
							<th>创建人</th>
							<th>创建时间</th>
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
						<col width="80px">
					</colgroup>
					<tbody id="listTable">
					</tbody>
				</table>
			</div>
			<!--分页 -->
			<div id="pages"></div>

		</div>

		<!-- 模态框 -->
		<div id="addlist" class="addlist">
			<!-- 模态框内表单 -->
			<div class="container">
				<input type="button" id="model_box_close" value="关闭">
				<section>
					<div id="container_demo">

						<div id="wrapper">

							<div id="register" class="animate form">
								<form id="register_form" action="" autocomplete="on">
									<h1> 信 息 填 写 </h1>
									<input id="flag" name="flag" required="required" type="hidden" value="insert" />
									<input type='hidden' name='role_id' value=""/>"
									<p id="p-role_name" style="position: relative;">
										<label for="role_name" class="urole_name" data-icon="u">角色名</label>
										<input id="role_name" name="role_name" required="required" type="text"
											placeholder="请输入角色名" />
										<span id="span-role_name"
											style="display:none;position: absolute;top: 0%;right: 0%;padding: 0px;margin: 0px;border-width: 0px;color: darkred;"></span>
									</p>

									<p id="p-creator" style="position: relative;">
										<label for="creator" class="youdepartment" data-icon="e">创建人</label>
										<input id="creator" name="creator" required="required" type="text"
											placeholder="" />
										<span id="span-creator"
											style="display:none;position: absolute;top: 0%;left: 70%;padding: 0px;margin: 0px;border-width: 0px;color: darkred;"></span>
									</p>

									<p id="p-creation_time" style="position: relative;">
										<label for="creation_time" class="youcreation_time" data-icon="r">创建时间</label>
										<input id="creation_time" name="creation_time"  type="date"
											 placeholder="" />
										<span id="span-creation_time"
											style="display:none;position: absolute;top: 0%;left: 70%;padding: 0px;margin: 0px;border-width: 0px;color: darkred;"></span>
									</p>

									<p class="signin button">
										<input id="registersubmit" type="button" value="确认" disabled="disabled" />
									</p>
								</form>
							</div>
						</div>

					</div>
				</section>

			</div>


		</div>
		<div class="select_box"
			style="display:none;position: absolute;top: 20%;left: 20%;width: 60%;height: 70%;background: rgb(127, 127, 127,0.8);overflow: hidden;">
			<div class='lists'></div>
			<div class='options' style="position: absolute;top: 5%;right: 10%;background: rgb(0, 255, 0);">
				<input type="button" name="submit_permission" id="submit_permission" value="提交" />
				<input type="button" name="close_permission" id="close_permission" value="关闭" />
			</div>
		</div>
		<script type="text/javascript">
			//禁用表单重新提交
			window.history.replaceState(null, null, window.location.href);
			$(function() {

				//Ajax用户数据，生成详情列表
				//var userlist = JSON.parse('${userlist}');
				var username= "${user_name}";
				console.log(username)
				var userlist = ${userlist};
				var ul = ${ul};
				console.log("jiazia:" + userlist);
				if (ul == true) {
					Load_userlist(userlist, top_pageIndex, top_pageSize)
				}
				/*
				 *ajaxrequired:ajax查询load_Type,args
				 *load_Type:路径
				 * args:查询数据json格式传后台
				 * 查询flag: "query"
				 */
				function ajaxrequired(load_Type, args) {
					var return_data;
					$.ajax({
						url: "http://localhost:8080/pmsystem/" + load_Type,
						type: "post",
						async: false,
						dataType: "json",
						data: args,
						contentType: "application/json; charset=utf-8",
						success: function(return_json_data) {
							console.log("返回数据2:" + return_json_data.toString());
							return_data = return_json_data;
						}
					});
					console.log("ajax返回：" + typeof return_data);
					return return_data;
				}
				//树状菜单ajax数据处理menudatalist、childlist
				function childlist(menudata, obj, child) {
					// arr_menu[i]['child']=[];
					var child_index = obj.indexOf(child);
					obj[child_index].child = [];
					console.log(obj[child_index]);
					for (j in menudata) {
						if (menudata[j].parent == obj[child_index].menu_name) {

							obj[child_index].child.push(menudata[j]);

							arguments.callee(menudata, obj[child_index].child, menudata[j]);
						}
					}
				}
				function menudatalist(menudata) {
					var arr_menu = [];
					for (var i = 0; i < menudata.length; i++) {
						if (menudata[i].parent == "top") {

							arr_menu.push(menudata[i]);
							// menudata[0].splice(i,1);
							childlist(menudata, arr_menu, menudata[i]);
						}
					}
					return arr_menu;
				}
				//权限树状菜单加载,同级菜单数量限制20以内
				function treemenu(data,rparrs) {
					var j=1;
					var arr = {};
					//对应elementinfo表元素类型
					var elements = ["查看", "新增", "修改", "删除"];
					var tree = (function(data,j) {
						// function tree(data,j){
						j++;
						arr["oul" + j] = document.createElement('ul');
						arr["oul" + j].className = "l_tree";
						for (var i = 0; i < data.length; i++) {
							arr["oli" + j + i] = document.createElement('li');
							arr["oli" + j + i].className = "l_tree_branch";
							arr["ospan" + j + i] = document.createElement('span');
							var text = document.createTextNode("-");
							arr["ospan" + j + i].appendChild(text);
							// arr["ospan"+j+i].innerHTML("-");
							arr["oli" + j + i].appendChild(arr["ospan" + j + i]);
							var text2 = document.createTextNode(data[i].menu_name);
							arr["oli" + j + i].appendChild(text2);
							//权限元素加载
							if (data[i].premission) {
								arr["ouls" + j + i] = document.createElement('ul');
								arr["ouls" + j + i].className = "l_tree";
								for (var k = 0; k < data[i].premission.length; k++) {
									arr["olis" + j + k] = document.createElement('li');
									arr["olis" + j + k].className = "l_tree_branch_child";
									arr["oinput2" + j + k] = document.createElement('input');
									arr["oinput2" + j + k].setAttribute('id', data[i].premission[k].pm_id);
									arr["oinput2" + j + k].setAttribute('type', 'checkbox');
									arr["oinput2" + j + k].setAttribute('name', 'p_name_item');
														// console.log(rparr_a);
									for(rr in rparrs){
										if(rparr[rr]==data[i].premission[k].pm_id){
											arr["oinput2" + j + k].setAttribute('checked', 'true');
										}
									}
									arr["olis" + j + k].appendChild(arr["oinput2" + j + k]);
									var text3 = document.createTextNode(elements[data[i].premission[k]
										.element_id - 1]);
									arr["olis" + j + k].appendChild(text3);
									// arr["olis"+j+k].innerHTML(data[i].premission[j].element_id);
									arr["ouls" + j + i].appendChild(arr["olis" + j + k]);
								}
								arr["oli" + j + i].appendChild(arr["ouls" + j + i]);
							}
							if (data[i].child.length != 0) {
								arr["oli" + j + i].appendChild(arguments.callee(data[i].child, 20 * j));
							}
							arr["oul" + j].appendChild(arr["oli" + j + i]);

						}

						return arr["oul" + j];
					})(data,1);
					return tree;
				}
				// 权限修改----树状菜单事件绑定
				$(document).on('click', '.lists ul li', function(event) {
					// $(".lists ul li").click(function(event){
					event.stopPropagation(); //阻止事件冒泡
					if ($(this).find("ul").is(":visible")) {
						//隐藏
						$(this).find("ul").hide();
						$(this).find("span").text("+");
					} else {
						//显示
						$(this).find("ul").show();
						$(this).find("span").text("-");
					}
				});
				//角色权限明细加载
				var role_id,datamenu,rparr=[];
				
				$(document).on('click', '.btn-permission', function() {
					//角色ID
					role_id = $(this).parent().parent().find("input[name='item']").prop("id");
					datamenu = ajaxrequired("menuinfo", {
						flag: "query"
					});
					var r_per_a = ajaxrequired("rolepermission", {
						flag: "query",
						role_id:role_id
					});
					var r_per=Object.values(r_per_a[0]);
					for(r in r_per){
						rparr.push(r_per[r].pm_id);
					}
					$(".lists").html(treemenu(menudatalist(Object.values(datamenu)[0]),rparr));
					$(".select_box").css("display", "block");
				});
				//权限修改提交
				$(document).on('click', '#submit_permission', function() {
					var permission_id_arr=[];
					$("input[name='p_name_item']").each(function(){
						console.log($(this).prop("checked"));
						if($(this).prop("checked")==true){
							permission_id_arr.push(parseInt($(this).prop("id")));
						}
					});
					if(JSON.stringify(rparr)!=(JSON.stringify(permission_id_arr))){
						var del_rp=ajaxrequired("rolepermission", {flag:"modify",modify_list:permission_id_arr,role_id:role_id});
						var r_per_a = ajaxrequired("rolepermission", {
							flag: "query",
							role_id:role_id
						});
						var r_per=Object.values(r_per_a[0]);
						rparr=[];//rparr.length=0;
						for(r in r_per){
							rparr.push(r_per[r].pm_id);
						}
						console.log(rparr);
						$(".lists").html(treemenu(menudatalist(Object.values(datamenu)[0]),rparr));
	
						
					}else{
						console.log("权限状态未改变!!!");	
					}
				});
				//权限修改关闭
				$(document).on('click', '#close_permission', function() {
				
					$(".select_box").css("display", "none");
				});
				
				function loadSelectbox(json_data) {
					console.log("返回数据2:" + return_json_data.toString());
					// Ajax_Pagination_query("http://localhost:8080/pmsystem/pagination",top_pageIndex,top_pageSize,"query");
					//引入数据处理函数
					console.log("rolename:" + return_json_data[0][0].role_name);
					$(".select_box").empty();
					for (var i = 0; i < return_json_data[0].length; i++) {
						console.log($("#rolesignup").val());
						if ($("#rolesignup").val() == return_json_data[0][i].role_name) {
							$(".select_box").append(
								"<input type='radio' name='select_role' checked='checked' data-index=" +
								return_json_data[0][i].role_name + " class='select_box_role'/>" + return_json_data[0]
								[i].role_name);
						} else {
							$(".select_box").append("<input type='radio' name='select_role' data-index=" +
								return_json_data[0][i].role_name + " class='select_box_role'/>" + return_json_data[0]
								[i].role_name);
						}
					}
					$("input[name='select_role']").change(function() {
						console.log(this.checked);
						if (this.checked) {
							console.log(this.dataset.index);
							$("#rolesignup").val(this.dataset.index);
						}

					});


				}

				//新增弹框显示
				var ui_flag=0;//insert or update flag:1--insert,2--update
				$("#adduserlist").click(function() {
					ui_flag=1;
					console.log("fdgsdfg");
					$("#creator").val(username);
					$("#addlist").css("display", "block");
				});
				//判断条数减页
				function load_judge(total_a, pageSize_a, pageIndex_a, arr) {
					var total_b = total_a - arr.length;
					var total_c = (pageIndex_a - 1) * pageSize_a;
					if (pageIndex_a > 1 && total_b == total_c) {

						return (pageIndex_a - 2) * pageSize_a;
					} else {
						return (pageIndex_a - 1) * pageSize_a;
					}

				}
				//角色修改----数据加载
				var updateid;
				$(document).on('click', '.btn-info', function() {
					ui_flag=2;
					updateid = $(this).parent().parent().find("input[name='item']").prop("id");
					console.log("updateid: "+updateid);

					$.ajax({
						url: "http://localhost:8080/pmsystem/roleinfo",
						type: "post",
						dataType: "json",
						data: {
							role_id: updateid,
							flag: "query"
						},
						contentType: "application/json; charset=utf-8",
						success: function(return_json_data2) {
							console.log("返回数据2:" + return_json_data2.toString());
							// Ajax_Pagination_query("http://localhost:8080/pmsystem/pagination",top_pageIndex,top_pageSize,"query");
							//引入数据处理函数
							console.log("rolename:" + return_json_data2[0][0].role_name);
							// $("#checkAll").attr("checked",false);
							$("input[name='role_name']").val(return_json_data2[0][0].role_name);
							$("input[name='creator']").val(return_json_data2[0][0].creator);
							$("input[name='creation_time']").val(return_json_data2[0][0]
								.creation_time);
							$("#addlist").css("display", "block");
						}

					});
				});
				//角色修改数据提交
				$("#registersubmit").click(function() {
					if(ui_flag==1){
					$("#flag").val("insert");
					}
					if(ui_flag==2){
					$("#flag").val("update");
					$("input[name='role_id']").val(updateid);
					console.log(updateid);
					console.log($("#flag").val());
					}
					
					var formdata = new FormData($("#register_form").get(0));
					$.ajax({
						type: "POST",
						url: "http://localhost:8080/pmsystem/roleinfo", //绝对路径
						// contentType : "application/json; charset=utf-8",
						dataType: "json",
						data: formdata,
						processData: false,
						contentType: false,
						success: function(datas) {
							$("#model_box_mask").css("display","none");
							$(".addlist").css("display","none");
							Ajax_Pagination_query("http://localhost:8080/pmsystem/roleinfo",1, top_pageSize,"query");
							$("#register_form").get(0).reset();
							$("#input[name='role_id']").val("");
						},
						error: function(e) {
							console.log(e.responseText);
						}
				
					});
					// postt提交也可以
				// $.post("http://localhost:8080/pmsystem/validate",{username:"123sgsdgs",password:"fdgsfg"},function(data) {console.log(data);},"json")
				});
				

				//单点删除,iframe使用$(document).on(）
				$(document).on('click', '.btn-delete', function() {
					var delete_list = [];
					// //注意1.6之后prop与attr区别
					// var delid=$(this).parent().parent().find("input")[0].getAttribute("id");
					var delid = $(this).parent().parent().find("input[name='item']").prop("id");
					console.log("delid");
					delete_list.push(delid);
					var startLine_num = load_judge(top_total, top_pageSize, top_pageIndex, delete_list);
					$.ajax({
						url: "http://localhost:8080/pmsystem/roleinfo",
						type: "post",
						dataType: "json",
						data: {
							delete_list:delete_list,
							currentPage: top_pageSize,
							startLine: startLine_num,
							flag: "delete"
						},
						contentType: "application/json; charset=utf-8",
						success: function(return_json_data2) {
							console.log("返回数据2:" + return_json_data2.toString());
							// Ajax_Pagination_query("http://localhost:8080/pmsystem/pagination",top_pageIndex,top_pageSize,"query");
							//引入数据处理函数
							console.log("gaibian:" + top_pageSize);
							Load_userlist(return_json_data2, top_pageIndex, top_pageSize);
							// $("#checkAll").attr("checked",false);
							$("#checkAll").prop("checked", false);

						},
						error: function(xhr, textStatus, errorThrown) {
							console.log("进入error");
							console.log("状态码：" + xhr
								.status
							); //404,500("状态:"+xhr.readyState)；当前状态,0-未初始化，1-正在载入，2-已经载入，3-数据进行交互，4-完成。
							console.log("状态码的错误信息:" + xhr
								.statusText
							); //对应状态码的错误信息，404错误信息是not found,500是Internal Server Error
							console.log("返回响应信息：" + xhr.responseText); //这里是详细的信息,服务器响应返回的文本信息。
							console.log("请求状态：" +
								textStatus
							); //返回的状态,"timeout"（超时）, "error"（错误）, "abort"(中止), "parsererror"（解析错误），可能返回空值。 　　　　　　　　
							console.log("服务器返回的错误信息:" + errorThrown); //服务器抛出返回的错误信息　　　　　　　
							console.log("请求失败-end");
						},
						complete: function() {
							console.log("AJAX请求已执行");
						}
					})
				});


				$("#checkAll").click(function() {
					var status = this.checked;
					var oItems = document.getElementsByName('item');
					for (var i = 0; i < oItems.length; i++) {
						oItems[i].checked = status;
					}
				})


				//delAll功能
				$("#deleteall").click(function() {
					var delete_list = [];
					// var olistTable = document.getElementById('listTable');
					var items = document.getElementsByName("item");
					for (var j = 0; j < items.length; j++) {
						if (items[j].checked) //如果item被选中
						{
							delete_list.push(items[j].id);
						}
					}

					console.log(delete_list);
					if (delete_list.length != 0) {
						console.log(top_pageSize);
						console.log(top_pageIndex);
						// Ajax_Pagination_query("http://localhost:8080/pmsystem/pagination",top_pageIndex,top_pageSize,"delete");
						var startLine_nums = load_judge(top_total, top_pageSize, top_pageIndex, delete_list)
						$.ajax({
							url: "http://localhost:8080/pmsystem/roleinfo",
							type: "post",
							dataType: "json",
							data: {
								delete_list,
								currentPage: top_pageSize,
								startLine: startLine_nums,
								flag: "delete"
							},
							contentType: "application/json; charset=utf-8",
							success: function(return_json_data) {
								console.log("返回数据:" + return_json_data.toString());
								// Ajax_Pagination_query("http://localhost:8080/pmsystem/pagination",top_pageIndex,top_pageSize,"query");
								//引入数据处理函数
								Load_userlist(return_json_data, top_pageIndex, top_pageSize);
								$("#checkAll").prop("checked", false);

							},
							error: function(xhr, textStatus, errorThrown) {
								console.log("进入error");
								console.log("状态码：" + xhr
									.status
								); //404,500("状态:"+xhr.readyState)；当前状态,0-未初始化，1-正在载入，2-已经载入，3-数据进行交互，4-完成。
								console.log("状态码的错误信息:" + xhr
									.statusText
								); //对应状态码的错误信息，404错误信息是not found,500是Internal Server Error
								console.log("返回响应信息：" + xhr.responseText); //这里是详细的信息,服务器响应返回的文本信息。
								console.log("请求状态：" +
									textStatus
								); //返回的状态,"timeout"（超时）, "error"（错误）, "abort"(中止), "parsererror"（解析错误），可能返回空值。 　　　　　　　　
								console.log("服务器返回的错误信息:" + errorThrown); //服务器抛出返回的错误信息　　　　　　　
								console.log("请求失败-end");
							},
							complete: function() {
								console.log("AJAX请求已执行");
							}
						})

					}

				})
				//查询
				$(document).on('click', '#searchlist', function() {
					var role_name=$("input[name='one_search']").val().trim();
					var creator=$("input[name='two_search']").val().trim();
					if(role_name.length==0){
						role_name="allrole_name";
					}  
					if(creator.length==0){
						creator="allcreator";
					}
					console.log("role_name:"+role_name+"creator"+creator);
					$.ajax({
						url: "http://localhost:8080/pmsystem/roleinfo",
						type: "post",
						dataType: "json",
						data:{
							role_name:role_name,
							creator: creator,
							startLine: 0,
							currentPage: top_pageSize,
							flag: "query",
							},
						contentType: "application/json; charset=utf-8",
						success: function(return_json_data2) {
							console.log("返回数据2:" + return_json_data2.toString());
							// Ajax_Pagination_query("http://localhost:8080/pmsystem/pagination",top_pageIndex,top_pageSize,"query");
							//引入数据处理函数
							console.log("gaibian:" + top_pageSize);
							Load_userlist(return_json_data2, 1, top_pageSize);
							// $("#checkAll").attr("checked",false);
							$("#checkAll").prop("checked", false);
				
						},
						error: function(xhr, textStatus, errorThrown) {
							console.log("进入error");
							console.log("状态码：" + xhr
								.status
							); //404,500("状态:"+xhr.readyState)；当前状态,0-未初始化，1-正在载入，2-已经载入，3-数据进行交互，4-完成。
							console.log("状态码的错误信息:" + xhr
								.statusText
							); //对应状态码的错误信息，404错误信息是not found,500是Internal Server Error
							console.log("返回响应信息：" + xhr.responseText); //这里是详细的信息,服务器响应返回的文本信息。
							console.log("请求状态：" +
								textStatus
							); //返回的状态,"timeout"（超时）, "error"（错误）, "abort"(中止), "parsererror"（解析错误），可能返回空值。 　　　　　　　　
							console.log("服务器返回的错误信息:" + errorThrown); //服务器抛出返回的错误信息　　　　　　　
							console.log("请求失败-end");
						},
						complete: function() {
							console.log("AJAX请求已执行");
						}
					})
				});


				//end$	
			})
		</script>

	</body>
</html>
