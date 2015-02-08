package fr.stackoverflowapp

class VoteAnswer {

	Date date = new Date()
	int  value
	static belongsTo = [profile: Profile, answer: Answer]
	
    static constraints = {
    }
    
    VoteAnswer(int in_value) {
		value = in_value
	}
}


