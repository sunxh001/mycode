/**
 * login and register form validate
 */
$(function() {
	var flags = [false, true, false];

	function stateMassage(name, state, massage) {
		if (state == false) {
			$("#" + name).text(massage);
			$("#" + name).css("display", "block");
		}
		if (state == true) {
			$("#" + name).text(massage);
			$("#" + name).css("display", "none");
		}

	}

	function enablesubmit() {
		for (f in flags) {
			if (!flags[f]) {
				$("#registersubmit").attr("disabled", "disabled");
				$("#registersubmit").css("background-color", "rgb(100, 100, 100)");
				console.log(flags);
				return;
			}
		}
		$("#registersubmit").removeAttr("disabled");
		$("#registersubmit").css("background-color", "#3d9db3");
		console.log("flags");
	}

	$("#role_name").blur(function() {
		if ($(this).val().trim().length == 0) {
			stateMassage("span-role_name", false, "角色名不允许为空");
			flags[0] = false;

		} else if ($(this).val().length > 20) {
			stateMassage("span-role_name", false, "角色名不允许超过20个字符");
			flags[0] = false;

		} else {
			stateMassage("span-role_name", true, "");
			flags[0] = true;
		}
		enablesubmit();
	});

	$("#creator").keyup(function() {
		console.log(typeof $(this).val().trim());
		if ($(this).val().trim() != "admin") {
			stateMassage("span-creator", false, "创建人：admin");
			flags[1] = false;
		} else {
			stateMassage("span-creator", true, "");
			flags[1] = true;
		}
		enablesubmit();
		console.log(flags);
	});

	$("#creation_time").change(function() {
		if ($(this).val().trim().length == 0) {
			stateMassage("span-creation_time", false, "请选择时间");
			flags[2] = false;

		} else {
			stateMassage("span-creation_time", true, "");
			flags[2] = true;
		}
		enablesubmit();
	});
	/**
	 * 新增角色提交
	 */
	// $("#registersubmit").click(function() {
	// 	console.log("dfaf");
	// 	var formdata = new FormData($("#register_form").get(0));
	// 	$.ajax({
	// 		type: "POST",
	// 		url: "http://localhost:8080/pmsystem/RolePage", //绝对路径
	// 		// contentType : "application/json; charset=utf-8",
	// 		dataType: "json",
	// 		data: formdata,
	// 		processData: false,
	// 		contentType: false,
	// 		success: function(datas) {
	// 			console.log(datas);
	// 			$("#model_box_mask").css("display","none");
	// 			$(".addlist").css("display","none");
	// 			alert("插入成功:"+datas[0][0].user_name);
	// 			Ajax_Pagination_query("http://localhost:8080/pmsystem/RolePage",1, top_pageSize,"query");
	// 		},
	// 		error: function(e) {
	// 			console.log(e.responseText);
	// 		}
	
	// 	});
		// postt提交也可以
	// $.post("http://localhost:8080/pmsystem/validate",{username:"123sgsdgs",password:"fdgsfg"},function(data) {console.log(data);},"json")
	// });
	
	$("#model_box_close").click(function(){
	$("#model_box_mask").css("display","none");
	$(".addlist").css("display","none");
	
});	

});

