
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Results</title>
</head>
<body>
	<c:if test="${empty results}">
	I'm sorry but we could not find any results.
	<br>
	<a href ="/Quotes/navigate/search">return to search page ...</a>
	</c:if>
	<c:if test="${!empty results }">
		<c:forEach var="quote" items="${results}">
			
				
					${quote.quoteText}
					<br/><br>
				
				
				<c:if test="${!empty quote.author}">
		<table>
					<tr>
						<td>Author:	${quote.author.firstName} ${quote.author.lastName}</td>
					
						</tr>
						
						<c:if test="${!empty quote.quoteSource}">
							<tr>
							<td>Book: ${quote.quoteSource.sourceTitle}</td>
							</tr>
						</c:if>
					
					</table>
				</c:if>
				
				
				<c:if test="${!empty quote.tags}">
				
					<table>
					<tr>
					<td>Tags: </td>
					<c:forEach var="tag" items="${quote.tags}">
							<td>${tag.tagText} </td>
					</c:forEach>
					</tr>
					</table>
				</c:if>
		<br><br>
		</c:forEach>
	</c:if>
</body>
</html>