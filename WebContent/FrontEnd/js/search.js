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
	$("#searchExpression").autocomplete({
		source: function(request, response){
			$("#searchExpression").removeAttr("data-id").removeAttr("data-searchType");
			if($("#searchType").val()=="author"||$("#searchType").val()=="tag")
			$.ajax({
				url : "/Quotes/REST/searchAC",
				method: "post",
				dataType: "json",
				data: $("#menuSearchForm").serialize(),
				success: function(data){
					if($("#searchType").val()=="author")
					{$.each(data, function(){
						if(this.firstName!==null)
							this.value=this.firstName+" "+this.lastName;
							else this.value=this.lastName;
						
					})}
					else{
						$.each(data, function(){
							this.value=this.tagText;
						})
					}
					response(data)
					
				}	
			})
			else response();
		},
		select: function(evt, ui){
			$("#searchExpression").attr("data-id", ui.item.id).attr("data-searchType", $("#searchType").val())
			
		}
	})
	searchbtn.click(function(){
		//console.log($("#menuSearchForm").serialize())
		var ajxData;
		if(!$(this).parent().prev().attr("data-id")){
			ajxData=$("#menuSearchForm").serialize();
			console.log("in normal search")
			}
		else if($(this).parent().prev().attr("data-searchType")==="author"){
			console.log("in else if")
			ajxData="searchType=authorID&searchExpression="+$(this).parent().prev().attr("data-id");}
		else if($(this).parent().prev().attr("data-searchType")==="tag"){
			console.log("tag id search")
			ajxData="searchType=tagID&searchExpression="+$(this).parent().prev().attr("data-id");
		}
			$.ajax({
				url : "/Quotes/REST/search",
				method: "post",
				dataType: "json",
				data: ajxData,
				success: quotelistajaxsuccess,
				error: ajaxerror
			})
		
		function ajaxerror(e){
			console.log(e)
		}
		return false;
	})
	
})
var dfr=[];
function linkSearchResults(){
	
	if (user){
		$.when(dfr[1]).done(function(){
			var rating=$("<div class='opine'></div>");
			rating.insertAfter("span.author");
			$("div.opine:not(.qt):not(.tag)").raty({
				score: function(){return $(this).prev().attr("data-ratyscore");},
				click: function(score){
					console.log(score);
					console.log($(this).prev().attr("data-id"))
					$(this).prev().addClass("userRated")
					$.ajax({
						url: "/Quotes/REST/updateUser/addAuthorRating",
						method: "post",
						data: "authorID="+$(this).prev().attr("data-id")+"&score="+score,
						error: ajaxerror
						
					})
				}	
			});
		})
		//.each(function(index, elly){var tempstr = elly.innerHTML;elly.innerHTML=tempstr.replace(/&nbsp;/g,"");});
		$.when(dfr[1]).done(function(){	
			rating=$("<div class='opine qt'></div>")
			$(".quoteinfocontainer").append(rating).append($("<div class='edit opine'>edit</div>"));
			$("div.opine.qt").raty({
				score: function(){
					return $(this).parent().prev().attr("data-ratyscore");
				},
				click: function(score){
					console.log(score)
					console.log($(this).parent().prev().attr("data-id"))
					$(this).parent().parent().addClass("userRated");
					$.ajax({
						url: "/Quotes/REST/updateUser/addQuoteRating",
						method: "post",
						data: "quoteID="+$(this).parent().prev().attr("data-id")+"&score="+score,
						error: ajaxerror
						
					})
				}
			});
		});
		
		//$("#quoteResults").
		$.when(dfr[1]).done(function(){
			var like=$("<div class='opine tag like'>Like</div>");
			$("span.tag:not(.userLikee)").after(like);
			
			$("#quoteResults").on("click", ".opine.tag.like", function(){
				console.log($(this).prev().attr("data-id"));
				$.ajax({
					url: "/Quotes/REST/updateUser/addInterest",
					method: "post",
					//dataType: "json",
					data: "tagID="+$(this).prev().attr("data-id"),
					error: ajaxerror
				})
			})
			var unlike=$("<div class='opine tag unlike'>Unlike</div>");
			$("span.tag.userLikee").after(unlike);
		})
		

		
		
	}//end user if
	
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
			$(".bodyContent").css("background", "black");
			dfr[0]=$.Deferred();
			dfr[1]=$.Deferred();//console.log(quotelist)
			if(user){
				$.ajax({
					url: "/Quotes/REST/user",
					success: function(ajxUser){
						$.when(dfr[0]).done(function(){
							$.each(ajxUser.userInterests, function(){
								$("span.tag[data-id='"+this.id+"']").addClass("userLikee");
								
							})
							console.log(ajxUser);
							$.each(ajxUser.ratedAuthors, function(){
								$("span.author[data-id='"+this.authorID+"']").addClass("userRated").attr("data-ratyscore", this.rating);
								
							})
							$.each(ajxUser.ratedQuotes, function(){
								$("div.quote[data-id='"+this.quoteID+"']").attr("data-ratyscore", this.rating).parent().addClass("userRated");
							})
							dfr[1].resolve();
					})
					}
				})
			}else{$.when(dfr[0]).done(dfr[1].resolve)}
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
			dfr[0].resolve();
			linkSearchResults();
		}