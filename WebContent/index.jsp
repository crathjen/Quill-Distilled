<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href='https://fonts.googleapis.com/css?family=Alegreya&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
<!-- <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script> -->

<script src="/Quotes/FrontEnd/js/jquery-2.1.4.min.js"></script>
<script src="//d3js.org/d3.v3.min.js" charset="utf-8"></script>
<script src="/Quotes/FrontEnd/jQueryUI/jquery-ui.min.js"></script>
<script src="/Quotes/FrontEnd/jQueryRaty/jquery.raty.js"></script>
<script src="/Quotes/FrontEnd/js/login.js"></script>
<script src="/Quotes/FrontEnd/js/search.js"></script>
<script src="/Quotes/FrontEnd/js/navigation.js"></script>
<script src="/Quotes/FrontEnd/js/submit.js"></script>
<script src="/Quotes/FrontEnd/js/d3.js"></script>
<link rel="stylesheet" href="FrontEnd/css/bootstrap.css">
<link rel="stylesheet" href="FrontEnd/jQueryUI/jquery-ui.css">

<link rel="stylesheet" href="FrontEnd/css/styles.css">
<link rel="stylesheet" href="FrontEnd/jQueryRaty/jquery.raty.css">
<link rel="shortcut icon" href="FrontEnd/images/oncemore.ico?" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quill Distilled</title>

</head>
<body>

<c:import url="Menu.jsp"></c:import>
<div class="bodyContent">
<ul id="quoteResults">
<li class="quoteContainer">
<div class="welcomeSplash"><h2>Welcome to the Quill Distilled!</h2>

<h4>&bull;&nbsp;Click 'Get Random Quote' to discover something insightful.</h4><h4>  &bull;&nbsp;The search bar (with auto-complete) can help you select an author or tag that interests you.</h4>
<h4>&bull;&nbsp;Once you have search results, you can experiment with the 'WordPlay' options to cipher a quote or translate it to pig latin!</h4>
<h4>&bull;&nbsp;You can click on tags or authors in your search results to perform an additional search.</h4>
<h4>&bull;&nbsp;The 'D3' button will show you some visualizations of data regarding the quotes hosted here. </h4>
<br>
<h4>Thanks for visiting!  To find out more about the developer explore the links below. </h4></div>
</li>
</ul>

</div>
<c:import url="footer.jsp"></c:import>
</body>
</html>