/**
 * login and register form validate
 */
$(function() {
	var flags = [false, false, false, false];

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
				$("#registersubmit").css("background-color", "red");
				console.log(flags);
				return;
			}
		}
		$("#registersubmit").removeAttr("disabled");
		$("#registersubmit").css("background-color", "#3d9db3");
		console.log("flags");
	}

	$("#usernamesignup").keyup(function() {
		if ($(this).val().trim().length == 0) {
			stateMassage("span-usernamesignup", false, "用户名不允许为空");
			flags[0] = false;

		} else if ($("#usernamesignup").val().length > 20) {
			stateMassage("span-usernamesignup", false, "用户名不允许超过20个字符");
			flags[0] = false;

		} else {
			stateMassage("span-usernamesignup", true, "");
			flags[0] = true;
		}
		enablesubmit();
	});

	$("#departmentsignup").keyup(function() {
		console.log(typeof $(this).val().trim());
		if ($(this).val().trim() != "开发部") {
			stateMassage("span-departmentsignup", false, "部门名：开发部");
			flags[1] = false;
		} else {
			stateMassage("span-departmentsignup", true, "");
			flags[1] = true;
		}
		enablesubmit();
		console.log(flags);
	});

	$("#passwordsignup").keyup(function() {
		if ($(this).val().trim().length <= 2) {
			stateMassage("span-passwordsignup", false, "密码3-20个字符");
			flags[2] = false;

		} else if ($(this).val().trim().length >= 21) {
			stateMassage("span-passwordsignup", false, "密码3-20个字符");
			flags[2] = false;

		} else {
			stateMassage("span-passwordsignup", true, "");
			flags[2] = true;
		}
		enablesubmit();
	});
	$("#passwordsignup_confirm").keyup(function() {
		if ($("#passwordsignup").val().trim().length == 0) {
			stateMassage("span-passwordsignup_confirm", false, "密码不一致");
			flags[3] = false;

		} else if ($(this).val().trim() != $("#passwordsignup").val().trim()) {
			stateMassage("span-passwordsignup_confirm", false, "密码不一致");
			flags[3] = false;
		} else if ($(this).val().length > 20) {
			stateMassage("span-passwordsignup_confirm", false, "密码不一致");
			flags[3] = true;
		} else {
			stateMassage("span-passwordsignup_confirm", true, "");
			flags[3] = true;
		}
		enablesubmit();
	});

	/**
	 * login ajax validate
	 */
	$("#loginsubmit").click(function() {
		console.log("dfaf");
		var formdata = new FormData($("#login_form").get(0));
		$.ajax({
			type: "POST",
			url: "http://localhost:8080/pmsystem/validate", //绝对路径
			// contentType : "application/json; charset=utf-8",
			dataType: "json",
			data: formdata,
			processData: false,
			contentType: false,
			success: function(datas) {
				console.log(datas.username);
				if(datas.uvflag==1){
				console.log("提交");
				$("#login_form").submit();
				}else{
				$("#login-validate").text("用户名或密码错误！");
				$("#login-validate" ).css("display", "block");
				}
			},
			error: function(e) {
				console.log(e.responseText);
			}
	
		});
		// postt提交也可以
	// $.post("http://localhost:8080/pmsystem/validate",{username:"123sgsdgs",password:"fdgsfg"},function(data) {console.log(data);},"json")
	});
	$("#login_form").keyup(function(event){
		if(event.keyCode==13||event.keyCode==100){
		var formdata = new FormData($("#login_form").get(0));
		$.ajax({
			type: "POST",
			url: "http://localhost:8080/pmsystem/validate", //绝对路径
			// contentType : "application/json; charset=utf-8",
			dataType: "json",
			data: formdata,
			processData: false,
			contentType: false,
			success: function(datas) {
				console.log(datas.username);
				if(datas.uvflag==1){
				console.log("提交");
				$("#login_form").submit();
				}else{
				$("#login-validate").text("用户名或密码错误！");
				$("#login-validate" ).css("display", "block");
				}
			},
			error: function(e) {
				console.log(e.responseText);
			}
			
		});
		}
	});



})
