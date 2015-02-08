<html>
	<head>
        <meta name="layout" content="application"/>		
		<title><g:message code="askQuestion.label" /></title> 
		
	</head>
    <body>
    <div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h4><g:message code="askQuestion.label" /></h4>
				
		    	<g:if test="${flash.message}">
					<div class="message" role="status">${flash.message}</div>
				</g:if>
					
		    	<g:hasErrors bean="${question}">
				    <g:eachError><p><g:message error=""/></p></g:eachError>
				</g:hasErrors>
						
				<form id="contactform" method="post" class="validateform" name="send-contact">
					<div id="sendmessage">
						 Your message has been sent. Thank you!
					</div>
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
						</div>						
						<div class="col-lg-4 field">	
					        <div class="select2-container select2-container-multi populate placeholder" id="s2id_e2_2" style="width: 250px"> 
    							<g:select style="width:400px" name="tags"  data-rule="maxlen:4"
								id="e2_2" from="${tags}" 
								optionValue="name" optionKey="id" multiple="true"
								multiple data-placeholder="${message(code: 'tags.select.label', default: 'Ask Question')}"/>
							</div>
							<div class="validation">
							</div>
							<p>
							<fieldset class="buttons">
								<g:actionSubmit class="btn btn-theme margintop10 pull-left" onclick="alert('verification');" action="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />				
							</fieldset>
							</p>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

 <r:script disposition="head">
 	 $(document).ready(function () {
      	 $("#e2_2").select2({
      	                placeholder: "Select a State"
      	            });
      	});
</r:script>	
	</body>
	
</html>