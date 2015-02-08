
		
		<h4><code>${getReputation?.total}</code>&nbsp;Reputation</h4>
		<table width=100% >
			<g:each in="${getReputation?.events}" var="event">		
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
	
