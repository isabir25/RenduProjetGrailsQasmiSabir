package fr.stackoverflowapp

class VoteQuestion {

	Date date = new Date()
	int  value
	static belongsTo = [profile: Profile, question: Question]
	
    static constraints = {
    }
    
    VoteQuestion(int in_value) {
		value = in_value
	}
}

