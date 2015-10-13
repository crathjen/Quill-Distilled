
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Alegreya&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/Quotes/CSS/bootstrap.css">
<link rel="stylesheet" href="/Quotes/CSS/styles.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="/Quotes/CSS/js/login.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Results</title>
</head>
<body>
	<c:import url="/Menu.jsp"></c:import>
	<c:if test="${empty results}">
	I'm sorry but we could not find any results.
	<br>
	<a href ="/Quotes/navigate/search">return to search page ...</a>
	</c:if>
	<c:if test="${!empty results }">
	<ul id="quoteResults">
		<c:forEach var="quote" items="${results}">
			
				<li><div class="quote">
					${quote.quoteText}
					<span class="objinfo" hidden="true"></span>
					
				</div>
				
				<c:if test="${!empty quote.author}">
					<div class="author">
					Author:	<span class="author">${quote.author.firstName} ${quote.author.lastName}<span class="objinfo" hidden="true">${quote.author.id}</span></span>
						</div>
						<c:if test="${!empty quote.quoteSource}">
							<div class="source">
							Book: <span class="book">${quote.quoteSource.sourceTitle}<span class="objinfo" hidden="true">${quote.quoteSource.id}</span></span>
						
							</div>
						</c:if>
					
					
				</c:if>
				
				
				<c:if test="${!empty quote.tags}">
				
					<div class="tags">
					
					Tags: 
					<c:forEach var="tag" items="${quote.tags}">
							<span class="tag">${tag.tagText} <span class="objinfo" hidden="true">${tag.id}</span></span>
					</c:forEach>
					</div>
				</c:if>
		
		</li>
		</c:forEach>
		</ul>
	</c:if>
</body>
</html>