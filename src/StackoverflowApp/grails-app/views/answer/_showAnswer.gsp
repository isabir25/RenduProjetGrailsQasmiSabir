<div class="row">
	<div class="col-lg-12">
		<h4><g:message code="${answers?.total } " /><g:message code="answres.label"/></h4>
		<ul class="nav nav-tabs">
			<li class="active"><a href="#vote" data-toggle="tab"><i class="icon-briefcase"></i> 
			<g:message code="question.sort.vote.label"/></a></li>
		</ul>
		<div class="tab-content">
			<div class="tab-pane active" id="vote">				
				<g:each in="${answers?.answers}" var="answer"> 
				<div class="row">
					<div class="col-lg-1">								
						<ul class="recent" style="text-align : center;">
							<!--div  style="text-align : center;"-->
								<li><i class="icon-angle-right"></i>
									<g:remoteLink controller="Answer" action="upVote" params="[identifier: answer?.id]"
									update="voteAnswer${answer?.id}">
										<img src="${resource(dir:'images',file:'upVote.png')}"  width="20" height="20" />  
									</g:remoteLink>
								</li>
								<li><i class="icon-angle-right"></i>
									<div id="voteAnswer${answer?.id}">
										<g:message code="${answer?.votesNumber}" />
									</div>
								</li>
								<li><i class="icon-angle-right"></i>
									<g:remoteLink controller="Answer" action="downVote" params="[identifier: answer?.id]"
									update="voteAnswer${answer?.id}">
										<img src="${resource(dir:'images',file:'downVote.png')}"  width="20" height="20" />  
									</g:remoteLink>
								</li>
								<g:if test="${answers?.flag != null}">
								
									<g:if test="${answers?.flag == answer?.id}">
										<li><i class="icon-angle-right"></i>
											<div id="validateAnswer${answer?.id}">
												<img src="${resource(dir:'images',file:'valide.png')}"  width="20" height="20" />  
											</div>
										</li>
									</g:if>
								</g:if>
								<g:else>
									<g:if test="${session.identifier == questionProfile }">
										<li><i class="icon-angle-right"></i>
											<g:remoteLink controller="Answer" action="valideAnswer" params="[identifier: answer?.id]"
											update="validateAnswer${answer?.id}">
												<div id="validateAnswer${answer?.id}">
													<img src="${resource(dir:'images',file:'check.png')}"  width="20" height="20" />  
												</div>
											</g:remoteLink>
										</li>
									</g: if>
								</g:else>
							</ul>
						</div>				
						<div class="col-lg-8">	
							<!--div  style="text-align : center;"-->							
							<ul class="recent">								
								<li>									
									<p class="cat">									
										${answer?.body }
									</p>	
								</li>
							</ul>	
								<!-- edit profile -->
								<div class="widget">										
									<ul class="recent">
										
										<div class="row">
											<div class="col-lg-4">	
											</div>
											<div class="col-lg-4">	
												<g:if test="${answer?.editor != null}">
													<li>
														<img src="${resource(dir:'images/photos',file:'thumb1.jpg')}" class="pull-left" alt="" />
														<font size="1"><g:message code="edited.label" /></font>&nbsp;<a href="#"><g:formatDate format="yy-MM-dd HH:mm" date="${answer?.editDate}"/></a>
														
														<p>
															<font size="3"><g:message code="${answer?.editor?.firstName} 
																			${answer?.editor?.lastName}"/><br></font>
															<code><g:message code="${answer?.editor?.reputation?.calculateValue()} "/></code>
														</p>
													</li>
												</g:if>
											</div>
											<div class="col-lg-4">	
												<li>
													<img src="${resource(dir:'images/photos',file:'thumb1.jpg')}" class="pull-left" alt="" />
													<font size="1"><g:message code="answred.label" /></font>&nbsp;
													<a href="#"><g:formatDate format="yy-MM-dd HH:mm" date="${answer?.createDate}"/></a>
													
													<p>
														<font size="3"><g:message code="${answer?.profile?.firstName} 
																		${answer?.profile?.lastName}"/><br></font>
														<code><g:message code="${answer?.profile?.reputation?.calculateValue()} "/></code>
													</p>
												</li>
											</div>
										</div>
									</ul>
								</div>
										
										
							<div class="bottom-article">
								<ul class="meta-post">
									<li><i class="icon-calendar"></i>
										<g:link controller="Answer" action="edit" params="[idAnswer: answer.id, idQuestion: answer?.question?.id]">
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link>
									</li>
								</ul>
							</div>
						</div>		
					</div>
				</g:each>
				</div>
			</div>
		</div>
	</div>
						
