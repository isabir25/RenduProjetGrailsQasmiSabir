

<g:each in="${questions}" var="question">										
	<div class="row">
		<div class="col-lg-2">								
			<ul class="recent" style="text-align : center;">
				<li >
					${question?.votesNumber }</br>
					<g:message code="votes.label" />
				</li>
				<li>		
					${question?.answers?.size() }<br>
					<g:message code="answres.label" />
				</li>
				<li>
					${question?.viewsNumber }</br>
					<g:message code="views.label" />
				</li>
			</ul>
		</div>						
		<div class="col-lg-10">	
			<!--div  style="text-align : center;"-->
			<h5 class="widgetheading"><g:link action="show" params="[identifier: question?.id]">
					<g:message code="${question?.title }" />
				</g:link></h5>
			<ul class="recent">
				<li>
					<img src="img/dummies/blog/65x65/thumb1.jpg" class="pull-left" alt="" />
					
					<p>
						<p class="cat">									
								${question?.body[0..50] }...
						</p>				
																		
					</p>
				</li>
				<li>
					<div class="widget">
						<ul class="recent">
							
							<div class="row">
								<div class="col-lg-4">
									<div class="widget">
										<ul class="tags">											
											<g:each in="${question?.tags}" var="tag">								
												<li><a href="#">${tag?.name}</a></li>
											</g:each>
										</ul>
									</div> 	
								</div>
								<div class="col-lg-4">
								</div>
								<div class="col-lg-4">
									<li>
										<img src="${resource(dir:'images/photos',file:'thumb1.jpg')}" class="pull-left" alt="" />
										<font size="1"><g:message code="asked.label" /></font>&nbsp;<a href="#"><g:formatDate format="yy-MM-dd HH:mm" date="${question?.askDate}"/></a>
										
										<p>
											<font size="3"><g:message code="${question?.asker?.firstName} 
															${question?.asker?.lastName}"/><br></font>
											<code><g:message code="${question?.asker?.reputation?.calculateValue()} "/></code>
										</p>
									</li>
								</div>
							</div>
						</ul>
					</div>
				</li>
			</ul>		
		</div>
	</div>			
	
<!-- divider -->
<div class="row">
	<div class="col-lg-12">
		<div class="solidline">
		</div>
	</div>
</div>		
</g:each>
