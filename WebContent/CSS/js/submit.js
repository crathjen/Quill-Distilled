/**
 * 
 */
function initializeSubmitForm(){
	$("#author").keyup(function(evt){
		$("#authorMatches").remove()
		console.log($(evt.target).serialize())
		$.ajax({
			url : "/Quotes/submitvalidation/author",
			method: "post",
			dataType: "json",
			data: $(evt.target).serialize(),
			success: displayListOfMatches,
			error: ajaxerror
		})
		function displayListOfMatches(data){
			if(data&&data.length>0){
				var ul = $("<ul id='authorMatches'></ul>");
				for (var i=0; i<data.length; i++){
					var li = $("<li>"+data[i].firstName+" "+data[i].lastName+"</li>")
					ul.append(li)
				}
				$("#author").parent().append(ul);
			}
				
		}
	})
}