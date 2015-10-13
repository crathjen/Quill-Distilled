

<div id = "menu">

<div class="container-fluid">
<div class="row">
<div class="col-sm-6 col-xs-12"><img src="/Quotes/CSS/images/large_title_graphic.png">
</div>
<div id="searchForm" class="col-sm-6 col-xs-12">
<form  class="form-inline" action="/Quotes/search" method=post>

<div class="input-group">

<input class="form-control" type="text" name="searchExpression" autofocus/>
<span class="input-group-btn">
<button class="btn btn-default" type="submit">Search</button></span>
</div>

<select class="form-control" name="searchType">
<option value="authorLN" selected>Author's Last Name </option>
<option value="tag">Tag</option>
<option value="quoteText">Quote Text</option>
<option value="authorFN">Author's Full Name </option>
<option value="bookTitle">Book Title </option>
</select>
<!-- <input class="form-control" type="submit" value="Search for Quotes"/> -->
</form></div></div></div>
<hr>
<ul>
<li><a href="/Quotes/search/random" >Get Random Quote</a></li>
<li><a href="/Quotes/account">Account</a></li>
<li id = "login"><form><input id ="username" placeholder="username"></input><input id = "password" type="password" placeholder="password"></input><a id=loginlink>Sign In</a></form></li>


</ul>
</div>