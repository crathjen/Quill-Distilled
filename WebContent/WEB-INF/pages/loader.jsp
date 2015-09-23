<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Web Scraping</title>
</head>
<body>
	<form action="scrape">
	<input type="text" size="48" name="url" value="${url}">
	<input type="submit" value="Scrape">
	</form>
	<c:if test="${!empty url}">
		Success with ${url}
	</c:if>
</body>
</html>