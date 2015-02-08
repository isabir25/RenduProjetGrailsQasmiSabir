<html>
	<head>
	
        <meta name="layout" content="application"/>
		<title><g:message code="question.all.label"  /></title>    	
	</head>
	<body>
		
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
						
		<section id="content">
		<div class="container">
			<div class="col-lg-10">
				<h4><g:message code="question.all.label" /></h4>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#newest" data-toggle="tab"><i class="icon-briefcase"></i>
							<g:message code="question.sort.newest.label" /></a></li>
					<li><a href="#vote" data-toggle="tab"><g:message code="question.sort.vote.label" /></a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="newest">
						<g:render template="/question/questionsList" model="[questions: questionsOrderByDate,total: total]" />
						<div class=pagination>
							<g:paginate controller="Question" action="questions" total="${total}" sort="askDate" order="asc"/>
						</div>
					</div>
					<div class="tab-pane" id="vote">						
						<g:render template="/question/questionsList" model="[questions: questionsOrderByVotes,total: total]" />
						<div class=pagination>
							<g:paginate controller="Question" action="questions" 	total="${total}" sort="askDate" order="asc"/>
						</div>
					</div>
				</div>
			</div>	
			
				<div class="col-lg-2">
					<aside class="right-sidebar">
						<div class="widget">
							<ul class="cat" >
								<!--div  style="text-align : center;"-->
								<li style="text-align : center;"><i class="icon-angle-right" ></i>
									${nbQuestions}<br>
									<g:message code="questions.label" />
								</li>
							</ul>
						</div>					
						<div class="widget">
							<h5 class="widgetheading">${message(code: 'tags.label', default: 'Tags')}</h5>
							<ul class="tags">											
								<g:each in="${tags}" var="tag">								
									<li><a href="#">${tag?.name}</a></li>
								</g:each>
							</ul>
						</div>
					</aside>
				</div>			
		</div>
		</section>	
	</body>
</html>
