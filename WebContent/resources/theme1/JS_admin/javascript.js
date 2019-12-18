function ShowUserInfo() {
	PF('dialog').show();
}

function HideUserInfo() {
	PF('dialog').hide();
}

function CheckInputUser() {
	var user = document.getElementById('txtUser').value;
	var pass = document.getElementById('txtPass').value;
	var name = document.getElementById('txtName').value;
	if (user === '' || pass === '' || name === '') {
		document.getElementById('message1').innerHTML = "You must input required fields";
		return false;
	} else {
		PF('dialog').hide();
		return true;
	}

}

function getDeletedUserId() {
	var Ids = [];
	var a = document.getElementsByClassName('chkDelete');
	alert(a[0].innerHTML);
	alert(a[1].value);
	alert(a[2].value);
}

function checkLogin() {
	var user = document.getElementById('txtUser').value;
	var pass = document.getElementById('txtPass').value;
	if (user === '') {
		document.getElementById('loginMessage').innerHTML = "You must input username field";
		return false;
	}
	if (pass === '') {
		document.getElementById('loginMessage').innerHTML = "You must input password field";
		return false;
	}
	return true;
}

function checkInputClass() {
	var id = document.getElementById('txtId').value;
	var className = document.getElementById('txtClassName').value;
	var supervising = document.getElementById('txtSupervising').value;
	var leader = document.getElementById('txtLeader').value;
	var institute = document.getElementById('txtInstitute').value;
	if (id === '' || className === '' || supervising === '' || leader === ''
			|| institute === '') {
		document.getElementById('message1').innerHTML = "You must input required fields";
		return false;
	} else {
		PF('dialog').hide();
		return true;
	}

}

function setReadOnly() {

}

function showBillDetail(id){
	$.ajax({
		type: "POST",
		url: "./bill-detail.htm",
		data: id,
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (bills) {
			$('.bill-row').each(function(){
        		$(this).remove();
        	});
			$('.first-row-bill').each(function(){
        		$(this).remove();
        	});
			
			$('#first-row-bill').append('<td colspan="3" class="bill-row" >Bill-ID: '+id+'</td>');
        	for( var i in bills) {
        		$('#bill-table').append(
        			'<tr class="bill-row">'+
						'<td>'+bills[i].phoneID+'</td>'+
						'<td>'+bills[i].quantity+'</td>'+
						'<td>'+bills[i].priceUnit+'</td>'+
        			'</tr>');
        	};
		},
		failure: function (response) {
			alert(response.responseText);
		},
		error: function (response) {
			alert(response.responseText);
		}
	});
	return false;
	
}

