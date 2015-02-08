package fr.stackoverflowapp

import org.springframework.security.access.annotation.Secured

@Secured('permitAll')
class TagsController {

	def springSecurityService
	
    def index() {
			
		[tags: Tags.list(params)]
		
	}
	
	def create() {
		
		[tag: new Tags(params)]
	}
	
	def save(){
		
		def tag = new Tags(params)
		
		if (!tag.save(flush: true)) {
            render(view: "create", model: [tag: tag])
			return
		}		
		redirect(action: "index")
	}
	
	def show(){
		
		def tagelem = Tags.get(params.identifier)
		if (!tagelem) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag'), params.identifier])
			redirect(action: "index")
			return
		}
		[tag: tagelem]
	}
	
	def update(){
						
		def tag = Tags.get(params.id)  
				
		if (!tag) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tag')], params.id)
			redirect(action: "index")
			return
		}
		
		tag.properties = params
		if (!tag.save(flush: true)) {
			render(view: "show", model: [tag: tag])
			return
		}
		flash.message = message(code: 'default.updated.message', args: [message(code: 'tag.label', default: 'Tage'), tag.name])
		
		redirect(action: "index")
	}
	
	def delete(){
		
		def tag = Tags.get(params.identifier)
		
		if (!tag) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tag.label', default: 'Tage'), params.identifier])
			redirect(action: "index")
			return
		}

		tag.delete(flush: true)
		flash.message = message(code: 'default.deleted.message', args: [message(code: 'tag.label', default: 'Tage'), tag.name])
		redirect(action: "index")
		
	}
	
}
