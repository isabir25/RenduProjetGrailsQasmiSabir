package fr.stackoverflowapp

import org.springframework.security.access.annotation.Secured

class QuestionController {
	
	//def tmpQuestion

	QuestionService questionService
	ProfileService profileService
	def springSecurityService
    
    
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def createQuestion(){
		
		//get user profile if it is null
		if(!session.data){
			def user = springSecurityService.getCurrentUser()			
			def res = Profile.executeQuery("select a from Profile a " +
				"where a.user.id = ?",
				[user.id])			
			session.identifier = res[0].id
			session.firstName = res[0].firstName
			session.lastName = res[0].lastName
		}
		// redirect to create question view
		[tags: Tags.list(params)]
	}
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def save(){
		
		log.info 'save question'
		//create new question
		def question = questionService.save(params, session)
		if(question != null){
			log.info 'question is created'
			redirect(action: "show",  params: [identifier: question.id])			
		}
		else{
			log.info 'error: question is not created'
			redirect(action: "createQuestion")
		}
	}
	
	@Secured('permitAll')
	def show(){
		log.info 'question id : ' + params.identifier
		//get question by id
		def question = questionService.get(params.identifier)
		if(question != null){
		
			log.info 'question is not null'
			//call service to get editor profile
			def editProfile = questionService.getEditProfile(params.identifier)			
			//get question tags list 
			def listTagsJson = question.tags.name.join(',')
			//get question answers
			def answers = questionService.getAnswers(params.identifier)
			//get asker user badges
			def askerBadgesLevel = profileService.getBadgesLevel(question.asker.id)
			
			//get editor user badges
			def editorBadgesLevel
			if(question.editor != null)
				editorBadgesLevel = profileService.getBadgesLevel(question.editor.id)
		
			//redirect to show question
			[myQuestion: question, editedProfile: editProfile, listTagsJson: listTagsJson, answers: answers,
			askerBadgesLevel: askerBadgesLevel, editorBadgesLevel: editorBadgesLevel]
		}
		else{
			
			log.info 'error : question is not exist'
			redirect(action: "createQuestion")
		}
	}
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def edit(){
		
		//get user profile if it is null
		if(!session.data){
			def user = springSecurityService.getCurrentUser()			
			def res = Profile.executeQuery("select a from Profile a " +
				"where a.user.id = ?",
				[user.id])			
			session.identifier = res[0].id
			session.firstName = res[0].firstName
			session.lastName = res[0].lastName
		}
		//get question to edit by id
		def question = Question.get(params.identifier)
		
		if(question != null){
			
			log.info 'question id : ' + question.id
			//call service to get edit profile and redirect to edition view
			[question: question, 
				editedProfile: Profile.get(session.identifier),
				tags: Tags.list(params)]
		}
		else{
			log.info 'question is not exist'
			redirect(action: "createQuestion")
		}
	}
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def update(){
		
		//call update question service
		def question = questionService.edit(params, session)
				
		if (!question) {
			
			log.info 'question updated'
			redirect(action: "show",  params: [identifier: question.id])
			return
		}
		log.info 'cant update question'	
		redirect(action: "show",  params: [identifier: question.id])
	}
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def delete(){
		
		//call delete question service by id		
		questionService.delete(params.identifier)
		
		redirect(action: "questions")
	}
	
	@Secured('permitAll')
	def questions(){
		
		log.info 'all questions'
		params.max = 5
		//get questions sorted by date
		def questionsOrderByDate = questionService.getQuestionsSortedByDate(params)
		//get questions sorted by vote
		def questionsOrderByVotes= questionService.getQuestionsSortedByVotes(params)
		
		[questionsOrderByDate: questionsOrderByDate, 
		questionsOrderByVotes: questionsOrderByVotes,
		total: Question.count()?:0, tags: Tags.list(), params: params,nbQuestions: questionService.getQuestionNum()]
	}
	
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def upVote(){		
		//call service vote
		def question = questionService.upVote(params.identifier, session.identifier)
		if(question == null){
			log.info 'question already voted' 
			//ajax : result redirection
			render  '<div class="alert alert-danger">Already voted</div>'
			return 
		}
			
		//ajax : result redirection
		render question.votesNumber
	}
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def downVote() {
		
		//call service vote
		def question = questionService.downVote(params.identifier, session.identifier)
		if(question == null){
			log.info 'question already voted' 
			//ajax : result redirection
			render  '<div class="alert alert-danger">Already voted</div>'
			return
		}
		
		//ajax : result redirection
		render question.votesNumber
	}
	
}
