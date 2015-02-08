<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
	<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
	<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
		
	<title><g:layoutTitle default="An example decorator" /></title>
	
	
	<r:require module="utils"/>
    <r:layoutResources/>
	<g:layoutHead /> 

</head>
<body>
<div id="wrapper">
	<!-- start header -->
	<header>
	    <section id="inner-headline">
	    
			<div class="container">
				<ul class="nav navbar-nav">	                    
                      <li class="dropdown">
                          <g:message code="welcome.label" default="Welcome" />
					 ${session?.firstName} ${session?.lastName}
                      </li>
                      <li class="active" class="breadcrumb" style="margin-left: 30px;">
							
						<form name="submitForm" method="POST" action="${createLink(controller: 'logout')}">
							<input type="hidden" name="" value="">
							<a HREF="javascript:document.submitForm.submit()">Logout</a>
						</form>								
										
					  </li>
                </ul>
				
			</div>
		</section>    
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    
                    <table>
                    	<tr>
                    		<td>
                    			<img src="${resource(dir:'images',file:'lannister.png')}"  width="40" height="40" />              			
                    		</td>
                    		<td><div class="navbar-brand" style="margin-left: 30px; margin-bottom: 30px" >Ask <span>Tyrion Lannister</span></div></td>
                    	</tr>
                    </table>
                    
                </div>
                <div class="navbar-collapse collapse ">
                    <ul class="nav navbar-nav">
                        <li class="active" >
							<g:link controller="Question" action="questions" >
								<g:message code="questions.label" default="Questions" />
							</g:link>
						</li>
                        <li>
                             <g:link controller="Tags" >
								<g:message code="tag.label" default="Tags" />
							</g:link>
                        </li>
                        <li><a href="#">User</a></li>
                        <li>
							<g:link controller="Badge" >
								<g:message code="badge.label" default="Badges" />
							</g:link>						
						</li>
                        <li>
							<g:link controller="Question" action="createQuestion" >
								<g:message code="askQuestion.label" default="Ask question" />
							</g:link>
						</li>	
						<li>
							<g:link controller="Profile" action="testSelect" >
								test
							</g:link>
						</li>	
                    </ul>
                </div>
            </div>
        </div>
	</header>
	<!-- end header -->
	<section id="content">
		<div class="container">
			<g:layoutBody/>
		</div>
	</section>
	<!-- footer-->
	<footer>
		<div class="container">
			<div id="footer">
				Ask Tyrion Lannister 2015 All right reserved. By Imane SABIR & Sara QASMI
			</div>	
		</div>
	</footer>
	<!-- /footer-->
</div>

<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>

<r:layoutResources/>
</body>
</html>
