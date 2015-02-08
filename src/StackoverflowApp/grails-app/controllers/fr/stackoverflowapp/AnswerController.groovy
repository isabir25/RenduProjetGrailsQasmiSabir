package fr.stackoverflowapp

import org.springframework.security.access.annotation.Secured

class AnswerController {

	AnswerService answerService
	def springSecurityService
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
    def index() {
    
    }
		
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def save(){		
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
		//call service to save answer
		answerService.save(params, session)
		log.info "post answer"					
		redirect(controller: 'question', action:'show', params: [identifier: params.idQuestion])
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
		//get answer by id and call view 
		log.info 'get answer ' + params.idAnswer
		[answer: Answer.get(params.idAnswer), idQuestion: params.idQuestion]
	}
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def update(){		
		//call sevrice to save update 
		answerService.edit(params, session)
		log.info 'update answer'
		redirect(controller: 'question', action:'show', params: [identifier: params.idQuestion])
	}
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def upVote(){		
		
		log.info 'up vote' + params.identifier
		//call service 
		def answer = answerService.upVote(params.identifier, session.identifier)
		
		if(!answer){
			log.info 'answer already voted' 
			//ajax : result redirection
			render  '<div class="alert alert-danger">Already voted</div>' 
			return
		}			
		
		//ajax : redirection of result 
		render answer.votesNumber
	}
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def downVote() {
		
		log.info 'up down' + params.identifier
		//cal service
		def answer = answerService.downVote(params.identifier, session.identifier)
		
		if(!answer){
			log.info 'answer already voted' 
			//ajax : result redirection
			render '<div class="alert alert-danger">Already voted</div>' 
			return 
		}
		
		//ajax : redirection of result
		render answer.votesNumber
	}
	
	@Secured(['ROLE_ADMIN', 'ROLE_USER'])
	def valideAnswer(){
		
		def validate = answerService.validate(params.identifier, session.identifier) 
		
		if(validate){
			log.info 'question is valide'
			//ajax : redirect result 
			render "<img src='${resource(dir:'images',file:'valide.png')}'  width='20' height='20' />"		
		}
	}
}
