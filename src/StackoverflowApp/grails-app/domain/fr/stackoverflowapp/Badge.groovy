package fr.stackoverflowapp


class Badge {

	int number
	BadgeType badgeType
	
	static belongsTo = [profile: Profile]
		
	
    static mapping = {
		number defaultValue: 0
	}
	
	
	
	static constraints = {
		badgeType(nullable: true)
		profile(nullable: true)
    }
 
    

    
	
}