function showPhoneInfo(id){
	$.ajax({
		type: "POST",
		url: "./phone-info.htm",
		data: id,
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (phone) {
			$("input[name='txtID']").val(phone.phoneID);
        	$("input[name='txtName']").val(phone.name);
        	$("input[name='txtScreen']").val(phone.screen);
        	$("input[name='txtOS']").val(phone.os);
        	$("input[name='txtFrontCamera']").val(phone.frontCamera);
        	$("input[name='txtFollowingCamera']").val(phone.followingCamera);
        	$("input[name='txtCPU']").val(phone.cpu);
        	$("input[name='txtRAM']").val(phone.ram);
        	$("input[name='txtAmount']").val(phone.amount);
        	$("input[name='txtMemoryCard']").val(phone.memoryCard);
        	$("input[name='txtSIM']").val(phone.sim);
        	$("input[name='txtBattery']").val(phone.battery);
        	$("select[name='selBrand']").val(phone.brandId);
        	$("input[name='txtMemory']").val(phone.memory);
        	$("input[name='txtPrice']").val(phone.price);
        	var phones = phone.image.split(";");
        	
        	$("img[name='img1']").attr("src","/MobileStore/resources/theme1/images/products/"+phones[0]+".jpg");
        	$("img[name='img2']").attr("src","/MobileStore/resources/theme1/images/products/"+phones[1]+".jpg");
        	$("img[name='img3']").attr("src","/MobileStore/resources/theme1/images/products/"+phones[2]+".jpg");
        	$("img[name='img4']").attr("src","/MobileStore/resources/theme1/images/products/"+phones[3]+".jpg");

        	$("input[name='file-img1']").val('');
        	$("input[name='file-img2']").val('');
        	$("input[name='file-img3']").val('');
        	$("input[name='file-img4']").val('');
// var images = phone.image.split(";");
// $("input[name='txtImg1']").val(images[0]+".jpg");
// $("input[name='txtImg2']").val(images[1]+".jpg");
// $("input[name='txtImg3']").val(images[2]+".jpg");
// $("input[name='txtImg4']").val(images[3]+".jpg");
		},
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
	$("#btnAddPhone").click(function(even) {
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
	$(this).keydown(function(event) {
		if (event.which == 27) { // 27 is 'Ecs' in the keyboard
			disablePopup(); // function close pop up
		}
	});
	$("#background-popup").click(function() {
		disablePopup(); // function close pop up
// disableLoginPopup();
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
	
	$('#btnSubmit').click(function(){
		$.ajax({
		type: "POST",
		url: "./update.htm",
		data: {
			id: $('input[name="txtID"]').val(),
	        name:    $('input[name="txtName"]').val(),
	        screen:    $('input[name="txtScreen"]').val(),
	        os:    $('input[name="txtOS"]').val(),
	        frontCamera:    $('input[name="txtFrontCamera"]').val(),
	        followingCamera:    $('input[name="txtFollowingCamera"]').val(),
	        cpu:    $('input[name="txtCPU"]').val(),
	        ram:    $('input[name="txtRAM"]').val(),
	        amount:    $('input[name="txtAmount"]').val(),
	        memoryCard:    $('input[name="txtMemoryCard"]').val(),
	        sim:    $('input[name="txtSIM"]').val(),
	        battery:    $('input[name="txtBattery"]').val(),
	        brandID:    $('select[name="selBrand"]').val(),
	        memory:    $('input[name="txtMemory"]').val(),
	        price:    $('input[name="txtPrice"]').val(),
	        img1:    $('input[name="file-img1"]').val(),
	        img2:    $('input[name="file-img2"]').val(),
	        img3:    $('input[name="file-img3"]').val(),
	        img4:    $('input[name="file-img4"]').val()
	        
	     },
// contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (phones) {
        	$('.phone-row').each(function(){
        		$(this).remove();
        	});
        	for( var i in phones) {
        		$('#tblPhone').append(
        			'<tr class="phone-row">'+
        				'<td><input type="checkbox" class="chkDelete" name="chkDelete" value="'+phones[i].phoneID+'"/></td>'+
						'<td>'+i+'</td>'+
						'<td><a href="#" class="linkInfo" onclick="return showPhoneInfo(\''+phones[i].phoneID+'\');">'+phones[i].name+'</a></td>'+
						'<td>'+phones[i].screen+'</td>'+
						'<td>'+phones[i].frontCamera+'</td>'+
						'<td>'+phones[i].followingCamera+'</td>'+
						'<td>'+phones[i].cpu+'</td>'+
						'<td>'+phones[i].ram+'</td>'+
						'<td>'+phones[i].memory+'</td>'+
						'<td>'+phones[i].price+'</td>'+
						'<td>'+phones[i].amount+'</td>'+
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
	
	$("div[name='div-image1']").click(function(e) {
	    $("input[name='file-img1']").click();
	});
	$("div[name='div-image2']").click(function(e) {
	    $("input[name='file-img2']").click();
	});
	$("div[name='div-image3']").click(function(e) {
	    $("input[name='file-img3']").click();
	});
	$("div[name='div-image4']").click(function(e) {
	    $("input[name='file-img4']").click();
	});
	jQuery("input[name='file-img1']").change(function () {
	    var image = $(this).val().split("\\")[2];
	    $("img[name='img1']").attr("src","/MobileStore/resources/theme1/images/products/"+image);
	});
	jQuery("input[name='file-img2']").change(function () {
	    var image = $(this).val().split("\\")[2];
	    $("img[name='img2']").attr("src","/MobileStore/resources/theme1/images/products/"+image);
	});
	jQuery("input[name='file-img3']").change(function () {
	    var image = $(this).val().split("\\")[2];
	    $("img[name='img3']").attr("src","/MobileStore/resources/theme1/images/products/"+image);
	});
	jQuery("input[name='file-img4']").change(function () {
	    var image = $(this).val().split("\\")[2];
	    $("img[name='img4']").attr("src","/MobileStore/resources/theme1/images/products/"+image);
	});
	
	$('#btnDeletePhone').click(function(){
		var arr = '';
		$('input[name=chkDelete]:checked').each(function(){
			arr+=$(this).attr('value')+'a';
		});
		$.ajax({
			type: "POST",
			url: "./delete.htm",
			data: {
				ids: arr    
		     },
// contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function (phones) {
	        	$('.phone-row').each(function(){
	        		$(this).remove();
	        	});
	        	for( var i in phones) {
	        		$('#tblPhone').append(
	        			'<tr class="phone-row">'+
	        				'<td><input type="checkbox" class="chkDelete" name="chkDelete" value="'+phones[i].phoneID+'"/></td>'+
							'<td>'+i+'</td>'+
							'<td><a href="#" class="linkInfo" onclick="return showPhoneInfo(\''+phones[i].phoneID+'\');">'+phones[i].name+'</a></td>'+
							'<td>'+phones[i].screen+'</td>'+
							'<td>'+phones[i].frontCamera+'</td>'+
							'<td>'+phones[i].followingCamera+'</td>'+
							'<td>'+phones[i].cpu+'</td>'+
							'<td>'+phones[i].ram+'</td>'+
							'<td>'+phones[i].memory+'</td>'+
							'<td>'+phones[i].price+'</td>'+
							'<td>'+phones[i].amount+'</td>'+
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
	


	$('#btnDeleteBill').click(function(){
	var arr = '';
	$('input[name=chkDelete]:checked').each(function(){
		arr+=$(this).attr('value')+'a';
	});
	$.ajax({
		type: "POST",
		url: "./bill-delete.htm",
		data: {
			ids: arr    
	     },
		dataType: "json",
		success: function (bills) {
        	$('.bill-row').each(function(){
        		$(this).remove();
        	});
        	for( var i in bills) {
        		$('#tblBill').append(
        			'<tr class="bill-row">'+
        				'<td><input type="checkbox" class="chkDelete" name="chkDelete" value="'+bills[i].id+'"/></td>'+
						'<td>'+i+'</td>'+
						'<td><a href="#" class="linkInfo" onclick="return showBillDetail(\''+bills[i].id+'\');">'+bills[i].id+'</a></td>'+
						'<td>'+bills[i].fullName+'</td>'+
						'<td>'+bills[i].emaile+'</td>'+
						'<td>'+bills[i].phone+'</td>'+
						'<td>'+bills[i].address+'</td>'+
						'<td>'+bills[i].total+'</td>'+
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

});


