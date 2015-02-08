package fr.stackoverflowapp
import org.springframework.security.access.annotation.Secured

@Secured('permitAll')
class BadgeController {

	
	def index() {
		
		[badge: BadgeType.list(params)]
		
	}

}
