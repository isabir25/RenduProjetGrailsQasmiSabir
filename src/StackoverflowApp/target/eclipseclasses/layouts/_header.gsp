
			<table style="width: 100%">
				<tr>
					<td>
						<g:link controller="Question" action="questions" >
							<g:message code="questions.label" default="Questions" />
						</g:link>
					</td>
					<td><g:link controller="Tags" >
						<g:message code="tag.label" default="Tags" />
					</g:link></td>
					<td><a href="#" ><g:message code="user.label" default="User" /></a></td>
					<td><g:link controller="Badge" >
						<g:message code="badge.label" default="Badges" />
					</g:link></td>
					<td><g:link controller="Question" action="createQuestion" >
						<g:message code="askQuestion.label" default="Ask question" />
					</g:link></td>
					<td>
						<form name="submitForm" method="POST" action="${createLink(controller: 'logout')}">
							<input type="hidden" name="" value="">
							<a HREF="javascript:document.submitForm.submit()">Logout</a>
						</form>
					</td>
					<td><g:message code="welcome.label" default="Welcome" />
							 ${session?.firstName} ${session?.lastName}
					</td>
				</tr>
			</table>