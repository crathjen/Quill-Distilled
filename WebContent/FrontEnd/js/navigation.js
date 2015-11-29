/**
 * 
 */
$(document).ready(function() {
	function loadSubmitForm(data){
		$(".bodyContent").html(data);
	}
	var submitqt = $("#submitqtbtn")
	submitqt.click(function(){
		$.ajax({
			url : "/Quotes/navigate/submitQuote",
			dataType: "html",
			success: function(data){
				loadSubmitForm(data);
				initializeSubmitForm();
			},
			error: ajaxerror
		})

	})
	$("#signupbtn").click(function(){
		$.ajax({
			url: "/Quotes/navigate/signUp",
			dataType: "html",
			success: loadSubmitForm
			
		})
	})
	var home = $("#homebtn")
	home.click(function(){
		$.ajax({
			url : "/Quotes/navigate/userHome",
			dataType: "html",
			success: loadSubmitForm,
			error: ajaxerror
		})
		
	})
})