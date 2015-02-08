
<html>
	<head>
        <meta name="layout" content="application"/>	
		<title><g:message code="${myQuestion?.title}" /></title>    
    </head>
    <body>
    
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	
	<g:hasErrors bean="${myQuestion}">
		<g:eachError><p><g:message error=""/></p></g:eachError>
	</g:hasErrors>
		
		<section id="content">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<article>
							<div class="cat" class="post-image">
								<div class="post-heading">
									<h3><a href="#"><g:message code="${myQuestion?.title}" /></a></h3>
								</div>
								<img src="img/dummies/blog/img1.jpg" alt="" />
								
							</div>
							<p class="cat">									
									${myQuestion?.body}
							</p>
							<div class="widget">
								<h5 class="widgetheading">${message(code: 'tags.label', default: 'Tags')}</h5>
								<ul class="tags">											
									<g:each in="${myQuestion?.tags}" var="tag">								
										<li><a href="#">${tag?.name}</a></li>
									</g:each>
								</ul>
							</div>
							
							<div class="bottom-article">
								<ul class="meta-post">
									<li><i class="icon-calendar"></i>
										<g:link action="edit" params="[identifier: myQuestion?.id]">
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link>
									</li>
									<li><i class="icon-user"></i><a href="#">
										<sec:ifAllGranted roles="ROLE_ADMIN">	
											<td><g:link action="delete" params="[identifier: myQuestion?.id]" 
													onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >
												<g:message code="default.button.delete.label" default="Delete" />
											</g:link></td>
										</sec:ifAllGranted>
									</a></li>
								</ul>
							</div>
					</article>					
				</div>
				<div class="col-lg-4">
					<aside class="right-sidebar">
						<div class="widget">
							<ul class="cat" >
								<!--div  style="text-align : center;"-->
									<li><i class="icon-angle-right"></i>
										<g:remoteLink action="upVote" params="[identifier: myQuestion?.id]"
										update="voteDiv">
											<img src="${resource(dir:'images',file:'upVote.png')}"  width="20" height="20" />  
										</g:remoteLink>
									</li>
									<li><i class="icon-angle-right"></i>
										<div id="voteDiv">
											<g:message code="${myQuestion?.votesNumber}" />
										</div>
									</li>
									<li><i class="icon-angle-right"></i>
										<g:remoteLink action="downVote" params="[identifier: myQuestion?.id]"
										update="voteDiv">
											<img src="${resource(dir:'images',file:'downVote.png')}"  width="20" height="20" />  
										</g:remoteLink>
									</li>
								<!--/div-->			
								<li><i class="icon-angle-right"></i>
									<g:message code="viewed.label" />
									<g:message code=" : ${myQuestion?.viewsNumber}" />
								</li>
							</ul>
						</div>
						<div class="widget">
							<h5 class="widgetheading"><g:message code="asked.label" /></h5>
							<ul class="recent">
								<li>
									<img src="${resource(dir:'images/photos',file:'thumb1.jpg')}" class="pull-left" alt="" />
									<font size="1"><g:message code="asked.label" /></font>&nbsp;
										<a href="#"><g:formatDate format="yyyy-MM-dd HH:mm" date="${myQuestion?.askDate}"/></a>
									
									<p> 
										<font size="3"><g:message code="${myQuestion?.asker?.firstName} 
														${myQuestion?.asker?.lastName}"/><br></font>
										<code><g:message code="${myQuestion?.asker?.reputation?.calculateValue()} "/></code> 
										<g:if test="${askerBadgesLevel?.silver != 0}" >
											<font size="15" color="#C0C0C0">.</font>${askerBadgesLevel?.silver}		
										</g:if>
										<g:if test="${askerBadgesLevel?.bronze != 0}" >								
											<font size="15" color="#8c7853">.</font>${askerBadgesLevel?.bronze}												
										</g:if>
										<g:if test="${askerBadgesLevel?.gold != 0}" >
											<font size="15" color="#FFD700">.</font>${askerBadgesLevel?.gold}		
										</g:if>
									</p>
								</li>
							</ul>
						</div>
						<g:if test="${editedProfile != null}">
							<div class="widget">
								<h5 class="widgetheading"><g:message code="edited.label" /></h5>
								<ul class="recent">
									<li>
										<img src="${resource(dir:'images/photos',file:'thumb1.jpg')}" class="pull-left" alt="" />
										<font size="1"><g:message code="edited.label" /></font>&nbsp;<a href="#">
											<g:formatDate format="yy-MM-dd HH:mm" date="${myQuestion?.editDate}"/></a>
										<p>
											<font size="3"><g:message code="${editedProfile?.firstName} 
															${editedProfile?.lastName}"/><br></font>
											<code><g:message code="${editedProfile?.reputation?.calculateValue()} "/>
											</code>
											<g:if test="${editorBadgesLevel?.silver != 0}" >
												<font size="15" color="#C0C0C0">.</font>${editorBadgesLevel?.silver}		
											</g:if>
											<g:if test="${editorBadgesLevel?.bronze != 0}" >								
												<font size="15" color="#8c7853">.</font>${editorBadgesLevel?.bronze}												
											</g:if>
											<g:if test="${editorBadgesLevel?.gold != 0}" >
												<font size="15" color="#FFD700">.</font>${editorBadgesLevel?.gold}		
											</g:if>
										</p>
									</li>
								</ul>
							</div>							 						
						</g:if>
					</aside>
				</div>
				
				<div class="col-lg-12">
					<!-- Answers  -->						
					<g:render template="/answer/showAnswer" model="[answers: answers, questionProfile: myQuestion?.asker?.id]" />	
				</div>
			</div>
			
			<!-- divider -->
			<div class="row">
				<div class="col-lg-12">
					<div class="solidline">
					</div>
				</div>
			</div>	
			<sec:ifLoggedIn>
				<!-- create Answers  -->						
				<g:render template="/answer/createAnswer" model="[idQuestion: myQuestion?.id]" />
			</sec:ifLoggedIn>
		</div>
	</section>
		
	</body>
</html>
