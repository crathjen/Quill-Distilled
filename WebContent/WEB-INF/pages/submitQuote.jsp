
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

	
	

				<form id="quoteSubmission" class="form-horizontal" action="">
					<fieldset>
					<legend>Submit a Quote</legend>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="quoteText">Quote Text* :</label>
						<div class="col-sm-8">
							<textarea class="form-control" rows="7" id="quoteText"></textarea>
						</div>
						
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="author">Author* :</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="author" name="author">
						</div>
						
						
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="source">Source:</label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="source">
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
			
				
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="rating">Your Rating (1-5): </label>
						<div class="col-sm-2">
							<input type="number" min="1" max="5" required class="form-control" id="rating">
						</div>
						<label class="col-sm-2 control-label" for="submittingUser">Submitting User: </label>
						<div class="col-sm-2">
							<input type="text" class="form-control tag" id="submittingUser">
						</div>
						<div class="col-sm-2">
						<button id="quotesubmitbtn" type="button" onClick="alert('still working on this functionality: check back soon')"class="btn btn-default">Submit Quote</button>
						</div>
					</div>
				
					
		
	</fieldset>

	</form>
	
