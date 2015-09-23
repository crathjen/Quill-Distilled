<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search</title>
</head>
<body>
<form action="/Quotes/search" method=post>
<label>Search for quotes: 
<input type="text" name="searchExpression" placeholder="Enter Search Expression" /></label>
<select name="searchType">
<option value="authorLN" selected>Author's Last Name </option>
<option value="tag">Tag</option>
<option value="quoteText">Quote Text</option>
<option value="random"></option>
<option value="authorFN">Author's Full Name </option>
<option value="bookTitle">Book Title </option>
</select>
<input type="submit" value="Search for Quotes"/>
</form>
</body>
</html>