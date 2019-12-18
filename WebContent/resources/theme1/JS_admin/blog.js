function showBlogInfo(id){	
	$.ajax({
		type: "POST",
		url: "./blog-info.htm",
		data: id,
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (blog) {
			var dt = convertToDateTime(new Date(blog.postedAt));
			$("input[name='txtID']").val(blog.id);
        	$("input[name='txtTitle']").val(blog.title);
        	$("input[name='txtAuthor']").val(blog.author);
        	$("input[name='txtIntro']").val(blog.intro);
        	$("input[name='txtPosted']").val(dt);
        	$("input[name='txtImage']").val(blog.image);
        	$("input[name='txtContent']").val(blog.content);
		},
		failure: function(response) {
			alert(response.responseText);
		},
		error: function (response) {
			alert(response.responseText);
		}
	});
	return false;	
}

function convertToLocalFormat(str){
	var dt = new Date(parseInt(str));
	dt = dt.toLocaleDateString() +' '+ dt.toLocaleTimeString();
}

function convertToDateTime(number){
	x = new Date(number);
	year = x.getFullYear();
	realMonth = x.getMonth() + 1;
	month = ('0' + realMonth).slice(-2);
	day = ('0' + x.getDate()).slice(-2);
	hh = ('0' + x.getHours()).slice(-2);
	mm = ('0' + x.getMinutes()).slice(-2);
	ss = ('0' + x.getSeconds()).slice(-2);
	ms = ('00' + x.getMilliseconds()).slice(-3);
	return (year+'-'+month+'-'+day+'T'+hh+':'+mm+':'+ss+'.'+ms);	
}

$(document).ready(function() {
	$('#btnBlogSubmit').click(function(){
		dt = new Date($('input[name="txtPosted"]').val());
		$.ajax({
		type: "POST",
		url: "./updateBlog.htm",
		data: {
			id: $('input[name="txtID"]').val(),
			title: $('input[name="txtTitle"]').val(),
	        author:    $('input[name="txtAuthor"]').val(),
	        intro:    $('input[name="txtIntro"]').val(),
	        postedAt:   convertToDateTime(dt.getTime()),
	        image:    $('input[name="txtImage"]').val(),
	        content:    $('input[name="txtContent"]').val(),
	        curPage: $('input[name="curPage"]').val()
		},
//	    contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (blogs) {
			if(blogs == null){
        		alert("Failed!");
        	}else{	        		
        		reloadPage(blogs);
        		alert("Success!");
        	}
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
	
	$(this).keydown(function(event) {
		if (event.which == 27) { // 27 is 'Ecs' in the keyboard
			disablePopup(); // function close pop up
		}
	});
	
	$("#btn-close").click(function(){
		disablePopup();
	});
	
	$("#btnAddBlog").click(function(even){
		$('#popup-content input[type="text"],#popup-content input[type="file"],#popup-content input[type="hidden"],#popup-content input[type="datetime-local"]').each(function(){
			$(this).val("");
		});
	    even.preventDefault(); // không truy cập đến link trong thẻ a
		loadPopup();
	});
	
	$("#btnDeleteBlog").click(function(){
		var arr = '';
		$('input[name=chkDelete]:checked').each(function(){
			arr+=$(this).attr('value')+'a';
		});
		$.ajax({
			type: "POST",
			url: "./deleteBlog.htm",
			data: {
				ids: arr,
				curPage: $('input[name="curPage"]').val()
		     },
//		     contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function (blogs) {
				if(blogs == null){
	        		alert("Failed!");
	        	}else{	        		
	        		reloadPage(blogs);
	        		alert("Success!");
	        	}
			},
			failure: function (response) {
				alert('error1');
			},
			error: function (jqXHR, textStatus, errorThrown) {
				alert(jqXHR+'; '+textStatus+'; '+errorThrown);
			}
		});
	});
	
	$("#btnCancel").click(function(){
		disablePopup();
	});
	
	$("#background-popup").click(function() {
		disablePopup(); 
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
	});
});

function reloadPage(blogs){
	$('.blog-row').each(function(){
		$(this).remove();
	});
	for( var i in blogs) {
		var no = parseInt($('input[name="offset"]').val());
		var dt = new Date(parseInt(blogs[i].postedAt));
		dt = dt.toLocaleDateString() +' '+ dt.toLocaleTimeString();
		no = no + parseInt(i) + 1;
		$('#tblBlog').append(
			'<tr class="blog-row">'+
				'<td><input type="checkbox" class="chkDelete" name="chkDelete" value="'+blogs[i].id+'"/></td>'+
				'<td>'+ no +'</td>'+
				'<td><a href="#" class="linkInfo" onclick="return showBlogInfo(\''+blogs[i].id+'\');">'+blogs[i].title+'</a></td>'+
				'<td>'+blogs[i].intro+'</td>'+
				'<td>'+blogs[i].author+'</td>'+
				'<td>'+dt+'</td>'+						
			'</tr>');
	};
} 
