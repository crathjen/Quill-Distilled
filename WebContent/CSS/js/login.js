/**
 * 
 */
var user;
var authority;

$(document).ready(function() {
	if ($("#user a")[0].innerHTML){
	user = $("#user a")[0].innerHTML;
	console.log(user)
	$(".user").css("display","block");
	}else{
		$(".login").css("display","block")
	}
	var link = $("#loginlink");
	
	$('.login input').keypress(function(e){
		if(e.keyCode==13)
			link.click();	
	})
	var signout=$("#signoutbtn")
	
	signout.click(function(){
		$.ajax({
			url : "/Quotes/logout",
			success: successfulLogout,
			error: ajaxerror
		})
		function successfulLogout(){
			console.log("insuccesfn");
			$("#user a")[0].innerHTML="";
			console.log($(".login input"))
			
			user=null;
			$(".user").css("display","none");
			$(".login").css("display","block");
		}
	})
	
	link.click(function() {
		
		//$("#login input").css("transitionduration", "inline");
		
		$(".login input").css("display", "inline");
		$(".login input:first-of-type").focus();
		link.off("click");
		link.click(function() {
			
			$.ajax({
				url : "/Quotes/login",
				method : "post",
				dataType: "json",
				data: $("#loginForm").serialize(),
					//("username="+$(".login input")[0].value+"&password="+$(".login input")[1].value),
				success: successfulSignIn,
				error: ajaxerror
			})
			
			function successfulSignIn(data, status){
				//link.off("click");
				$("#user a")[0].innerHTML=(data.name);
				$(".login input").val("");
				$(".login").css("display", "none");
				$(".user").css("display","block")
				//$("#menu ul:first-of-type").append($("<li id=\"user\"><a>"+data.name+"</a></li>"))
				user=data.name;
				//link.html(foo.name)
				//console.log(data.name);
				//console.log(data.authorities[0].authority)
			}
			
			function ajaxerror(data, status){
				
				
			}
		})
	})
})
