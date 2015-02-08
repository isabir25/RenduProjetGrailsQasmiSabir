package fr.stackoverflowapp

class Answer {

	String body
	Date editDate
	Date createDate = new Date()
	int votesNumber
	boolean validated
	
	
	static belongsTo = [question: Question]
	static hasOne = [profile: Profile, editor: Profile] //even if the profile is deleted we still want to have the answers posted
	static hasMany = [votes: VoteAnswer]
    static constraints = {
		
		body(blank: false, minSize: 10, maxSize: 1000)
		editDate(nullable: true)
		editor(nullable: true)
		
		
	}
	
	static mapping = {
		
		votesNumber defaultValue: 0
		validated defaultValue: false
	}
}
