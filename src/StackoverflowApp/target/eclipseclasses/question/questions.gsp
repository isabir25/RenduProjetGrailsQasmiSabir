<html>
	<head>
	
        <meta name="layout" content="application"/>
		<g:set var="entityName" value="${message(code: 'questions.label', default: 'questions')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>    	
	</head>
	<body>
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
				<tbody>
				<g:each in="${questions}" var="question">
						<tr>
							<td>
								<td><g:link action="show" params="[identifier: question?.id]">
									<g:message code="${question?.title }" />
								</g:link></td>
							</td>							
						</tr>
				</g:each>
				</tbody>
			</table>			
	</body>
</html>