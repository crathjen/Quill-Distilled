<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
	<h1>Page Still Under Construction</h1>
	<h1>${user.username}</h1>

	<div>
		<h5>Tags You're Interested In</h5>
		<ul id="userTags">
			<c:if test="${!empty user.userInterests}">
				<c:forEach var="tag" items="${user.userInterests}">
					<li>${tag.tagText}</li>
				</c:forEach>
			</c:if>
		</ul>
	</div>
	<div>
		<h5>Authors You've Rated</h5>
		<c:if test="${!empty user.ratedAuthors}">
			<ul id="userauthorRatings">
				<c:forEach var="authorRating" items="${user.ratedAuthors}">
					<li>${authorRating.author.lastName}${authorRating.rating}</li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
	<div>
		<h5>Quotes You've Rated</h5>
		<c:if test="${!empty user.ratedQuotes}">
			<ul id="userQuoteRatings">
				<c:forEach var="quoteRating" items="${user.ratedQuotes}">
					<li>${quoteRating.quotation.quoteText}${quoteRating.rating}</li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
	<h5>Content You've Submitted</h5>
</div>