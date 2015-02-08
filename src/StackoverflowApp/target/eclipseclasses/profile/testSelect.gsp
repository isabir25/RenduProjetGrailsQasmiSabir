 	
 	<link rel="stylesheet" href="${resource(dir: 'css', file: 'select2.css')}"  type="text/css">
    <script  type="text/javascript" src="../js/select2.js"></script>
    
    	<h1><g:message code="" args="[entityName]" /></h1>
    	
    	<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
			
    	<g:hasErrors bean="${question}">
		    <g:eachError><p><g:message error=""/></p></g:eachError>
		</g:hasErrors>

		<g:form method="post" >
			
			<div>
				<label for="Title">
					<g:message code="question.title.label" default="Title" />
					<span class="">*</span>
				</label>
				<g:textField name="title" value="${question?.title}"/>
			</div>
			<div>
				<g:textArea name="body" rows="10" cols="40" value="${question?.body}"/>
			</div>
			<!-- render -->			
			<div>
				
				<!-- select -->
				
						        <div class="select2-container select2-container-multi populate placeholder" id="s2id_e2_2" style="width: 250px"> 
     							<g:select style="width:260px" name="tags"  
									id="e2_2" from="${tags}" 
									optionValue="name" optionKey="id" multiple="true"
									multiple data-placeholder="${message(code: 'tags.select.label', default: 'Ask Question')}"/>
			
						        </div>
						  			
					 <script>
			        $(document).ready(function () {
			        	 $("#e2_2").select2({
			        	                placeholder: "Select a State"
			        	            });
			        	});
		        </script>
				<!-- select -->
		</div>		
			<fieldset class="buttons">
				<g:actionSubmit class="save" action="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />				
			</fieldset>
		</g:form>
	