
			<g:each in="${getQuestions}" var="question">										
				<div class="row">
					<div class="col-lg-3">		
						<table style="text-align : center;" width="100%">
							<tr>
								<td width="33.33%">
									${question?.votesNumber }</br>
									<g:message code="votes.label" />								
								</td >
								<td width="33.33%" style="padding-right: 10px; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;">												
									<div class="alert alert-info">
										<strong>${question?.answers?.size() }<br></strong>
										 <g:message code="answres.label" />
									</div>
								</td>
								<td width="33.33%">
									${question?.viewsNumber }</br>
									<g:message code="views.label" />
								</td>
							</tr>
						</table>
						
					</div>						
					<div class="col-lg-9">	
						<!--div  style="text-align : center;"-->
						<h5 class="widgetheading">
							<g:link controller="question" action="show" params="[identifier: question?.id]">
								<g:message code="${question?.title }" />
							</g:link>
						</h5>											
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
								<g:formatDate format="yy-MM-dd HH:mm" date="${question?.askDate}"/>
							</div>
						</div>
					</div>
				</div>			
			</g:each>
