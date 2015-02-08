<html>
    <head>
        <meta name="layout" content="application"/>
        
		<g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
		<title><g:message code="profile.label" /></title> 
    </head>
    <body>
        
	<section id="content">
	<div class="container">
		<div class="row">
					
			<div class="col-lg-12">
				<div style="text-align: right;">
					<g:link action="editProfile">
						<g:message code="default.button.edit.label" default="Edit" />
					</g:link>
				</div>
			</div>
					
			<div class="col-lg-6">
				<!-- Description -->
				<div class="row">
					<div class="col-lg-4">								
						
						<div class="widget">
							<ul class="recent" style="text-align: center;">
								<li>
										<img src="${resource(dir:'images/photos',file:'thumb1.jpg')}" 
										 alt="" style="	height: 100px; width: 100px;"/>	
									<p>
										<h4><code><g:message code="${profile?.reputation?.calculateValue() } "/></code></h4>
										<h6><g:message code="profile.reputation.label"/></h6>
									</p>
									<g:if test="${profileBadgesLevel?.silver != 0}" >
										<font size="15" color="#C0C0C0">.</font>${profileBadgesLevel?.silver}		
									</g:if>
									<g:if test="${profileBadgesLevel?.bronze != 0}" >								
										<font size="15" color="#8c7853">.</font>${profileBadgesLevel?.bronze}												
									</g:if>
									<g:if test="${profileBadgesLevel?.gold != 0}" >
										<font size="15" color="#FFD700">.</font>${profileBadgesLevel?.gold}		
									</g:if>
								</li>
							</ul>
						</div>
						
					</div>						
					<div class="col-lg-8">
						<table width="100%" >
							<tr>
								<td width="40%"><h6><g:message code="profile.firstName.label"/></h6></td><td width="60%">${profile?.firstName}</td>
							</tr>
							<tr>
								<td width="40%"><h6><g:message code="profile.lastName.label"/></h6></td><td width="60%">${profile?.lastName}</td>
							</tr>
							<tr>
								<td width="40%"><h6><g:message code="profile.birthDay.label"/></h6></td><td width="60%"><g:formatDate format="yyyy-MM-dd" date="${profile?.birthDate}"/></td>
							</tr>
							
							<tr>
								<td width="40%"><h6><g:message code="profile.signin.button"/></h6></td><td width="60%">${profile?.signInDate}</td>
							</tr>
							
						</table>
					</div>
				</div>	
			</div>
			<!-- Horizontal Description -->
			<div class="col-lg-6">
					<div class="row">
						<div class="col-lg-12">
							<form id="contactform" method="post" class="validateform" name="send-contact">
								<g:textArea disabled="true" name="body" rows="8" class="input-block-level" placeholder="${profile?.aboutMe}" />
							</form>
						</div>
					</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#Summary" data-toggle="tab"><i class="icon-briefcase"></i><g:message code="profile.summary.label"/></a></li>
					<li><a href="#Answers" data-toggle="tab"><g:message code="answres.label"/></a></li>
					<li><a href="#Questions" data-toggle="tab"><g:message code="questions.label"/></a></li>
					<li><a href="#Tags" data-toggle="tab"><g:message code="tag.label"/></a></li>
					<li><a href="#Badges" data-toggle="tab"><g:message code="badge.label"/></a></li>
					<li><a href="#Response" data-toggle="tab"><g:message code="responses.label"/></a></li>
					<li><a href="#Reputation" data-toggle="tab"><g:message code="profile.reputation.label"/></a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="Summary">						
						<g:render template="summary" model="[
						 getFewQuestions: getFewQuestions,
						 getBadges: getBadges,
						 getTags: getTags,
						 getFewReputation: getFewReputation]" />
					</div>
					<div class="tab-pane" id="Answers">
						<p></p>
						<g:render template="profileAnswers" model="[
						 getAnswers: getAnswers]" />	
					</div>
					<div class="tab-pane" id="Questions">
						<g:render template="profileQuestions" model="[
						 getQuestions: getQuestions]" />
					</div>					
					<div class="tab-pane" id="Tags">						
						<g:render template="profileTags" model="[
						 getTags: getTags]" />
					</div>					
					<div class="tab-pane" id="Badges">						
						<g:render template="profileBadges" model="[
						 getBadges: getBadges]" />						
					</div>
					<div class="tab-pane" id="Response">	
						<p></p>
						<g:render template="profileResponse" model="[
						 getResponses: getResponses]" />								
					</div>
					
					<div class="tab-pane" id="Reputation">	
						<p></p>							
						<g:render template="profileReputation" model="[
						 getReputation: getReputation]" />		
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
        	    
    </body>
</html>
