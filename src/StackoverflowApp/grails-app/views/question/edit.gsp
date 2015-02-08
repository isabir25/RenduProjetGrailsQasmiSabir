<html>
	<head>
        <meta name="layout" content="application"/>		
		<title><g:message code="question.edit.label" /></title>    
	</head>
    <body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4><g:message code="question.edit.label" /></h4>
				
				<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
					
				<g:hasErrors bean="${question}">
					<g:eachError><p><g:message error=""/></p></g:eachError> 
				</g:hasErrors>

				<form id="contactform" method="post" class="validateform" name="send-contact"
				onsubmit="return checkForm(this);" >
					
					<g:hiddenField name="id" value="${question?.id}" />	
					<div class="row">
						<div class="col-lg-4 field">							
							<g:textField name="title" value="${question?.title}"  placeholder="* ${message(code: 'question.title.label', default: 'Ask Question')}"
							 data-rule="maxlen:4" data-msg="${message(code: 'question.title.error', default: 'Title')}"/>
							<div class="validation">
							</div>
						</div>
						<div class="col-lg-12 margintop10 field">
							<g:textArea name="body" rows="12"  class="input-block-level" placeholder="* ${message(code: 'question.label', default: 'Ask Question')} ..." 
							data-rule="required" data-msg="input-block-level" placeholder="* ${message(code: 'question.msg.error', default: 'Question')}" value="${question?.body}"/>
							<div class="validation">
							</div>							
							<p>
								<fieldset class="buttons">
									<g:actionSubmit class="btn btn-theme margintop10 pull-left" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />				
								</fieldset>
							</p>
						</div>						
						
					</div>
				</form>
			</div>
		</div>
	</div>	
	
	 <r:script disposition="head">
		  
			function checkForm(form) {
	
				if(form.title.value == "") {
					 alert("Error: title cannot be blank!"); 
					 form.title.focus();
					 return false; 
				} re = /^\w+$/; 
				if(form.body.value == "") {
					 alert("Error: body cannot be blank!"); 
					 form.body.focus();
					 return false; 
				} re = /^\w+$/; 
				
				if(form.title.value.length < 10) {
					  alert("Error: title must contain at least 10 characters!"); 
					  form.title.focus(); 
					  return false; 
				} 
				if(form.body.value.length < 50) {
					  alert("Error: body must contain at least 50 characters!"); 
					  form.body.focus(); 
					  return false; 
				} 
					return true; 
			} 
	</r:script>	
</body>
</html>
