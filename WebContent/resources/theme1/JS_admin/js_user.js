//----------------------------------------------UserManagement.jsp-----------------------------------------
function showUser(id){
	$.ajax({
		type: "POST",
		url: "./user-info.htm",
		data: id,
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (user) {
			$("input[name='txtID']").val(user.id);
      	$("input[name='txtName']").val(user.name);
      	$("input[name='txtUsername']").val(user.username);
      	$("input[name='txtRole']").val(user.role);
      	$("input[name='txtPassword']").val(user.password);		},
		failure: function (response) {
			alert(response.responseText);
		},
		error: function (response) {
			alert(response.responseText);
		}
	});
	return false;
	
}

$(document).ready(function() {
	
	$("#btnAddUser").click(function(even) {
		$('#popup-content input[type="text"],#popup-content input[type="file"],#popup-content input[type="hidden"]').each(function(){
			$(this).val("");
		});
		$("#popup-content img").each(function(){
			$(this).attr("src","");
		});
	    even.preventDefault(); // không truy cập đến link trong thẻ a
		loadPopup(); // function show popup
	});
	
	$("#btn-close").click(function() {
		disablePopup();
	});
	$("#Cancel").click(function() {
		disablePopup();
	});
	$(this).keydown(function(event) {
		if (event.which == 27) { // 27 is 'Ecs' in the keyboard
			disablePopup(); // function close pop up
		}
	});
	$("#background-popup").click(function() {
		disablePopup(); // function close pop up
//		disableLoginPopup();
	});
	var popupStatus = 0; // set value
	function loadPopup() {
		if (popupStatus == 0) { // if value is 0, show popup
			$("#to-popup").fadeIn(200); // fadein popup div
			$("#background-popup").css("opacity", "0.8"); // css opacity,
															// supports IE7, IE8
			$("#background-popup").fadeIn(200);
			popupStatus = 1; // and set value to 1
		}
	}
	function disablePopup() {
		if (popupStatus == 1) { // if value is 1, close popup
			$("#to-popup").fadeOut(300);
			$("#background-popup").fadeOut(300);
			$('body,html').css("overflow", "auto");// enable scroll bar
			popupStatus = 0; // and set value to 0
		}
	}
	
	$(document).on('click', ".linkInfo", function () {
		loadPopup();
	})
	
	
	$('#btnUserSubmit').click(function(){
		$.ajax({
		type: "POST",
		url: "./user-update.htm",
		data: {
			id: $('input[name="txtID"]').val(),
	        name:    $('input[name="txtName"]').val(),
	        username:    $('input[name="txtUsername"]').val(),
	        password:    $('input[name="txtPassword"]').val(),
	        role:    $('input[name="txtRole"]').val(),
	     },
//	     contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (users) {
      	$('.user-row').each(function(){
      		$(this).remove();
      		console.log('a');
      	});
      	for( var i in users) {
      		console.log(i);
      		$('#tblUser').append(
      			'<tr class="user-row">'+
      				'<td><input type="checkbox" class="chkDelete" name="chkDelete" value="'+users[i].id+'"/></td>'+
						'<td>'+i+'</td>'+
						'<td><a href="#" class="linkInfo" onclick="return showUser(\''+users[i].id+'\');">'+users[i].name+'</a></td>'+
						'<td>'+users[i].username+'</td>'+
						'<td>'+users[i].role+'</td>'+
      			'</tr>');
      	};
      	disablePopup();
		},
		failure: function (response) {
			alert('error1');
		},
		error: function (jqXHR, textStatus, errorThrown) {
			alert(jqXHR+'; '+textStatus+'; '+errorThrown);
		}
	});
	});
	

	$('#btnDeleteUser').click(function(){
		var arr = '';
		$('input[name=chkDelete]:checked').each(function(){
			arr+=$(this).attr('value')+'a';
		});
		$.ajax({
			type: "POST",
			url: "./deleteUser.htm",
			data: {
				ids: arr    
		     },
//		     contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function (users) {
	        	$('.user-row').each(function(){
	        		$(this).remove();
	        	});
	        	for( var i in users) {
	          		$('#tblUser').append(
	          			'<tr class="user-row">'+
	          				'<td><input type="checkbox" class="chkDelete" name="chkDelete" value="'+users[i].id+'"/></td>'+
	    						'<td>'+i+'</td>'+
	    						'<td><a href="#" class="linkInfo" onclick="return showUser(\''+users[i].id+'\');">'+users[i].name+'</a></td>'+
	    						'<td>'+users[i].username+'</td>'+
	    						'<td>'+users[i].role+'</td>'+
	          			'</tr>');
	          	};
			},
			failure: function (response) {
				alert('error1');
			},
			error: function (jqXHR, textStatus, errorThrown) {
				alert(jqXHR+'; '+textStatus+'; '+errorThrown);
			}
		});
	});
})

