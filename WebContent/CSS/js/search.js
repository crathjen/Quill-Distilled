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
		return false
	})
	
})
function linkSearchResults(){
	if (user){
		var rating=$("<span class='opine'>Rating</span>")
		rating.insertAfter("span.author");
		rating=$("<span class='opine qt'>Rating</span>")
		var like=$("<span class='opine'>Like</span>");
		$(".quoteinfocontainer").append(rating);
		$("span.tag").after(like);
	}
	
	$("span.author").click(function(evt){
		console.log(evt.target.innerHTML)
		$.ajax({
			url : "/Quotes/REST/search",
			method: "post",
			dataType: "json",
			data: "searchType=authorFN&searchExpression="+evt.target.innerHTML,
			success: quotelistajaxsuccess,
			error: ajaxerror
		})
	})
	$("span.tag").click(function(evt){
		console.log(evt.target.innerHTML)
		$.ajax({
			url : "/Quotes/REST/search",
			method: "post",
			dataType: "json",
			data: "searchType=tag&searchExpression="+evt.target.innerHTML,
			success: quotelistajaxsuccess,
			error: ajaxerror
		})
	})
	$("span.book").click(function(evt){
		console.log(evt.target.innerHTML)
		$.ajax({
			url : "/Quotes/REST/search",
			method: "post",
			dataType: "json",
			data: "searchType=bookTitle&searchExpression="+evt.target.innerHTML,
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
				var qtc = $("<li class='quotecontainer'><div class=\"quote\">"+quotelist[i].quoteText+"</div></li>");
				//console.log(qt)
				var qt =$("<div class='quoteinfocontainer'></div>")
				if(quotelist[i].author!==null){
					var auth = $("<div class=\"authorcontainer\"><span class=\"label\">Author: </span><span class=\"author\">"+quotelist[i].author.firstName+" "+quotelist[i].author.lastName+"</span></div>")
					//console.log(auth)
					qt.append(auth);
					//console.log(qt)
				}
				if(quotelist[i].quoteSource!==null){
					var source=$("<div class=\"source\"><span class='label'>Book: </span><span class=\"book\">"+quotelist[i].quoteSource.sourceTitle+"</span></div>")
					qt.append(source)
				}
				if(quotelist[i].tags!==null&&quotelist[i].tags.length>0){
					var tags=$("<div class=\"tags\"><span class='label'>Tags: </span></div>")
					for (var j=0;j<quotelist[i].tags.length;j++){
						var tag=$("<span class=\"tag\">"+quotelist[i].tags[j].tagText+"</span>")
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