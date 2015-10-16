
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<link
	href='https://fonts.googleapis.com/css?family=Alegreya&subset=latin,latin-ext'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="/Quotes/CSS/bootstrap.css">
<link rel="stylesheet" href="/Quotes/CSS/styles.css">
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="/Quotes/CSS/js/login.js"></script>
<script src="/Quotes/CSS/js/search.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Results</title>
</head>
<body>
	<c:import url="/Menu.jsp"></c:import>
	
			
				<form id="quoteSubmission" class="form-horizontal" action="">
					<fieldset>
					<legend>Submit a Quote</legend>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="quoteText">Quote Text:</label>
						<div class="col-sm-8">
							<textarea class="form-control" rows="7" id="quoteText"></textarea>
						</div>
						<div class="col-sm-2 control-label validator">
						validation
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="author">Author:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="author">
						</div>
						<div class="col-sm-2 control-label validator">
						validation
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="source">Source:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="source">
						</div>
						<div class="col-sm-2 control-label validator">
						validation
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="tag1">Tags:</label>
						<div class="col-sm-2">
							<input type="text" class="form-control tag" id="tag1">
						</div>
						<div class="col-sm-2">
							<input type="text" class="form-control tag" id="tag2">
						</div>
						<div class="col-sm-2">
							<input type="text" class="form-control tag" id="tag3">
						</div>
						<div class="col-sm-2">
							<input type="text" class="form-control tag" id="tag4">
						</div>
			
						<div class="col-sm-2 control-label validator">
						validation
						</div>
					</div>
					<div class="form-group">
					<div class="centerbtn">
					<button id="quotesubmitbtn" type="submit" class="btn btn-default">Submit Quote</button>
					</div>
					</div>
				
					
		
</fieldset>

	</form>
</body>