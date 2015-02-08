package fr.stackoverflowapp


class Reputation {

	int value
	Profile profile
	
	static hasMany = [events: Event]
	
    static mapping = {
		value defaultValue: 0
	}
	
	
	
	static constraints = {
		events(nullable: true)
    }
   
def calculateValue () {
		value = 0
		events.each{
			value += it.point
		}
		return value
		
    }
	
	
}
