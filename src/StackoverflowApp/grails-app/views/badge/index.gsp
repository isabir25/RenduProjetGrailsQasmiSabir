<html>
	<head>
        <meta name="layout" content="application"/>	
		<title><g:message code="badge.all.label" /></title>    	
	</head>
	<body>
		
		
		<section id="content">
		<div class="container">
				
			<!-- end divider -->
			<div class="row">
				<div class="col-lg-12">
					<h4><g:message code="badge.all.label" /></h4>
				</div>
				<g:each in="${badge}" var="badgeElem">		
					<div class="col-lg-3">
						<div class="pricing-box-alt">
							<div class="pricing-heading">
								<h3>${badgeElem.name}</h3>
							</div>
							<div class="pricing-terms">
								<h6>${badgeElem.description}</h6>
							</div>
							
							<div class="pricing-action">								
								<font size="15" color="${badgeElem.level.icon} ">*</font>	
							</div>
						</div>
					</div>
				</g:each>
			</div>
		</div>
	</section>
	
	</body>
</html>
