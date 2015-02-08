<div class="row">
	<div class="col-lg-6">
		<h4><g:message code="questions.label"/></h4>					
			<g:each in="${getFewQuestions}" var="question">
				<ul class="cat">
					<li><i class="icon-angle-right"></i>
						<g:link controller="question" action="show" params="[identifier: question?.id]">
							<h5 >${question?.title}</h5>
						</g:link> 
					</li>
				</ul> 
			</g:each> 
	</div>
	<div class="col-lg-6">
		
		<h4><code>${getReputation?.total}</code>&nbsp;<g:message code="profile.reputation.label"/></h4>
		<table width=100% >
			<g:each in="${getFewReputation?.events}" var="event">		
				<tr>
					<td width=5%>${event?.point}</td>
					<td width=10%>${event?.tag}</td>
					<td width=60%>
						<g:link controller="question" action="show" params="[identifier: event?.question?.id]">
							${event?.question?.title}
						</g:link> 
					</td>
					<td width=25%>
						<g:formatDate format="yy-MM-dd HH:mm" date="${event?.date}"/>
					</td>
				</tr>
			</g:each>
		</table>
	</div>
</div>
<div class="row">			
	<div class="col-lg-6">
		
		<h4><g:message code="tags.label"/></h4>
		<div class="widget">
			<ul class="tags">											
				<g:each in="${getTags?}" var="tag">								
					<li><a href="#">${tag?.name}</a></li>
				</g:each>
			</ul>
		</div> 	
	</div>
					
	<div class="col-lg-6">		
		<h4><g:message code="badges.label"/></h4>
		<div class="widget">		
			<ul class="tags">						
				<g:each in="${getBadges}" var="badge">								
					<li><a href="">
						<font size="15" color="#8c7853">.</font> &nbsp; ${badge?.badgeType?.name}</a>
					</li>
				</g:each>
			</ul>
		</div> 	
	</div>
</div>
