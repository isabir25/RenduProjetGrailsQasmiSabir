
<html>
	<head>
        <meta name="layout" content="application"/>	
		<g:set var="entityName" value="${message(code: 'askQuestion.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>    
    </head>
    <body>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			
	    	<g:hasErrors bean="${myQuestion}">
			    <g:eachError><p><g:message error=""/></p></g:eachError>
			</g:hasErrors>
			
			<!-- Show question -->
			<div>
				<label for="Title">
					<g:message code="${myQuestion?.title}" />
				</label>
			</div>
			<table border="1">
				<tr>
					<td><div>
						<table style="text-align: center;">
							<tr><td>
									<g:remoteLink action="upVote" params="[identifier: myQuestion?.id]"
									update="voteDiv">
										<img src="/image/vote+.jpeg" alt="+"/>
									</g:remoteLink>
								</td>
							</tr>
							<tr>
								<td>
									<div id="voteDiv">
										<g:message code="${myQuestion?.votesNumber} vote" />
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<g:remoteLink action="downVote" params="[identifier: myQuestion?.id]"
									update="voteDiv">
										<img src="/image/vote+.jpeg" alt="-"/>
									</g:remoteLink>
								</td>
							</tr>

						</table>
					</div></td>
					<td><div>
						<g:textArea name="body" disabled="true" rows="10" cols="40" value="${myQuestion?.body}"/>
					</div></td>
					<td><div>
						<g:message code="Asked : ${myQuestion?.askDate}" /></br>
						<g:message code="Viewed : ${myQuestion?.viewsNumber}" />
					</div></td>
				</tr>
			</table>		
			<div>
				<table border="1">
					<tr>
						<td>
											
							<!-- select -->
								<!-- Include Select2 CSS -->
								<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/select2/3.5.0/select2.min.css" />
								
								<!-- CSS to make Select2 fit in with Bootstrap 3.x -->
								<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/select2/3.5.0/select2-bootstrap.min.css" />
								
								<!-- Include Select2 JS -->
								<script src="//cdnjs.cloudflare.com/ajax/libs/select2/3.5.0/select2.min.js"></script>
								

       							<input type="hidden" id="tags" value="${listTagsJson }" disabled="disabled">
       
								<script>
									$('#tags').select2({
									    tags: true,
									    tokenSeparators: [','],
									    createSearchChoice: function (term) {
									        return {
									            id: $.trim(term),
									            text: $.trim(term) + ' (new tag)'
									        };
									    },
									    ajax: {
									        url: 'https://api.myjson.com/bins/444cr',
									        dataType: 'json',
									        data: function(term, page) {
									            return {
									                q: term
									            };
									        },
									        results: function(data, page) {
									            return {
									                results: data
									            };
									        }
									    },
									
									    // Take default tags from the input value
									    initSelection: function (element, callback) {
									        var data = [];
									
									        function splitVal(string, separator) {
									            var val, i, l;
									            if (string === null || string.length < 1) return [];
									            val = string.split(separator);
									            for (i = 0, l = val.length; i < l; i = i + 1) val[i] = $.trim(val[i]);
									            return val;
									        }
									
									        $(splitVal(element.val(), ",")).each(function () {
									            data.push({
									                id: this,
									                text: this
									            });
									        });
									
									        callback(data);
									    },
									
									    // Some nice improvements:
									
									    // max tags is 3
									    maximumSelectionSize: 3,
									
									    // override message for max tags
									    formatSelectionTooBig: function (limit) {
									        return "Max tags is only " + limit;
									    }
									});
								</script>	
							<!-- select 
							<g:select name="tags" disabled="true" multiple="true" from="${myQuestion?.tags}" optionValue="name" />
						-->
						</td>
						<td>
							<g:if test="${editedProfile != null}">
								<g:message code="Edited at ${myQuestion?.editDate} "/><br>
								<table>
									<tr>
										<td><img src="${editedProfile?.photo}" alt="Grails"/></td>
										<td><g:message code="${editedProfile?.firstName} 
															${editedProfile?.lastName}"/><br>
										<g:message code="${editedProfile?.reputation} "/>
										</td>
									</tr>
								</table>								 						
							</g:if>
						</td>
						<td>
							<g:message code="Asked at ${myQuestion?.askDate} "/><br>
							<table>
								<tr>
									<td><img src="${myQuestion?.asker?.photo}" alt="Grails"/></td>
									<td><g:message code="${myQuestion?.asker?.firstName} 
														${myQuestion?.asker?.lastName}"/><br>
									<g:message code="${myQuestion?.asker?.reputation} "/>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<td><g:link action="edit" params="[identifier: myQuestion?.id]">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link></td>
				
				<sec:ifAllGranted roles="ROLE_ADMIN">	
					<td><g:link action="delete" params="[identifier: myQuestion?.id]" 
							onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >
						<g:message code="default.button.delete.label" default="Delete" />
					</g:link></td>
				</sec:ifAllGranted>
			</div>		
			
			<!-- Answers list -->
			<g:if test="${myQuestion?.answers != null}">
			     <p><g:message code="${myQuestion?.answers } Answers" /></p>
			</g:if>
			<g:else>
			     0 Answer
			</g:else>
			<g:each in="${myQuestion?.answers}" var="answer">
				<table border="1">
					<tr>
						<td><div>
							<g:message code="Votes : ${answer?.votesNumber}" />
						</div></td>
						<td><div>
							<g:textArea name="body" disabled="true" rows="10" cols="40" value="${answer?.body}"/>
						</div></td>
					</tr>
				</table>	
				<div>
					<table border="1">
						<tr>
							<td>
								<td><g:link action="edit" params="[answerIdentifier: answer.id, 
																	questionIdentifier: myQuestion.id]">
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link></td>
							</td>
							<td>
								<g:message code="Last edition date : " /></br>
								?????????????
							</td>
							<td>
								Asked By profile ??????
							</td>
						</tr>
					</table>
				</div>		
			</g:each>
			<!-- Your Answer -->
			
			<p><g:message code="Your answer" /></p>
				
			<g:form method="post" >
				<g:hiddenField name="questionId" value="${myQuestion?.id}" />	
				<div>
					<g:textArea name="body" rows="10" cols="40" value="${question?.body}"/>
				</div>
				<!-- render -->
				<td><g:link controller="Answer" action="save">
					<g:message code="default.button.create.label" default="Create" />
				</g:link></td>	
			</g:form>
	</body>
</html>