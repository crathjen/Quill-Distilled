/**
 * 
 */
$(document)
		.ready(
				function() {
					function loadSubmitForm(data) {
						$(".bodyContent").html(data);
					}
					var submitqt = $("#submitqtbtn")
					submitqt.click(function() {
						$.ajax({
							url : "/Quotes/navigate/submitQuote",
							dataType : "html",
							success : function(data) {
								loadSubmitForm(data);
								initializeSubmitForm();
							},
							error : ajaxerror
						})

					})
					$("#signupbtn").click(function() {
						$.ajax({
							url : "/Quotes/navigate/signUp",
							dataType : "html",
							success : function(data) {
								loadSubmitForm(data);
								initializeSUValidation();
							}
						})
					})
					function initializeSUValidation() {
						var email = $("#emailSU");
						var waitForValidation = {};
						email.on("blur", function(evt) {
							email.parent().next().remove();
							email.removeClass("hasErrors")

							waitForValidation = $.ajax({
								url : "/Quotes/REST/signupval/email",
								data : "email=" + email.val(),
								success : function(data) {
									if (data !== "g2g") {
										email.parent().after(
												'<div class="col-sm-3 validation">'
														+ data + '</div>');
										email.addClass("hasErrors")
									}
								}

							})

						})
						var username = $("#usernameSU");
						username.on("blur", function(evt) {
							username.parent().next().remove();
							username.removeClass("hasErrors")

							waitForValidation = $.ajax({
								url : "/Quotes/REST/signupval/username",
								data : "username=" + $(evt.target).val(),
								success : function(data) {
									if (data !== "g2g") {
										username.parent().after(
												'<div class="col-sm-3 validation">'
														+ data + '</div>');
										username.addClass("hasErrors")
									}
								}

							})

						})
						var password1 = $("#passwordSU");
						password1
								.on(
										"change",
										function() {
											if (password1.val() !== '') {
												password2.val("");
												if (password2.parent().next().length === 0)
													password2
															.parent()
															.after(
																	'<div class="col-sm-3 validation">Passwords don\'t match</div>');
												password2.addClass("hasErrors")
											}
										})
						var password2 = $("#passwordConfirmSU");
						password2
								.on(
										"keyup",
										function(evt) {

											if (password2.parent().next().length === 1) {
												if (password1.val() === password2
														.val()) {
													password2.parent().next()
															.remove();
													password2.removeClass("hasErrors");
												}
											} else 
												if (password1.val() !== password2
														.val()) {
													password2
															.parent()
															.after(
																	'<div class="col-sm-3 validation">Passwords don\'t match</div>');
													password2.addClass("hasErrors");
												
											}
										})
						var submitform = $("#signupsubmitbtn");
						submitform.on("click", function(evt){
						
							$.when(waitForValidation).then(function(){
								var submittable=true;
								$("#emailSU, #passwordSU, #usernameSU, #passwordConfirmSU").each(function(){
									if ($(this).val()===""||$(this).hasClass("hasErrors")){
										alert("Please provide valid entries for all required fields");
										submittable=false;
										return false;
									}
								})
								
								if(submittable){
									$.ajax({
										url:"/Quotes/REST/newUser",
										data: $("#signupForm").serialize(),
										success: function(data){
											console.log(data)
											if (data===1)
												$.ajax({url:"/Quotes/login", method:"post", data:$("#usernameSU, #passwordSU").serialize()}).done(function(){window.location.reload(true)})
											else alert("A server-side error was encountered")
										}
									})
								}
							})
						})

					}
					
					var home = $("#homebtn")
					home.click(function() {
						$.ajax({
							url : "/Quotes/navigate/userHome",
							dataType : "html",
							success : loadSubmitForm,
							error : ajaxerror
						})

					})

				})