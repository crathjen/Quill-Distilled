/**
 * 
 */
var user;
var authority;

$(document).ready(function() {
	if ($("#user a")[0].innerHTML){
	user = $("#user a")[0].innerHTML;
	//console.log(user)
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
			//console.log("insuccesfn");
			$("#user a")[0].innerHTML="";
			//console.log($(".login input"))
			
			user=null;
			$(".user").css("display","none");
			$(".login").css("display","block");
		}
	});
	
	var firstQuote=$($("#quoteResults .quote")[0]);
	var pig = $("#piggify");
	pig.click(function(){
		$.ajax({
			url: "/Quotes/REST/piggify",
			method: "post",
			data: "quoteText="+$($("#quoteResults .quote")[0]).html(),
			success: function(data){
				$($("#quoteResults .quote")[0]).html(data);
			},
			error: ajaxerror
		})
	})
	
	$("#cipherEncrypt").click(function(){
		$.ajax({
			url: "/Quotes/REST/cipherEncrypt",
			method: "post",
			data: "quoteText="+$($("#quoteResults .quote")[0]).html()+"&key="+$("#cipherKey").val(),
			success: function(data){
				$($("#quoteResults .quote")[0]).html(data);
			},
			error: ajaxerror
		})
	})
	$("#cipherDecrypt").click(function(){
		$.ajax({
			url: "/Quotes/REST/cipherDecrypt",
			method: "post",
			data: "quoteText="+$($("#quoteResults .quote")[0]).html()+"&key="+$("#cipherKey").val(),
			success: function(data){
				$($("#quoteResults .quote")[0]).html(data);
			},
			error: ajaxerror
		})
	})
	
	$("#cipherHack").click(function(){
		$.ajax({
			url: "/Quotes/REST/cipherHack",
			method: "post",
			data: "quoteText="+$($("#quoteResults .quote")[0]).html(),
			success: function(data){
				$($("#quoteResults .quote")[0]).html(data);
			},
			error: ajaxerror
		})
	})
	
	
//	var submitqt = $("#submitqtbtn")
//	submitqt.click(function(){
//		$.ajax({
//			url : "/Quotes/submitQuote",
//			dataType: "html",
//			success: loadSubmitForm,
//			error: ajaxerror
//		})
//		function loadSubmitForm(data){
//			$(".bodyContent").html(data);
//		}
//	})
	
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
				//console.log(data);
				user.id=data.id;
				//link.html(foo.name)
				//console.log(data.name);
				//console.log(data.authorities[0].authority)
			}
			
			function ajaxerror(data, status){
				
				
			}
		})
	})
})
