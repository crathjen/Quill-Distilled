 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication var ="user" property="principal"/>
<div id="menu">

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-6 col-xs-12">
				<img src="/Quotes/FrontEnd/images/large_title_graphic.png">
			</div>
			<div id="searchForm" class="col-sm-6 col-xs-12">
				<form id="menuSearchForm" class="form-inline" action="/Quotes/search" method=post>

					<div class="input-group">

						<input id="searchExpression" class="form-control" type="text" name="searchExpression"
							autofocus /> <span class="input-group-btn">
							<button id="menuSearchBtn" class="btn btn-default" type="submit">Search</button>
						</span>
					</div>

					<select class="form-control" name="searchType">
						<option value="authorLN" selected>Author's Last Name</option>
						<option value="tag">Tag</option>
						<option value="quoteText">Quote Text</option>
						<option value="authorFN">Author's Full Name</option>
						<option value="bookTitle">Book Title</option>
					</select>
					<!-- <input class="form-control" type="submit" value="Search for Quotes"/> -->
				</form>
			</div>
		</div>
	</div>
	<hr>
	<ul>
		<li><a id="randombtn"><!-- href="/Quotes/search/random" -->Get Random Quote</a></li>
		<li><a id="submitqtbtn">Submit a Quote</a></li>
		<li><a id="wordPlay">WordPlay</a>
			<ul>
				<li><a>Cipher Service</a></li>
				<li><a>Piggify</a></li>
			
			</ul>
		</li>
		
		
		
<%-- 		<c:if test="${user.equals(\"anonymousUser\")}"> --%>
			<li class="login"><a>Sign Up</a></li>
			<li class="login"><form id="loginForm">
				<input id="username" name="username" placeholder="username"></input><input
					id="password" name="password" type="password" placeholder="password"></input><a
					id=loginlink>Sign In</a>
			</form></li>
<%-- 		</c:if> --%>
<%-- 		<c:if test="${!user.equals(\"anonymousUser\")}"> --%>
			<li id="user" class="user"><a><c:if test="${!user.equals(\"anonymousUser\")}">${user.username}</c:if></a>
			<ul>
				<li><a id="homebtn">Home</a></li>
				<li><a>Account Summary</a></li>
				<li><a>Interests</a></li>
				<li><a id="signoutbtn">Sign Out</a></li>
			</ul>
			</li>
<%-- 		</c:if> --%>
		

	</ul>
</div>