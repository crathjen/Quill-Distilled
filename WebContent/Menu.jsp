

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
<li><a href="/Quotes/navigate/search" >Search for Quotes</a></li>
<li><a href="/Quotes/navigate/login">Sign In</a></li>
<li><a href="/Quotes/navigate/dbloader">Load Quotes Into Database</a></li>
</ul>
</div>