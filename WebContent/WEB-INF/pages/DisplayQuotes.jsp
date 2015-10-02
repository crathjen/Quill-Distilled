
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Alegreya&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/Quotes/CSS/bootstrap.css">
<link rel="stylesheet" href="/Quotes/CSS/styles.css">
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
					
				</div>
				
				<c:if test="${!empty quote.author}">
					<table class="author">
					<tr>
						<td>Author:	</td><td class=author>${quote.author.firstName} ${quote.author.lastName}</td>
					
						</tr>
						</table>
						<c:if test="${!empty quote.quoteSource}">
							<table class="source">
							<tr>
							<td>Book: ${quote.quoteSource.sourceTitle}</td>
							</tr>
							</table>
						</c:if>
					
					
				</c:if>
				
				
				<c:if test="${!empty quote.tags}">
				
					<table class="tags">
					<tr>
					<td>Tags: </td>
					<c:forEach var="tag" items="${quote.tags}">
							<td class="tag">${tag.tagText} </td>
					</c:forEach>
					</tr>
					</table>
				</c:if>
		
		</li>
		</c:forEach>
		</ul>
	</c:if>
</body>
</html>