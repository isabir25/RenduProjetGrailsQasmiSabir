<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
	<link rel="apple-touch-icon" href="${assetPath(src: 'lannister.png')}">
	<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'lannister.png')}">
		
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
						
			<div class="row">			
				<div class="col-lg-4">
					<div class="container">	
							<ul class="nav navbar-nav">		
								<sec:ifLoggedIn>                    
									  <li class="dropdown">	
										  <g:message code="welcome.label" default="Welcome" />
											${session?.firstName} ${session?.lastName}
									  </li>
									  <li class="active" class="breadcrumb" style="margin-left: 30px;">		
											<form name="submitForm" method="POST" action="${createLink(controller: 'logout')}">
												<input type="hidden" name="" value="">
												<a HREF="javascript:document.submitForm.submit()"><g:message code="logout.label" default="Logout" /></a>
											</form>		
									  </li>
   							    </sec:ifLoggedIn>	
								<sec:ifNotLoggedIn>	 
									<li class="active" class="breadcrumb" style="margin-left: 30px;">
										<form name="submitForm" method="POST" action="${createLink(controller: 'profile')}">
											<input type="hidden" name="" value="">
											<a HREF="javascript:document.submitForm.submit()"><g:message code="profile.login.button" default="Log in" /></a>
										</form>		
									</li>
								</sec:ifNotLoggedIn>								
							</ul>
					</div>
				</div>
				<div class="col-lg-4">
				</div>
				<div class="col-lg-4">
					<div class="container">	
							<ul class="nav navbar-nav">	                    
								<li class="dropdown">	
									<input type="hidden" name="" value="">
									<div onclick="setGetParameter('lang','en')" style="cursor: pointer; cursor: hand;">
										<img src="${resource(dir:'images',file:'drapeau-anglais.png')}"  width="20" height="20" />
										<g:message code="language.english.label" default="english" />
									</div>
								</li>
								<li class="active" class="breadcrumb" style="margin-left: 30px; cursor: pointer; cursor: hand;">		
									<div onclick="setGetParameter('lang','fr')">
										<img src="${resource(dir:'images',file:'Drapeau-francais.png')}"  width="20" height="20" />  
										<g:message code="language.french.label" default="french" />
									</div>									
								</li>
							</ul>
					</div>
				</div>
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
                    			<img src="${resource(dir:'images',file:'lannister.png')}"  width="80" height="100" />              			
                    		</td>
                    		<td><div class="navbar-brand" style="margin-left: 30px; margin-bottom: 30px" >Ask the <span>Lannister</span></div></td>
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
                        <li>
							<g:link controller="Profile" >
								<g:message code="profile.label" default="Profile" />
							</g:link>
                        </li>
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
                    </ul>
                </div>
            </div>
        </div>
	</header>
	<!-- end header -->
			<g:layoutBody/>
	<!-- footer-->
	<footer>
		
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<div class="widget">
				Ask the Lannister 2015 All right reserved. By Imane SABIR & Sara QASMI
				</div>	
			</div>
		</div>
	</footer>
	<!-- /footer-->
</div>

<a href="#" class="scrollup"><i class="fa fa-angle-up active"></i></a>

<r:layoutResources/>
<script>
function setGetParameter(paramName, paramValue)
{
    var url = window.location.href;
    if (url.indexOf(paramName + "=") >= 0)
    {
        var prefix = url.substring(0, url.indexOf(paramName));
        var suffix = url.substring(url.indexOf(paramName));
        suffix = suffix.substring(suffix.indexOf("=") + 1);
        suffix = (suffix.indexOf("&") >= 0) ? suffix.substring(suffix.indexOf("&")) : "";
        url = prefix + paramName + "=" + paramValue + suffix;
    }
    else
    {
    if (url.indexOf("?") < 0)
        url += "?" + paramName + "=" + paramValue;
    else
        url += "&" + paramName + "=" + paramValue;
    }
    window.location.href = url;
}
</script>
</body>
</html>
