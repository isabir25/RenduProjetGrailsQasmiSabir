
<html>
	<head>
        <meta name="layout" content="application"/>	
		<title><g:message code="response.edit.label" /></title>    
    </head>
    <body>
    
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	
	<g:hasErrors bean="${answer}">
		<g:eachError><p><g:message error=""/></p></g:eachError>
	</g:hasErrors>
		
		<section id="content">
		<div class="container">
			<h4><g:message code="response.edit.label" /></h4>
			<div class="row">
				<div class="col-lg-12">				
					<form id="contactform" method="post" class="validateform" name="send-contact" onsubmit="return checkForm(this);">
						<g:hiddenField name="idQuestion" value="${idQuestion}" />	
						<g:hiddenField name="idAnswer" value="${answer?.id}" />	
						<div class="col-lg-12 margintop10 field">
							<g:textArea name="body" rows="12"  class="input-block-level" placeholder="* ${message(code: 'answer.label', default: 'Your answer')} ..." 
							data-rule="required" data-msg="input-block-level" 
							placeholder="* ${message(code: 'question.msg.error', default: 'Question')}" 
							value="${answer?.body}"/>
							<div class="validation">
							</div>					
							<p>
							<fieldset class="buttons">
								<g:actionSubmit class="btn btn-theme margintop10 pull-left" 
								action="update" 
								value="${message(code: 'default.button.update.label', default: 'Update')}" />				
							</fieldset>
							</p>
						</div>	
						<!-- render -->
					</form>
				</div>
			</div>
		</div>
		</section>
		
<script type="text/javascript"> 
function checkForm(form) {
	
	if(form.body.value == "") {
		 alert("Error: body cannot be blank!"); 
		 form.body.focus();
		 return false; 
	} re = /^\w+$/; 
	if(form.body.value.length < 50) {
		  alert("Error: Answre must contain at least 50 characters!"); 
		  form.body.focus(); 
		  return false; 
	} 
		return true; 
} 

</script>
	</body>
</html>
