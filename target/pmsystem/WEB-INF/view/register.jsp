<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>注册DEMO演示</title>

<!-- <script type="text/javascript" src="static/js/jquery-1.8.3.min.js"></script> -->
<script src="https://s3.pstatp.com/cdn/expire-1-M/jquery/3.1.1/jquery.min.js"></script>

<style type="text/css">
*{font-family:"微软雅黑","黑体","宋体";color:#333;}
a{color:#069;}
body{margin:0;padding:0;background:#ddd;}
.form-bak{width:800px;height:400px;margin:40px auto;background:#eee;border-radius:10px;box-shadow:0 2px 8px #999;}
.left{float:left;width:500px;height:400px;}
.line{width:100%;height:80px;margin:16px 0 0 0;}
.info{float:left;height:100%;width:200px;}
.info strong, .info span{display:block;text-align:right;}
.info strong{font-size:24px;line-height:36px;margin-top:10px;color:#333;}
.info span{font-size:12px;line-height:24px;color:#666;font-family:"微软雅黑","宋体";}
.input input{background:none;border:none;outline:none;font-size:18px;line-height:40px;height:40px;width:240px;padding:9px 0 9px 9px;border-radius:10px;}
.input{float:right;width:278px;height:58px;background:#f6f6f6;border:1px solid #999;border-radius:10px;box-shadow:inset 0 2px 5px #999;margin:10px 0;position:relative;}
.error,.corect{height:20px;width:20px;position:absolute;top:19px;right:9px;}
.error span{display:block;position:absolute;top:30px;right:20px;background:#fcc;border:1px solid #f33;font-size:12px;line-height:16px;color:#600;padding:6px 10px 4px 10px;border-radius:5px;opacity:.8;white-space:nowrap;overflow:hidden;}
.corect{background-position:0 0;}
.none{display:none;}
.right{float:right;width:260px;height:360px;margin:20px 0 0 0;border-left:1px solid #ccc;}
input[type=submit]{background:none;border:none;outline:none;margin:0;padding:0;cursor:pointer;
font-size:40px;height:200px;width:200px;background:#369;margin:20px 30px 0 30px;color:#eee;}
input[type=submit]:disabled{background:#999;cursor:no-drop;}
.right div{margin:0 30px;width:200px;height:30px;line-height:30px;text-align:center;}
.readagreement-wrap{margin:20px 30px!important;outline:1px solid #f99;}

#top h1{font-size:30px;line-height:40px;padding:10px;text-align:center;}
.agreement,#top{width:800px;margin:20px auto;background:#eee;border-radius:10px;box-shadow:0 2px 8px #999;text-align:center;}
.agreement h1{display:block;font-size:24px;line-height:30px;padding:20px 20px 10px 20px;margin:0;color:#333;text-align:center;}
.agreement iframe{width:760px;min-height:400px;margin:0 20px 20px 20px;border:none;outline:none;}
.agreement .backtotop{display:block;line-height:20px;padding:10px;text-align:center;}
#menu{height: 100px;width: 100%;background-color: bisque;}


</style>

</head>
<body>
<div id="topmenu"></div>

<div id="top"><h1>用户注册</h1></div>

<div class="form-bak">
	<form method="post" action="${pageContext.request.contextPath}/massage" onsubmit="adaptValue();">
		<div class="left">
			<div class="line" id="line_department">
				<div class="info">
					<strong>部门</strong>
					<span class="tips">选择归属部门</span>
				</div>
				<div class="input">
					<input type="text" name="department" id="department" onblur="v_department();" onkeyup="v_department();" value="开发部"/>
					<div class="none"><span></span></div>
				</div>
			</div>
			
			
			<input type="hidden" name="userid" id="userid"  value="K130"/>
				
			
			
			<div class="line" id="line_name">
				<div class="info">
					<strong>用户名</strong>
					<span class="tips">只能由数字、文字或下划线组成<br />最多20个字符</span>
				</div>
				<div class="input">
					<input type="text" name="name" id="name" onblur="v_name();" onkeyup="v_name();" />
					<div class="none"><span></span></div>
				</div>
			</div>
			
			<div class="line" id="line_password">
				<div class="info">
					<strong>密码</strong>
					<span class="tips">6至16个字符</span>
				</div>
				<div class="input">
					<input type="password" name="password" id="password" onblur="v_password();" onkeyup="v_password();" />
					<div class="none"><span></span></div>
				</div>
			</div>
			
			<div class="line" id="line_repeat">
				<div class="info">
					<strong>确认密码</strong>
					<span class="tips">再次输入密码</span>
				</div>
				<div class="input">
					<input type="password" name="repeat" id="repeat" onblur="v_repeat();" onkeyup="v_repeat();" />
					<div class="none"><span></span></div>
				</div>
			</div>
		</div>
		
		<div class="right">
			<input type="submit" id="submit" value="完成注册" disabled="disabled"/>
			<div class="readagreement-wrap" onclick="onReadAgreementClick();">
				<input type="checkbox" name="agree" id="agree" onchange="v_submitbutton();" />
				同意《<a id="readagreement" href="#agreement" onclick="showAgreement();" title="查看用户使用协议">用户使用协议</a>》
			</div>
			<div>已经拥有账号，<a href="/login">直接登录</a></div>
			<div>忘记密码，<a href="#">请联系管理员</a></div>
		</div>
	</form>
</div>

<div id="agreement" class="agreement" style="display:none;">
	<h1>用户使用协议</h1>
	<iframe src=""></iframe>
	<input type="button" value="同意" onclick="agree();"/>
	<a href="#" class="backtotop" >返回顶部</a>
</div>

<script type="text/javascript">
// 提交按钮判断
function enableSubmit(bool){
	if(bool){$("input[type='submit']").removeAttr("disabled");}
	else {$("#submit").attr("disabled","disabled");}
}

function v_submitbutton(){
	if(!$("input[type='checkbox']").is(':checked')) {
		 console.log($("input[type='checkbox']").is(':checked'));
		enableSubmit(false);
		$(".readagreement-wrap").css("outline","1px solid #f99");
		return;
	}else{
		 console.log($("input[type='checkbox']").is(':checked'));
		$(".readagreement-wrap").css("outline","1px solid #9f9");
	}
	for(f in flags) {
		if(!flags[f]) {
		enableSubmit(false); 
		console.log("false的:"+flags);
		return;
		}
	}
	console.log("true的:"+flags);	
	enableSubmit(true);
}
//用户协议判断
function showAgreement(){
	$("#readagreement").removeAttr("onclick");
	$("#agreement").show();
	// $("#agreement iframe").attr("src","http://www.17sucai.com/help");//此处为链接地址
}

function agree(){
	$("#agreement").hide();
	$("#readagreement").attr("onclick","showAgreement();");
	if($("#agree").attr("checked")!="checked") $("#agree").trigger("click");
}

function onReadAgreementClick(){
	return;
	if($("#agree").attr("checked")){
		$("#agree").removeAttr("checked");
	}else{
		$("#agree").attr("checked","checked");
	}
	v_submitbutton();
}

var flags = [false,false,false,false];

//邮箱验证，网上找到的正则
// var RegEmail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
function lineState(name,state,msg){
	if(state=="none"){$("#line_"+name+" .input div").attr("class","none"); return;}
	if(state=="corect"){$("#line_"+name+" .input div").attr("class","corect");$("#line_"+name+" .input span").text(msg);return;}
	$("#line_"+name+" .input div").attr("class","error");
	$("#line_"+name+" .input span").text(msg);
}
// 邮箱判断，未用
// function v_account(){
// 	var account = $("#account").val();
// 	if(!RegEmail.test(account)) {lineState("account","error","邮箱格式不正确"); flags[0]=false;enableSubmit(false);}
// 	else{lineState("account","corect","");flags[0] = true;}
// 	v_submitbutton();
// }

// 部门，新增
function v_department(){
	var department = $("#department").val();
	if(department!="开发部") {lineState("department","error","部门格式不正确"); flags[0]=false;enableSubmit(false);}
	else{lineState("department","corect","");flags[0] = true;}
	v_submitbutton();
}

// 用户名判断
function v_name(){
	var name = $("#name").val();
	if(name.length==0) {
		lineState("name","error","不得为空"); 
		flags[1]=false;
	}else{
		if(name.length>20) {
			lineState("name","error","必须少于20个字符"); 
			flags[1]=false;
		}else{
			lineState("name","corect",""); 
			flags[1] = true;
		}
	}
	v_submitbutton();
}
// 密码判断
function v_password(){
	var password = $("#password").val();
	if(password.length<3) {
		lineState("password","error","必须3到20个字符"); 
		flags[2]=false;
	}else{
		if(password.length>20){
			lineState("password","error","必须3到20个字符"); 
			flags[2]=false;
		}else{
			lineState("password","corect","");
			flags[2] = true;
		}
	}
	v_repeat();
	v_submitbutton();
}
// 重复密码判断
function v_repeat(){
	if(!flags[2]) {
		lineState("repeat","none",""); 
		return;
	}
	if($("#password").val()!=$("#repeat").val()) {
		lineState("repeat","error","密码不一致"); 
		flags[3]=false;
	}else{
		lineState("repeat","corect","");
		flags[3] = true;
	}
	v_submitbutton();
}

function adaptValue(){
	return true;
}
</script>

</body>
</html>