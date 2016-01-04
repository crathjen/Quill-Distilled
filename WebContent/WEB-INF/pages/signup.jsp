
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

	
	

				<form id="signupForm" class="form-horizontal">
					<fieldset>
					<legend>Create an Account</legend>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="emailSU">Email:</label>
						<div class="col-sm-6">
							<input type="text" class="form-control"  id="emailSU" name="email" placeholder="Required">
						</div>
						<div class="col-sm-3 validation"></div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="firstNameSU">First Name:</label>
						<div class="col-sm-6">
							<input type="text" class="form-control"  id="firstNameSU" name="firstName" placeholder="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="lastNameSU">Last Name:</label>
						<div class="col-sm-6">
							<input type="text" class="form-control"  id="lastNameSU" name="lastName" placeholder="">
						</div>
						
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label" for="usernameSU">Username:</label>
						<div class="col-sm-6">
							<input type="text" class="form-control"  id="usernameSU" name="username" placeholder="Required">
						</div>
						
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="passwordSU">Password:</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="passwordSU" name="password" placeholder="Required">
						</div>
						
						 </div>
					<div class="form-group">
						<label class="col-sm-3 control-label" for="passwordConfirmSU">Confirm your Password:</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="passwordConfirmSU">
						</div>
						
					</div>
					
					<div class="form-group">

						<div class="col-sm-12" style="text-align:center">
						<button id="signupsubmitbtn" type="button" class="btn btn-default">Create Your Account</button>
						</div>
					</div>
				
					
		
	</fieldset>
	</form>
	
