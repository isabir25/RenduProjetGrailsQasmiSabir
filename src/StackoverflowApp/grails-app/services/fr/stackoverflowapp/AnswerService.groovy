package fr.stackoverflowapp

import grails.transaction.Transactional
 
@Transactional
class AnswerService {

	/* Get a response */
	def get(idAnswer) {
		
		return Answer.get(idAnswer)
	
	}


	/* Save a new Answer */
    def save(params, session) {
		
		
		def answer  = new Answer()
		answer.body = params.body
		
		// user who answered 
		def profile = Profile.get(session.identifier)

		answer.profile = profile // we don't need to save profile it doesn't change 
		
		// the related question
		def question = Question.get(params.idQuestion)
		question.addToAnswers(answer)
		
		// Save question and the same time the answer
		if (!question.save(fflush:true)){
			question.errors.each {
				log.error(it)
				}
			return false
			}
		return answer
			
	}
	
	
	/* Edit a answer */
	def edit(params, session) {
		def answer = Answer.get(params.idAnswer)
		
		answer.body = params.body
		
		answer.editDate = new Date()
		answer.editor = Profile.get(session.identifier)

		//finally  save
		if (!answer.save(fflush:true)){
			answer.errors.each {
				log.error(it) }
			return answer
			}

		return answer
	}
	
	/* delete a answer */
	def delete(idAnswer) {
		def answer = Answer.delete(idAnswer)
		}
	
	
	/* UpVote a answer */
	def upVote(idAnswer, idProfile) {
		print '+++++++++++++++++++++++++++++' + idAnswer

		// Load answer
		def answer = Answer.get(idAnswer)

		// Load question
		def question = answer.question
		
		
		def profile = Profile.get(idProfile)
		print "load profile"
		
		if (VoteAnswer.findAllByProfileAndAnswer(profile, answer))
			{
			print "deja bote"
				return null
			}
		
		// Add new Vote
		VoteAnswer vote = new VoteAnswer(1)
		vote.profile = profile
		answer.addToVotes(vote)
		
		
		// Increment votes
		answer.votesNumber ++
		
		// Handle Reputation for the user who asked the question
		/* Check if profile has already a reputation */
		def reputation = Reputation.findByProfile(answer.profile)
		
		if (!reputation) {
			reputation = new Reputation()
			reputation.profile = answer.profile
			}
		// add the new event to reputation
		reputation.addToEvents(new Event(Event.ANSWER_IS_UPVOTED, question))
			
		// save reputation and question
		if (!reputation.save(fflush:true) || !answer.save(fflush:true)) {
			reputation.errors?.each {
				log.error(it)
			}
			answer.errors?.each {
				log.error(it)
			}
			return false
		}
		
		return answer
		
	}
	
	
	
	/* DownVote a answer */
	def downVote(idAnswer, idProfile) {
	
		
		// Load answer
		def answer = Answer.get(idAnswer)
		
		// Load question
		def question = answer.question
		
		def profile = Profile.get(idProfile)
		print "load profile"
		
		if (VoteAnswer.findAllByProfileAndAnswer(profile, answer))
			{
			print "deja bote"
				return null
			}
		
		// Add new Vote
		VoteAnswer vote = new VoteAnswer(-1)
		vote.profile = profile
		answer.addToVotes(vote)
		
		
		// Increment votes
		answer.votesNumber --
		
		
		// Handle Reputation for the user who asked the question
		/* Check if profile has already a reputation */
		def reputation = Reputation.findByProfile(answer.profile)
		
		if (!reputation) {
			reputation = new Reputation()
			reputation.profile = answer.profile
			}
		// add the new event to reputation
		reputation.addToEvents(new Event(Event.ANSWER_IS_DOWNVOTED, question))
			
		// save reputation and question
		if (!reputation.save(fflush:true) || !answer.save(fflush:true)) {
			reputation.errors?.each {
				log.error(it)
			}
			answer.errors?.each {
				log.error(it)
			}
			return false
		}
		
		return answer
		
	}
	
	
	def validate(idAnswer, idProfile) {

		def answer = Answer.get(idAnswer)
		def question = answer.question
		def profile_user_who_answer = answer.profile
		def profile_user_who_accept = Profile.get(idProfile)
		
		if (answer.validated) {
			return false
		}
		
		answer.validated = true
		def reputation_user_who_answer = Reputation.findByProfile(profile_user_who_answer)
		if (!reputation_user_who_answer) {
			reputation_user_who_answer = new Reputation()
			reputation_user_who_answer.profile = profile_user_who_answer
			}
		
		
		// add the new event to reputation
		reputation_user_who_answer.addToEvents(new Event(Event.ANSWER_IS_ACCEPTED, question))
		if (profile_user_who_answer == profile_user_who_accept){
			reputation_user_who_answer.addToEvents(new Event(Event.ACCEPT_ANSWER, question))
			}
		else {
			def reputation_user_who_accept = Reputation.findByProfile(profile_user_who_accept)
			if (!reputation_user_who_accept) {
				reputation_user_who_accept = new Reputation()
				reputation_user_who_accept.profile = profile_user_who_accept
			}
			
			// add the new event to reputation
			reputation_user_who_accept.addToEvents(new Event(Event.ACCEPT_ANSWER, question))
			if (!reputation_user_who_accept.save(fflush:true)){
				reputation_user_who_accept.errors.each {
					log.error(it)
					}
				}
			}

		if (!reputation_user_who_answer.save(fflush:true) || !answer.save(fflush:true)) {
			reputation_user_who_answer.errors?.each {
				log.error(it)
			}
			answer.errors?.each {
				log.error(it)
			}
			return false
		}
		
		return answer
	}
						
}		
