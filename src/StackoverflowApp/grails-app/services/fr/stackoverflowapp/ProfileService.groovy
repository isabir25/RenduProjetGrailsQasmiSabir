
package fr.stackoverflowapp

import grails.transaction.Transactional
import fr.stackoverflowapp.secureapp.SecUser
import fr.stackoverflowapp.secureapp.SecRole
import fr.stackoverflowapp.secureapp.SecUserSecRole

@Transactional
class ProfileService {

	/* Save a new Profile
	Les champs de params : 
			username	password	firstName	lastName	birthDate
	*/
	
    def save(params) {
		def user = new SecUser(username: params.username, enabled: true, password: params.password)
		user.save(flush: true)
		SecRole userRole = SecRole.get(2)

		SecUserSecRole.create user, userRole, true
		
		def profile = new Profile(firstName: params.firstName, lastName: params.lastName, birthDate: params.birthDate,
								user: user)
		// Should be on the model defaultValues but it doesn't work !!!
		profile.photo = "/path/to/default/photo"
		profile.aboutMe = ""
		
		

		if (!profile.save(fflush:true)){
			profile.errors.each{
				log.error(it)
			}
		}
		def reputation = new Reputation()
		reputation.profile = profile
		
		if (!reputation.save(fflush:true)){
			reputation.errors.each{
				log.error(it)
			}
		}
		
			
	}
	
	
	/* Check if username already used */
	def checkUsernameAvailable(username) {
		if (SecUser.findByUsername(username))
			return false
		return true
	}
	
	
	
	/* Get questions sorted by newest ones */
	def getQuestions(idProfile){
		def questions = Profile.get(idProfile).askedQuestions.sort{it.askDate}
		questions = questions.reverse()
		return questions
	}
	
	/* Get only the 3 newest questions */
	def getFewQuestions(idProfile){
		def questions = getQuestions(idProfile)
		if(questions.size() ==0 )
			return questions
		def size = questions.size()
		if (size < 3)
			return questions[0..(size-1)]
		return questions[0..2]

	}
	
	/* Get answers */
	def getAnswers(idProfile){
		def answers = Profile.get(idProfile).responses.sort{it.createDate}
		answers = answers.reverse()
		return answers
	
	}
	
	/* Get only the 3 newest answers */
	def getFewAnswers(idProfile){
		def answers = getAnswers(idProfile)
		if(answers.size() == 0)
			return answers
		def size = answers.size()
		if (size < 3)
			return answers[0..(size-1)]
		return answers[0..2]
	}
	
	/* get responses */
	def getResponses(idProfile) {
		def questions = getQuestions(idProfile)
		def responses = []
		questions.each{
			
			it.answers.each {
				responses << it
			}
		}
		responses = responses.sort{it.createDate}
		responses = responses.reverse()
		return responses
	}
	
	/* get only the 3 newest responses */
	def getFewResponses(idProfile) {
		def responses = getResponses(idProfile)
		if(responses.size() == 0)
			return responses
		def size = responses.size()
		if (size < 3)
			return responses[0..(size-1)]
		return responses[0..2]
	}
	
	
	/* Get Tags */
	def getTags(idProfile) {
		def tags = []
		Profile.get(idProfile).askedQuestions.each{ 
			it.tags.each {
				if (!(it in tags))
					tags << it			
			}
		}
		return tags
	}
	
	/* Get Badges */
	def getBadges(idProfile) {
		return Profile.get(idProfile).badges
	}
	
	/* Get How many badges are gold|silver|bronze */
	def getBadgesLevel(idProfile) {
		def badges = Profile.get(idProfile).badges
		def goldLevel = Level.findByName("Gold")
		def silverLevel = Level.findByName("Silver")
		def bronzeLevel = Level.findByName("Bronze")
		int goldBadges = 0
		int silverBadges = 0
		int bronzeBadges = 0
		def level
		badges.each {
			level = it.badgeType.level
			switch (level) {
				case goldLevel:
					goldBadges ++
					break
				case bronzeLevel:
					bronzeBadges ++
					break
				case silverLevel:
					silverBadges ++
					break
				
			}
		
		}
		return [gold: goldBadges, silver:silverBadges, bronze:bronzeBadges]
	}
	
	
	/* get REputation */
	def getReputation(idProfile) {
		
		def reputation = Profile.get(idProfile).reputation
		def events = reputation.events.sort{it.date}
		events = events.reverse()
		return [total: reputation.value, events: events]
		
	}
	
	
	/* get REputation */
	def getFewReputation(idProfile) {
		
		def reputation = getReputation(idProfile)
		def events = reputation.events
		if(events?.size() == 0 || events== null)
			return [total: reputation.total, events: events]
		def size = events.size()
		if (size < 3)
			return [total: reputation.total, events: events[0..(size-1)]]
		
		return [total: reputation.total, events: events[0..2]]
		
	}
	
	/* Edit profile */
    def edit(firstName, lastName, birthDate, aboutMe, idProfile) {
        def profile = Profile.get(idProfile)
        profile.firstName = firstName
        profile.lastName = lastName
        profile.birthDate = birthDate
        profile.aboutMe = aboutMe
       
        if (!profile.save(fflush:true)) {
            profile.errors.each{
               log.error(it)
            }
            return false
        }
       
        return profile
    }
	
}
