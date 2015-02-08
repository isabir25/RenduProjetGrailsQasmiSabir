package fr.stackoverflowapp

class Tags {

	String name
	String description
	
    static constraints = {
		
		name(blank: false)
		description(blank: false)
    }
}
