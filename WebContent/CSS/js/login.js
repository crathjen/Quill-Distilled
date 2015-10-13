/**
 * 
 */

$(document).ready(function() {

	var link = $("#loginlink");

	link.click(function() {
		$("#login input").css("display", "inline");
		link.click(function() {
			
			$.ajax({
				url : "/Quotes/login",
				method : "post",
				data: ("username="+$("#login input")[0].value+"&password="+$("#login input")[1].value)
			})
		})
	})
})