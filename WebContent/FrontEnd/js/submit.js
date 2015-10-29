/**
 * 
 */
function initializeSubmitForm(){
	$("#author").autocomplete({
		source: function(request, response){
			console.log($("#author").data("id"));
			$("#author").removeAttr("data-id");
			$.ajax({
				url : "/Quotes/submitvalidation/author",
			method: "post",
			dataType: "json",
			data: "author="+request.term,
			success: function(data){
				$.each(data,function(index, element){
					if(element.firstName!==null)
					element.value=element.firstName+" "+element.lastName;
					else element.value=element.lastName;
				});
				response(data);
			},
			error: ajaxerror
			})
		},
		select: function(evt, ui){
			$("#author").attr("data-id", ui.item.id);
			console.log(ui.item.id);
		}		
	});
	
	$("#quoteSubmission .tag").each(function(){
		var eachself=this;
		$(this).autocomplete({
			source: function(request, response){
				$(eachself).removeAttr("data-id");
				console.log(eachself);
				$.ajax({
					url : "/Quotes/submitvalidation/tag",
					method: "post",
					dataType: "json",
					data: "tag="+request.term,
					success: function(data){
						$.each(data,function(index, element){
							element.value=element.tagText;
						});
						response(data);
					},
					error: ajaxerror
				})
			},
			select: function(evt, ui){
				$(evt.target).attr("data-id", ui.item.id);
				console.log(evt);
				//$("#author").attr("data-id", ui.item.id);
				console.log(ui.item.id);
			}
		})
	
	});
	$("#submittingUser").val(user).attr("disabled","true");
	
}


	
	
	
	

