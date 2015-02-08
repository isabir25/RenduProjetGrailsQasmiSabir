package fr.stackoverflowapp

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.stereotype.Service;
import org.springframework.security.core.Authentication;
import  fr.stackoverflowapp.secureapp.SecUser
import  fr.stackoverflowapp.Profile

class MySecurityEventListener implements ApplicationListener<AuthenticationSuccessEvent> {

		def springSecurityService 
		
    @Override
	void onApplicationEvent(AuthenticationSuccessEvent event) { 
		
		/*try {

            AuthenticationSuccessEvent authenticationSuccessEvent = (AuthenticationSuccessEvent) event;

            Authentication authentication = authenticationSuccessEvent.getAuthentication();
			print authentication.getName() + '*******************' 
			
			def user = SecUser.executeQuery("select a from SecUser a " +
				"where a.username = ?",
				[authentication.getName()])
				print '-----------------------'
				print user[0].id + ' /////////////'
							
			def res = Profile.executeQuery("select a from Profile a " +
				"where a.user.id = ?",
				[user[0].id])
			
			session.identifier = res[0].id
			session.firstName = res[0].firstName
			session.lastName = res[0].lastName
			

        } catch (Exception e) {

            // Handle exception as needed.
        }*/
        
		/*def user = springSecurityService.authentication
		
		def res = Profile.executeQuery("select a from Profile a " +
			"where a.user.id = ?",
			[user.id])
		
		session.identifier = res[0].id
		session.firstName = res[0].firstName
		session.lastName = res[0].lastName*/
	}
}
