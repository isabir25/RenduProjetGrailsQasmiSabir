<html>
	<head>
        <meta name="layout" content="application"/>		
		<title><g:message code="profile.edit.label" /></title> 
		
	</head>
<body>
    <div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4><g:message code="profile.edit.label" /></h4>

				<g:if test='${flash.message}'>
					<div class='login_message'>${flash.message}</div>
				</g:if>

				<form id="contactform" method="post" class="validateform" name="send-contact">
					<div class="row">
					<g:hiddenField name="idProfile" value="${profile?.id}" />	
					<p>
						<div class="col-lg-4 field">	
						<g:textField name="firstName"  placeholder="* ${message(code: 'profile.firstName.label', default: 'firstName')}"
						data-rule="maxlen:4" value="${profile?.firstName}"/>			
						</div>
							<!-- divider -->
						<div class="row">
							<div class="col-lg-12">
							</div>
						</div>
					</p>
	
					<p>
						<div class="col-lg-4 field">	
						<g:textField name="lastName"  placeholder="* ${message(code: 'profile.lastName.label', default: 'lastName')}"
						data-rule="maxlen:4" value="${profile?.lastName}"/>
						</div>
						<div class="row">
							<div class="col-lg-12">
							</div>
						</div>
					</p>

					<p>
						<div class="col-lg-4 field">	
						<g:datePicker name="birthDate"  precision="month"  precision="day" relativeYears="[-80..20]"
						value="${profile?.birthDate}" />
						</div>
						<div class="row">
							<div class="col-lg-12">
							</div>
						</div>
					</p>

						<div class="col-lg-12 margintop10 field">
						<g:textArea name="aboutMe" rows="8" class="input-block-level"
						placeholder="* ${message(code: 'profile.aboutMe.label', default: 'aboutMe')}"
						value="${profile?.aboutMe}" />
							<p>
								<fieldset class="buttons">
									<g:actionSubmit class="btn btn-primary" action='updateProfile'
									id="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
								</fieldset>
							</p>
						</div>				
					</div>
				</form>
			</div>
		</div>
	</div>
</body>		
</html>
