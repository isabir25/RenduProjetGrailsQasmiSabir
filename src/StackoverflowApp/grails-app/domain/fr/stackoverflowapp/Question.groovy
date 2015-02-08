package fr.stackoverflowapp

class Question {

	String title
	String body
	Date askDate = new Date()
	Date editDate
	int votesNumber
	int viewsNumber
	boolean blocked
	boolean _protected
	int flag
	
	static hasMany = [tags:Tags, answers: Answer, votes: VoteQuestion]
	static belongsTo = [asker: Profile]
	static hasOne = [editor: Profile]
    
    
	static constraints = {
		
		title(blank: false, minSize: 10)
		body(blank: false, minSize: 10)
		editDate(nullable: true)
		editor(nullable: true)
		answers(nullable: true)
		votes(nullable: true)
		
    }
	
	static mapping = {
		
		votesNumber defaultValue: 0
		viewsNumber defaultValue: 0
		blocked defaultValue: false
		_protected defaultValue: false
		flag defaultValue: 0
		
	}
	
	
	
	/***************************** TRIGGERS *****************************/
	/*
	def addStudentBadge() {
		def studentBadge = BadgeType.findByName("Student")
		if (studentBadge == null)
			log.error("CANNOT FIND STUDENT BADGE IN THE DATABASE")
		
		// add a student badge
		if (asker.askedQuestions == null && votesNumber >= 1 && !(studentBadge in asker.badges))
			asker.badges.add(studentBadge)
		else if (asker.askedQuestions.size() == 1 && votesNumber >= 1 && !(studentBadge in asker.badges)) {
			
			asker.addToBadges(studentBadge)

				if (!asker.save()) {
					asker.errors.each {
					log.error(it)
					}
				}	
				
			
			
			
			
		}
	}*/
	
	
	def addQuestionBadgeRelatedToViews() {
		def famousQuestionBadge = BadgeType.findByName("Famous Question")
		def popularQuestionBadge = BadgeType.findByName("Popular Question")
		def notableQuestionBadge = BadgeType.findByName("Notable Question")
		
		def badge
		if (viewsNumber == 10) {
			badge = Badge.findByProfileAndBadgeType(asker, notableQuestionBadge)
			if (badge) {
				badge.number ++
				return
			} 
			badge = new Badge(profile: asker, number: 1, badgeType:  notableQuestionBadge)
			if (!badge.save()) {
					badge.errors.each {
					log.error(it)
					}
				}	
		}
		if (viewsNumber == 20) {
			badge = Badge.findByProfileAndBadgeType(asker, popularQuestionBadge)
			if (badge) {
				badge.number ++
				return
			} 
			badge = new Badge(profile: asker, number: 1, badgeType:  popularQuestionBadge)
			if (!badge.save()) {
					badge.errors.each {
					log.error(it)
					}
				}	
		}
		if (viewsNumber == 30) {
			badge = Badge.findByProfileAndBadgeType(asker, famousQuestionBadge)
			if (badge) {
				badge.number ++
				return
			} 
			badge = new Badge(profile: asker, number: 1, badgeType:  famousQuestionBadge)
			if (!badge.save()) {
					badge.errors.each {
					log.error(it)
					}
				}	
		}
				
				
			
	}
	
	
	def addQuestionBadgeRelatedToVotes() {
		def niceQuestionBadge = BadgeType.findByName("Nice Question")
		def goodQuestionBadge = BadgeType.findByName("Good Question")
		def greatQuestionBadge = BadgeType.findByName("Great Question")
		
		def badge
		if (votesNumber == 10) {
			badge = Badge.findByProfileAndBadgeType(asker, niceQuestionBadge)
			if (badge) {
				badge.number ++
				return
			} 
			badge = new Badge(profile: asker, number: 1, badgeType:  niceQuestionBadge)
			if (!badge.save()) {
					badge.errors.each {
					log.error(it)
					}
				}	
		}
		if (votesNumber == 20) {
			badge = Badge.findByProfileAndBadgeType(asker, goodQuestionBadge)
			if (badge) {
				badge.number ++
				return
			} 
			badge = new Badge(profile: asker, number: 1, badgeType:  goodQuestionBadge)
			if (!badge.save()) {
					badge.errors.each {
					log.error(it)
					}
				}	
		}
		if (votesNumber == 30) {
			badge = Badge.findByProfileAndBadgeType(asker, greatQuestionBadge)
			if (badge) {
				badge.number ++
				return
			} 
			badge = new Badge(profile: asker, number: 1, badgeType:  greatQuestionBadge)
			if (!badge.save()) {
					badge.errors.each {
					log.error(it)
					}
				}	
		}
				
				
			
	}
	
	
	def afterInsert() {
		//addStudentBadge()
		def statistic = Statistic.get(1)
		statistic.nbrQuestion ++
		if (!statistic.save()) {
			statistic.errors.each {
				log.error(it)
			}
		}
	}
	
	def afterUpdate() {
		//addStudentBadge()
	}
	
	def afterDelete() {
		def statistic = Statistic.get(1)
		statistic.nbrQuestion --
		if (!statistic.save()) {
			statistic.errors.each {
				log.error(it)
			}
		}
	}
	
	
	def beforeUpdate() {
		addQuestionBadgeRelatedToVotes()
		addQuestionBadgeRelatedToViews()
		
	}
	
}
