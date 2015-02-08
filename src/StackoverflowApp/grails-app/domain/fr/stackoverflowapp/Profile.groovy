package fr.stackoverflowapp

import fr.stackoverflowapp.secureapp.SecUser

class Profile {

	String firstName
	String lastName
	Date birthDate
	String aboutMe
	String photo
	
	def signInDate = new Date()
	int profileViewsNumber
	
	// Réputation
	static hasOne = [reputation: Reputation]
	
	
	// Question : in time or from the start
	static hasMany = [askedQuestions: Question,
						editedQuestions: Question,
						responses: Answer,
						badges: Badge]
	
	static belongsTo = [user: SecUser]
	
	static mappedBy = [
		askedQuestions : 'asker',
		editedQuestions : 'editor'
		]
    
    static constraints = {
		
		user(blank: false)
		firstName(blank: false)
		signInDate(blank: false)
		profileViewsNumber(blank: false)
		
		reputation(nullable: true)
		askedQuestions(nullable: true)
		editedQuestions(nullable: true)
		responses(nullable:true)
		badges(nullable:true)
    }
	static mapping = {
		
		profileViewsNumber defaultValue: 0
 
	}
	
	
	
	

}
