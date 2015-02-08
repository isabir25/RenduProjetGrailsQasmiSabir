
<h4><g:message code="profile.signin.label"/></h4>

<g:if test='${flash.message}'>
	<div class='login_message'>${flash.message}</div>
</g:if>

<g:form autocomplete='off' method="post" controller="profile" onsubmit="return checkForm(this);">
	<p>
		<g:textField name="firstName"  placeholder="* ${message(code: 'profile.firstName.label', default: 'firstName')}"
		data-rule="maxlen:4" />			
	</p>

	<p>
		<g:textField name="lastName"  placeholder="* ${message(code: 'profile.lastName.label', default: 'lastName')}"
		data-rule="maxlen:4" />
	</p>

	<p>
		<g:datePicker name="birthDate"  precision="month"  precision="day" relativeYears="[-100..-8]"/>
	</p>

	<p>
		<g:textField name="username"  placeholder="* ${message(code: 'profile.username.label', default: 'username')}"
		data-rule="maxlen:4" />
	</p>
	
	<p>
		<g:field type="password" name="password"  placeholder="* ${message(code: 'profile.password.label', default: 'password')}"
		data-rule="maxlen:4" />
	</p>
	
	<p>
		<g:field type="password" name="password2"  placeholder="* ${message(code: 'profile.password.label', default: 'password')}"
		data-rule="maxlen:4" />
	</p>
	
	<p>
		<g:actionSubmit class="btn btn-primary" action='createProfile'
		id="submit" value="${message(code: 'profile.signin.button', default: 'Sign in')}" />
	</p>
</g:form>

<script type="text/javascript"> 
function checkForm(form) {
	
	if(form.firstName.value == "") {
		 alert("Error: firstName cannot be blank!"); 
		 form.firstName.focus();
		 return false; 
	} re = /^\w+$/; 
	if(form.lastName.value == "") {
		 alert("Error: lastName cannot be blank!"); 
		 form.lastName.focus();
		 return false; 
	} re = /^\w+$/; 
	
	if(form.username.value == "") {
		 alert("Error: Username cannot be blank!"); 
		 form.username.focus();
		 return false; 
	} re = /^\w+$/; 
	if(!re.test(form.username.value)) {
		 alert("Error: Username must contain only letters, numbers and underscores!"); 
		 form.username.focus(); 
		 return false; 
	} 
	if(form.password.value != "" && form.password.value == form.password2.value) {
		 if(form.password.value.length < 6) {
			  alert("Error: Password must contain at least six characters!"); 
			  form.password.focus(); 
			  return false; 
		} 
		if(form.password.value == form.username.value) {
			 alert("Error: Password must be different from Username!"); 
			 form.password.focus(); 
			 return false; 
		} re = /[0-9]/; 
		if(!re.test(form.password.value)) { 
			alert("Error: password must contain at least one number (0-9)!"); 
			form.password.focus(); 
			return false; 
		} re = /[a-z]/; 
		if(!re.test(form.password.value)) { 
			alert("Error: password must contain at least one lowercase letter (a-z)!"); 
			form.password.focus(); 
			return false; } re = /[A-Z]/; 
			if(!re.test(form.password.value)) { 
				alert("Error: password must contain at least one uppercase letter (A-Z)!");
				form.password.focus();
				 return false; 
		} 
	   } else { 
		    alert("Error: Please check that you've entered and confirmed your password!");
			form.password.focus(); 
			return false; 
	    } 
		return true; 
} 

</script>
