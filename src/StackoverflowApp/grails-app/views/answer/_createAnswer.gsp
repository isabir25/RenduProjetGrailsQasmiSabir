<div class="col-lg-12">				
	<g:form id="contactform" method="post" class="validateform" name="send-contact"
	onsubmit="return checkForm(this);" controller="answer" >
		<g:hiddenField name="idQuestion" value="${idQuestion}" />	
		<h4><g:message code="your.answre.label" /></h4>
		<div class="col-lg-12 margintop10 field">
			<g:textArea name="body" rows="12" cols="100" class="input-block-level" 
			placeholder="* ${message(code: 'answer.label', default: 'Your answer')} ..." 
			data-rule="required" data-msg="input-block-level" 
			placeholder="* ${message(code: 'question.msg.error', default: 'Question')}" value="${question?.body}"/>
			<div class="validation">
			</div>					
			<p>
			<fieldset class="buttons">
				<g:actionSubmit class="btn btn-theme margintop10 pull-left" action="save" 
				value="${message(code: 'default.button.create.label', default: 'Create')}" />				
			</fieldset>
			</p>
		</div>	
		<!-- render -->
	</g:form>
</div>

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
