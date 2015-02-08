<html>
	<head>
        <meta name="layout" content="application"/>	
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>    	
	</head>
	<body>
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'question.title.label', default: 'Title')}" />
						<g:sortableColumn property="description" title="${message(code: 'question.profile.name.label', default: 'Author')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${listAskedQuestions}" var="questionElem">
						<tr>
							<td>${questionElem.title}</td>
							<td>${questionElem.profile.firstName}</td>
							<td>
								<sec:ifAllGranted roles="ROLE_ADMIN">
									<table>
										<tr>${questionElem.id }
											<td><g:link controller="Question" action="show" params="[identifier: questionElem.id]">
												<g:message code="default.button.edit.label" default="Edit" />
											</g:link></td>
															                
										</tr>
									</table>
								</sec:ifAllGranted>	
							</td>
						</tr>
				</g:each>
				</tbody>
			</table>			
	</body>
</html>