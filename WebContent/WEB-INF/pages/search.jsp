<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search</title>
</head>
<body>
<form action="/Quotes/search/byAuthorLN" method=post>
<label>Author's Last Name: </label>
<input type="text" name="lastName"/>
<input type="submit" value="Search for Quotes"/>
</form>
</body>
</html>