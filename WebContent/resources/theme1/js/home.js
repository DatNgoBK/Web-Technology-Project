
var currentPage = 0;
var dataPOST = "";


$(document).ready(function () {
    $('#sort').change(function (e) {
    	currentPage = 0;
    	updateListProduct();
    });
});

$(document).ready(function() {
	$('.checkbox-single').change(function() {
    	currentPage = 0;
		updateListProduct();
		 
	});
});


function loadListProduct(listProduct) {
	if (currentPage == 0)
		$("#listProduct").empty();
	for( var index in listProduct) {
		
		$("#listProduct").append('<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 mb30" id="product-single">' + 
		
					'<div class="product-block">' + 
						'<div class="product-img">' +
						'<a href="product-single.htm?phoneID=' + listProduct[index].phoneID + '">' +
							'<img src="/MobileStore/resources/theme1/images/products/' + listProduct[index].image +'.jpg"' +
								'alt="">' + 
						'</a>' + 
						'</div>'+
						'<div class="product-content">' + 
							'<h5>' + 
								'<a href="product-single.htm?phoneID=' + listProduct[index].phoneID +'" class="product-title">' + listProduct[index].name +
									'<strong>(' + listProduct[index].ram + 'GB, ' + listProduct[index].memory +'GB)</strong>' + 
								'</a>' + 
							'</h5>' + 
							'<div class="product-meta">' + 
								'<a href="#" class="product-price">' + parseFloat(listProduct[index].price).toLocaleString("slv")+'d</a>' + 
								
							'</div>' + 
							'<div class="shopping-btn">' + 
									' <a  id="' + listProduct[index].phoneID +'"' +
									' class="product-btn btn-cart add-to-cart" >' + 
									'<i class="fa fa-shopping-cart"></i></a>' + 
							'</div>' + 
						'</div>' + 
					'</div>' + 
				'</div>');
	}
}

function updateListProduct() {
	
	var typeSort = '"typeSort" :' + '"'+ $('select[name=sort]').val() + '"';
	
	var brandID = getCheckboxJson('brandID', 'checkbox-brand');
	var price = getCheckboxJson('price', 'checkbox-price');
	var ram = getCheckboxJson('ram', 'checkbox-ram');
	var memory = getCheckboxJson('memory', 'checkbox-memory');
	
	page = '"page":' + currentPage;
	
	dataPOST = '{' + typeSort + ','+ brandID + ',' + price +'}';
	
	$.ajax({
		type: "POST",
		url: "sort2.htm",
		data: '{' + typeSort + ','+page+','+ brandID + ',' + price +','+ ram + ',' + memory +'}',
		contentType: "application/json; charset=utf-8",
		dataType: "json",
		success: function (listProduct) {
			
        	loadListProduct(listProduct);
        	$("#page-dive").empty();
        	$("#load-more").css("display","inline");
    		flag = 1;
    		
    		
    		$.ajax({
    			type: "GET",
    			encoding:"UTF-8",
    			contentType: "text/plain; charset=UTF-8",
    			url: "sort2.htm",
    			success: function (count) {
    				$("#load-more").html("Load more (" + count + " phone)");
    				if (count == 0) {
    		        	$("#load-more").css("display","none");
    					return;
    				}
    	        	
    			},
    			failure: function (response) {
    				alert(response.responseText);
    			},
    			error: function (response) {
    				alert(response.responseText);
    			}
    		});
		},
		failure: function (response) {
			alert(response.responseText);
		},
		error: function (response) {
			alert(response.responseText);
		}
		
	});
	

	
}
$(document).ready(function() {
	$('#load-more').click(function() {
		console.log("hihi");
		currentPage++;
		updateListProduct();

		 
	});
	
});

//Trả về chuỗi Json cho các checkbox được tích.
function getCheckboxJson(name, nameCheckbox) {
	var name = '"' + name + '": "';
	var initName = name;
	$('input:checkbox.' + nameCheckbox).each(function () {
		name += (this.checked ? $(this).val() + ',' : "") ;
	});
	if (name == initName)
		name += '"';
	else
		name = name.slice(0, -1) +'"';
	return name;
}
	
$(document).ready(function() {
	$(document).on('click','.add-to-cart',function() {
		$.ajax({
    			type: "GET",
    			encoding:"UTF-8",
    			contentType: "text/plain; charset=UTF-8",
    			url: "home.htm?command=plus&phoneID=" + $(this).attr('id'),
    			success: function (result) {
    				if(result == "fail") {
     					alert("Only 6 per product. Thank!");
     					return;
    				}
    				$("html, body").animate({ scrollTop: 0 }, "slow");
    				if ($(".cart-quantity").html() != "")
    					$(".cart-quantity").html(parseInt($(".cart-quantity").html()) +1);
    				else $(".cart-quantity").html(1);
    			},
    			failure: function (response) {
    				alert(response.responseText);
    			},
    			error: function (response) {
    				alert(response.responseText);
    			}
    		});
	});
});
		
$(document).ready(function() {
	$('#add-to-cart').click(function() {
		$.ajax({
    			type: "GET",
    			encoding:"UTF-8",
    			contentType: "text/plain; charset=UTF-8",
    			url: "product-single.htm?phoneID=" + $('.quantity-single').attr('id') +"&command=plus&quantity=" + $('.quantity-single').val(),
    			success: function (result) {
    				if(result == "fail")
     					alert("Only 6 per product! Thanks!");
     				else {
	    				$("html, body").animate({ scrollTop: 0 }, "slow");
	     				location.reload();
     				}
    				
    			},
    			failure: function (response) {
    				alert(response.responseText);
    			},
    			error: function (response) {
    				alert(response.responseText);
    			}
    		});
	});
});

//cart.jsp
$(document).ready(function() {
 	$('.quantity-cart').change(function() {
 		$.ajax({
     			type: "GET",
     			encoding:"UTF-8",
     			contentType: "text/plain; charset=UTF-8",
     			url: "product-single.htm?phoneID=" + $(this).attr('id') +"&command=update&quantity=" + $(this).val(),
     			success: function (result) {
     					location.reload();
     				return;
     			},
     			failure: function (response) {
     				alert(response.responseText);
     			},
     			error: function (response) {
     				alert(response.responseText);
     			}
     		});
 	});
 });

