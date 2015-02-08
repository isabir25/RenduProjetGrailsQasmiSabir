package fr.stackoverflowapp

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;

class GetConnectUser {

    void getConnectedUserInSession(springSecurityService) { 
		
		def user = springSecurityService.getCurrentUser()
		print 'debut sec'
		def res = Profile.executeQuery("select a from Profile a " +
			"where a.user.id = ?",
			[user.id])
		
		session.identifier = res[0].id
		session.firstName = res[0].firstName
		session.lastName = res[0].lastName
		print 'fin ok'
	}
}
