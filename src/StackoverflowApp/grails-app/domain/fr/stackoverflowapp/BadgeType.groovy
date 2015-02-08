package fr.stackoverflowapp

class BadgeType {

	String name
	String description
	
	static belongsTo = [level: Level]
	
    static constraints = {
		name(blank: false)
		description(blank: false)
    }
}
