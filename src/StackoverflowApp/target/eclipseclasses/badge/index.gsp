<html>
	<head>
        <meta name="layout" content="application"/>	
		<g:set var="entityName" value="${message(code: 'badge.label', default: 'Tag')}" />
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
				<g:each in="${badge}" var="badgeElem">
						<tr>
							<td>${badgeElem.level.icon}</td>
							<td>${badgeElem.name}</td>
							<td>${badgeElem.description}</td>
						</tr>
				</g:each>
				</tbody>
			</table>		
	</body>
</html>