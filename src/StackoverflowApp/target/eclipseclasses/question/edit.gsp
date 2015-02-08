<html>
	<head>
        <meta name="layout" content="application"/>		
		<g:set var="entityName" value="${message(code: 'askQuestion.label', default: 'Ask Question')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>    
	</head>
    <body>
    	<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
    	
    	<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
			
    	<g:hasErrors bean="${question}">
		    <g:eachError><p><g:message error=""/></p></g:eachError>
		</g:hasErrors>

		<g:form method="post" >
			
			<g:hiddenField name="id" value="${question?.id}" />	
			<div>
				<label for="Title">
					<g:message code="question.title.label" default="Title" />
					<span class="">*</span>
				</label>
				<g:textField name="title" value="${question?.title}"/>
			</div>
			<div>
				<g:textArea name="body" rows="10" cols="40" value="${question?.body}"/>
			</div>
			<!-- render -->			
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />				
			</fieldset>
		</g:form>
	</body>
</html>