package fr.stackoverflowapp

import grails.transaction.Transactional

@Transactional
class QuestionService {

	/* Get a question */
	def get(idQuestion) {
		def question = Question.get(idQuestion)
		question.viewsNumber ++
		if (!question.save()) {
			question.errors.each {
				log.error(it)
			}
			return false
		}
		
		return question
	
	}


	/* Save a new question */
    def save(params, session) {
		def question = new Question(params)
		params.tags.each{ cp ->
			
			question.tags << Tags.get(cp)
		}
		
		//Load the current user Profile
		def profile = Profile.get(session.identifier)
		
		//add Question to asked question
		profile.addToAskedQuestions(question)
		
		//save profile and question at the same time
		if (!profile.save()) {
			profile.errors.each {
				log.error(it)
			}
			return false
		}
		
		return question
	}
		
	/* Update a question : only title and body might change */	
	def edit(params, session) {
		
		//Load question for update
		def question = Question.get(params.id)
		
		//Update Title and body
		question.title = params.title
		question.body =  params.body
		question.editDate = new Date()
		
		//Load the current user Profile
		def profile = Profile.get(session.identifier)
		
		//add Question to edited Questions
		profile.addToEditedQuestions(question)
		
		//save profile and question at the same
		if (!profile.save()) {
			profile.errors.each {
				log.error(it)
			}
			return false
		}
		
		return question
	
	}
	
		
	/* Find the last user who edited a question */
	def getEditProfile(idQuestion){
		
		return Question.get(idQuestion).editor
		
	}
		
	/* Get  question sorted by date */
	def getQuestionsSortedByDate(params){
	
		params.max?:5

		def questions = Question.listOrderByAskDate(offset:params.offset, max:params.max, order:"desc")
		return questions
		//[questions: questions, total: Question.count()?:0, tags: Tags.list(), params: params]
	}
	
	/* Get  question sorted by votes */
	def getQuestionsSortedByVotes(params){
	
		params.max?:5
		def questions = Question.listOrderByVotesNumber(offset:params.offset, max:params.max, order:"desc")
		return questions
		//[questions: questions, total: Question.count()?:0, tags: Tags.list(), params: params]
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* Get Num of question */
	def getQuestionNum() {
		return Statistic.get(1).nbrQuestion
	
	}
	
	/* Delete a question */
	def delete(idQuestion){
		/* When a question is deleted : 
		 * 		The answer is deleted too
		 *      Because events has foreign key on quesion we need to delete all events associated to this question
		 *		otherwise : Referential integrity constraint violation: PUBLIC.EVENT FOREIGN KEY(QUESTION_ID) REFERENCES PUBLIC.QUESTION(ID
		 */
		 Question question = Question.get(idQuestion)
		 question.asker.removeFromAskedQuestions(question)
		 question.editor?.removeFromEditedQuestions(question)
		 
		 Collection<Event> eventsRelatedToQuestion = Event.findAllByQuestion(question);
		 eventsRelatedToQuestion.each {
			it.reputation.removeFromEvents(it)
		 }
		 eventsRelatedToQuestion*.delete(fflush:true);
		 
		 question.delete(fflush:true)
		 
	}
	
	/* Upvote a question */
	def upVote(idQuestion, idProfile) {
		// Load question
		def question = Question.get(idQuestion)
		print "load question"
		// Check if the current user already votes
		def profile = Profile.get(idProfile)
		print "load profile"
		
		if (VoteQuestion.findAllByProfileAndQuestion(profile, question))
			{
			print "deja bote"
				return null
			}
		
		// Add new Vote
		VoteQuestion vote = new VoteQuestion(1)
		vote.profile = profile
		question.addToVotes(vote)
				
		// Increment votes
		question.votesNumber ++
		

		// Handle Reputation for the user who asked the question
		/* Check if profile has already a reputation */
		def reputation = Reputation.findByProfile(question.asker)
		
		if (!reputation) {
			reputation = new Reputation()
			reputation.profile = question.asker
			}
		
		// add the new event to reputation
		reputation.addToEvents(new Event(Event.QUESTION_IS_UPVOTED, question))
			
		// save reputation and question
		if (!reputation.save(fflush:true) || !question.save(fflush:true)) {
			reputation.errors?.each {
				log.error(it)
			}
			question.errors?.each {
				log.error(it)
			}
			return false
		}
		
		return question
		
	}
		
	/* Downvote a question */
	def downVote(idQuestion, idProfile) {
		
		// Load question
		def question = Question.get(idQuestion)
		print "load question"
		// Check if the current user already votes
		def profile = Profile.get(idProfile)
		print "load profile"
		
		if (VoteQuestion.findAllByProfileAndQuestion(profile, question))
			{
			print "deja bote"
				return null
			}
		
		// Add new Vote
		VoteQuestion vote = new VoteQuestion(-1)
		vote.profile = profile
		question.addToVotes(vote)
		
		// Increment votes
		question.votesNumber --
		
		// Handle Reputation for the user who asked the question
		/* Check if profile has already a reputation */
		def reputation = Reputation.findByProfile(question.asker)
		
		if (!reputation) {
			reputation = new Reputation()
			reputation.profile = question.asker
			}
		// add the new event to reputation
		reputation.addToEvents(new Event(Event.QUESTION_IS_DOWNVOTED, question))
			
		// save reputation and question
		if (!reputation.save(fflush:true) || !question.save(fflush:true)) {
			reputation.errors?.each {
				log.error(it)
			}
			question.errors?.each {
				log.error(it)
			}
			return false
		}
		
		return question
		
		
	}
	 /* Get the answer related to specific question */
    def getAnswers(idQuestion) {
        def answers = Question.get(idQuestion).answers
        answers = answers.sort{it.votesNumber}
        answers = answers.reverse()
        // check if there is any validate answer
        def validatedAnswer = null
        answers.each{
            if (it.validated)
                validatedAnswer = it
        }
        if (validatedAnswer){
            answers.remove(validatedAnswer)
            answers.add(0,validatedAnswer)
            }
        def total = 0
        total += answers?.size()
       
        return [answers: answers, total: total, flag: validatedAnswer?.id]

       
    }

	
	
}
