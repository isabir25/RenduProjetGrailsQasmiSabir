
<html>
	<head>
        <meta name="layout" content="application"/>	
		<title><g:message code="tag.edit.label"/></title>    
    </head>
    <body>
	<section id="content">
		<div class="container">
			<h4><g:message code="tag.edit.label"/></h4>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
	    	<g:hasErrors bean="${tag}">
			    <g:eachError><p><g:message error=""/></p></g:eachError>
			</g:hasErrors>
					
				<form id="contactform" method="post" class="validateform" name="send-contact">
					<div id="sendmessage">
						 Your message has been sent. Thank you!
					</div>
					<g:hiddenField name="id" value="${tag?.id}" />	
					<div class="row">
						<div class="col-lg-4 field">							
							<g:textField name="name" value="${tag?.name}"  placeholder="* ${message(code: 'tag.label', default: 'Tag label')}"
							 data-rule="maxlen:4" data-msg="${message(code: 'question.title.error', default: 'Title')}"/>
							<div class="validation">
							</div>
						</div>
						<div class="col-lg-12 margintop10 field">
							<g:textArea name="description" value="${tag?.description}" rows="12"  class="input-block-level" placeholder="* ${message(code: 'description.label', default: 'Description')} ..." 
							data-rule="required" data-msg="input-block-level" placeholder="* ${message(code: 'question.msg.error', default: 'Question')}" />
							<div class="validation">
							</div>
							<p>
							<fieldset class="buttons">
								<g:actionSubmit class="save" action="update" class="btn btn-theme margintop10 pull-left"
								value="${message(code: 'default.button.update.label', default: 'Update')}" />	
											
							</fieldset>
							</p>
						</div>						
					</div>
				</form>
			</div>
		</section>
	</body>
</html>
