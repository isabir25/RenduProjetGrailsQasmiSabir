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
						<g:sortableColumn property="name" title="${message(code: 'tag.label', default: 'Tag name')}" />
						<g:sortableColumn property="description" title="${message(code: 'description.label', default: 'Description')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${tags}" var="tagElem">
						<tr>
							<td>${tagElem.name}</td>
							<td>${tagElem.description}</td>
							<td>
								<sec:ifAllGranted roles="ROLE_ADMIN">
									<table>
										<tr>
											<td><g:link controller="Tags" action="show" params="[identifier: tagElem.id]">
												<g:message code="default.button.edit.label" default="Edit" />
											</g:link></td>
											
											<td><g:link controller="Tags" action="delete" params="[identifier: tagElem.id]" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >
												<g:message code="default.button.delete.label" default="Delete" />
											</g:link></td>
				                
										</tr>
									</table>
								</sec:ifAllGranted>	
							</td>
						</tr>
				</g:each>
				</tbody>
			</table>			
		<sec:ifAllGranted roles="ROLE_ADMIN">
					<td><g:link controller="Tags" action="create">
						<g:message code="default.button.create.label" default="Create" />
					</g:link></td>
		</sec:ifAllGranted>
	</body>
</html>