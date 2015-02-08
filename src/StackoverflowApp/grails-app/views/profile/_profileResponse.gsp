
	<div class="container">
		<g:each in="${getResponses}" var="responce">
			<div class="row">
				<div class="col-lg-1">
					<ul class="cat">
						<li><i class="icon-angle-right"></i>
							<g:formatDate format="yy-MM-dd" date="${responce?.createDate}"/>									
						</li>
					</ul>
				</div>				
				<div class="col-lg-3">					
					<div class="widget">
						<ul class="recent">
							<li>
								<img src="${resource(dir:'images/photos',file:'thumb1.jpg')}" class="pull-left" alt="" />
									
								<p>
									<font size="1"><g:message code="answredby.label" /></font>&nbsp;
									<font size="3"><g:message code="${responce?.profile.firstName} 
													${responce?.profile.lastName}"/><br></font>
									<code><g:message code="${responce?.profile.reputation?.calculateValue()} "/></code> 
									
								</p>
							</li>
						</ul>
					</div>
				</div>				
				<div class="col-lg-8">
					<h5 class="widgetheading">			
						<ul class="cat">
							<li><i class="icon-angle-right"></i>
								<g:link controller="question" action="show" params="[identifier: responce?.question?.id]">
									${responce?.question?.title}
								</g:link>
							</li>
						</ul>
					</h5>
				</div>	
			</div>	
			
		</g:each>
	</div>
