/**
 * 
 */
$(document).ready(function(){
	var random = $("#randombtn")
	random.click(function(){
		$.ajax({
			url : "/Quotes/REST/random",
			dataType: "json",
			success: quotelistajaxsuccess,
			error: ajaxerror
		})
		function ajaxerror(){}
	})
	var searchbtn=$("#menuSearchBtn")
	searchbtn.click(function(){
		//console.log($("#menuSearchForm").serialize())
		$.ajax({
			url : "/Quotes/REST/search",
			method: "post",
			dataType: "json",
			data: $("#menuSearchForm").serialize(),
			success: quotelistajaxsuccess,
			error: ajaxerror
		})
		function ajaxerror(e){
			console.log(e)
		}
		return false;
	})
	
})
function linkSearchResults(){
	if (user){
		var rating=$("<div class='opine'></div>");
		rating.insertAfter("span.author");
		$("div.opine:not(.qt):not(.tag)").raty({
			click: function(score){
				console.log(score);
				console.log($(this).prev().attr("data-id"))
				$.ajax({
					url: "/Quotes/REST/updateUser/addAuthorRating",
					method: "post",
					data: "authorID="+$(this).prev().attr("data-id")+"&score="+score,
					error: ajaxerror
					
				})
			}	
		});
		//.each(function(index, elly){var tempstr = elly.innerHTML;elly.innerHTML=tempstr.replace(/&nbsp;/g,"");});
		rating=$("<div class='opine qt'></div>")
		$(".quoteinfocontainer").append(rating);
		$("div.opine.qt").raty({
			click: function(score){
				console.log(score)
				console.log($(this).parent().prev().attr("data-id"))
				$.ajax({
					url: "/Quotes/REST/updateUser/addQuoteRating",
					method: "post",
					data: "quoteID="+$(this).parent().prev().attr("data-id")+"&score="+score,
					error: ajaxerror
					
				})
			}
		});
		
		//$("#quoteResults").
		
		var like=$("<div class='opine tag'>Like</div>");
		$("span.tag").after(like);
		
		$("#quoteResults").on("click", ".opine.tag", function(){
			console.log($(this).prev().attr("data-id"));
			$.ajax({
				url: "/Quotes/REST/updateUser/addInterest",
				method: "post",
				//dataType: "json",
				data: "tagID="+$(this).prev().attr("data-id"),
				error: ajaxerror
			})
		})
	}
	
	$("#quoteResults").on("click", "span.author", function(evt){
	//$("span.author").click(function(evt){
		console.log(evt.target.innerHTML)
		$.ajax({
			url : "/Quotes/REST/search",
			method: "post",
			dataType: "json",
			data: "searchType=authorID&searchExpression="+$(this).attr("data-id"),
			success: quotelistajaxsuccess,
			error: ajaxerror
		})
	})
	$("#quoteResults").on("click", "span.tag", function(evt){
	//$("span.tag").click(function(evt){
		console.log(evt.target.innerHTML)
		$.ajax({
			url : "/Quotes/REST/search",
			method: "post",
			dataType: "json",
			data: "searchType=tagID&searchExpression="+$(evt.target).attr("data-id"),
			success: quotelistajaxsuccess,
			error: ajaxerror
		})
	})
	$("#quoteResults").on("click", "span.book", function(evt){
	//$("span.book").click(function(evt){
		console.log(evt.target.innerHTML)
		$.ajax({
			url : "/Quotes/REST/search",
			method: "post",
			dataType: "json",
			data: "searchType=bookTitleID&searchExpression="+$(evt.target).attr("data-id"),
			success: quotelistajaxsuccess,
			error: ajaxerror
		})
	})
}
function ajaxerror(){}
function quotelistajaxsuccess(quotelist,status){
			//console.log(quotelist)
			var qlist = $("<ul id=\"quoteResults\"></ul>")
			for (var i=0;i<quotelist.length;i++){
				//console.log(typeof quotelist[i])
				//console.log(quotelist[i])
				var qtc = $("<li class='quotecontainer'><div class=\"quote\" data-id='"+quotelist[i].id+"'>"+quotelist[i].quoteText+"</div></li>");
				//console.log(qt)
				var qt =$("<div class='quoteinfocontainer'></div>")
				if(quotelist[i].author!==null){
					var authname;
					if(quotelist[i].author.firstName!==null)
						authname=quotelist[i].author.firstName+" "+quotelist[i].author.lastName;
					else authname=quotelist[i].author.lastName;
					var auth = $("<div class=\"authorcontainer\"><span class=\"label\">Author: </span><span data-id='"+quotelist[i].author.id+"' class=\"author\">"+authname+"</span></div>")
					//console.log(auth)
					qt.append(auth);
					//console.log(qt)
				}
				if(quotelist[i].quoteSource!==null){
					var source=$("<div class=\"source\"><span class='label'>Book: </span><span data-id='"+quotelist[i].quoteSource.id+"'class=\"book\">"+quotelist[i].quoteSource.sourceTitle+"</span></div>")
					qt.append(source)
				}
				if(quotelist[i].tags!==null&&quotelist[i].tags.length>0){
					var tags=$("<div class=\"tags\"><span class='label'>Tags: </span></div>")
					for (var j=0;j<quotelist[i].tags.length;j++){
						var tag=$("<span data-id='"+quotelist[i].tags[j].id+"' class=\"tag\">"+quotelist[i].tags[j].tagText+"</span>")
						tags.append(tag)
					}
					qt.append(tags)
				}
				qlist.append(qtc.append(qt))
				
				//linkSearchResults();
				
			}
			if ($("body #quoteResults").length){
				$("body #quoteResults").replaceWith(qlist)
			}else{
				console.log("change bodyContent")
				$(".bodyContent").html(qlist);
			}
			linkSearchResults();
		}