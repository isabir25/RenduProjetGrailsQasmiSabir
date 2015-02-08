<html>
	<head>
        <meta name="layout" content="application"/>		
		<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
		<title><g:message code="tag.all.label" args="[entityName]" /></title>    
	</head>
	<body>		
		<section id="content">
		<div class="container">
				
			<!-- end divider -->
			<div class="row">
				<div class="col-lg-12">
					<h4><g:message code="tag.all.label" args="[entityName]" /></h4>
				</div>
				<g:each in="${tags}" var="tagElem">				
					<div class="col-lg-3">
						<div class="pricing-box-alt">
							<div class="pricing-heading">
								<h3>${tagElem.name}</h3>
							</div>
							<div class="pricing-terms">
								<h6>${tagElem.description}</h6>
							</div>
							
							<div class="pricing-action">
								<sec:ifAllGranted roles="ROLE_ADMIN">
									
									<g:link controller="Tags" action="show" params="[identifier: tagElem.id]" class="btn btn-medium btn-theme">
										<i class="icon-bolt"></i> <g:message code="default.button.edit.label" default="Edit" />
									</g:link>
											
									<g:link controller="Tags" action="delete" params="[identifier: tagElem.id]" class="btn btn-medium btn-theme" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >
										<i class="icon-bolt"></i> <g:message code="default.button.delete.label" default="Delete" />
									</g:link>
								
								</sec:ifAllGranted>	
							</div>
						</div>
					</div>
				</g:each>
			</div>
			<div class="pricing-action">			
				<sec:ifAllGranted roles="ROLE_ADMIN">
						<g:link controller="Tags" action="create" class="btn btn-primary">
							<i class="fa fa-cog"></i><g:message code="default.button.create.label" default="Create" />
						</g:link>
				</sec:ifAllGranted>
			</div>
		</div>
	</section>

		
	</body>
</html>
