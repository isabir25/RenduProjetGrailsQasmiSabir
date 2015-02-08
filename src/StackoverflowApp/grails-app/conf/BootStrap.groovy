import java.util.Date;

import fr.stackoverflowapp.secureapp.SecRole
import fr.stackoverflowapp.secureapp.SecUser
import fr.stackoverflowapp.secureapp.SecUserSecRole
import fr.stackoverflowapp.Tags
import fr.stackoverflowapp.Profile
import fr.stackoverflowapp.Question
import fr.stackoverflowapp.BadgeType
import fr.stackoverflowapp.Level
import fr.stackoverflowapp.Statistic
import fr.stackoverflowapp.Reputation

class BootStrap {

    def init = { servletContext ->
		def adminRole = new SecRole(authority: 'ROLE_ADMIN').save(flush: true)
		def userRole = new SecRole(authority: 'ROLE_USER').save(flush: true)
	
		def testUser = new SecUser(username: 'admin', enabled: true, password: 'admin')
		def testUser2 = new SecUser(username: 'simpleUser', enabled: true, password: 'simpleUser')
		testUser.save(flush: true)
		testUser2.save(flush: true)
		
		SecUserSecRole.create testUser, adminRole, true
		SecUserSecRole.create testUser2, userRole, true
		/******************/
		
		//Init Statistic Table
		
		def statistic = new Statistic(getQuestionNum: 0)
		if (!statistic.save(flush: true)) {
			statistic.errors.each {
				println it
			}
		}
		
		/*********************/
		
		
		def profile = new Profile(firstName: 'John',lastName: 'DOE',
			birthDate: new Date(),aboutMe: "Compte administrateur de test",photo: "kjkk",
			signInDate: new Date(),profileViewsNumber: 0,
			askedQuestions: null,editedQuestions: null,answers: null,responses: null, badges:null,
			 user: testUser)

		if (!profile.save(flush: true)) {
			profile.errors.each {
				println it
			}
		}
		
		def reputation = new Reputation()
		reputation.profile = profile
		
		if (!reputation.save(fflush:true)){
			reputation.errors.each{
				println it
			}
		}
		
		// Some tags
		def tag = new Tags(name: 'Java', description: 'Java is a general-purpose programming language designed to be used in conjunction with the Java Virtual Machine (JVM).').save(flush: true)
		def tag1 = new Tags(name: 'Python', description: 'Python is a dynamic and strongly typed programming language that is designed to emphasize usability. ').save(flush: true)
		def tag2 = new Tags(name: 'Grails', description: 'Grails is an Open Source, full stack, web application framework that uses Groovy programming language (which is in turn based on the Java platform) and Java. ').save(flush: true)
		def tag3 = new Tags(name: 'Groovy', description: 'Groovy is an object-oriented programming language for the Java platform. It is a dynamic language with features similar to those of Python, Ruby, Perl and Smalltalk.').save(flush: true)

		
		
		// Levels
		def silverLevel = new Level(name: 'Silver', icon: '#C0C0C0').save(flush: true)
		def bronzeLevel = new Level(name: 'Bronze', icon: '#8c7853').save(flush: true)
		def goldLevel = new Level(name: 'Gold', icon: '#FFD700').save(flush: true)
		
		
		// Badges
		def scholar = new BadgeType(name: 'Scholar', description: 'DESCRIPTION')
		scholar.level = bronzeLevel
		scholar.save(fflush:true)
		
		def student = new BadgeType(name: 'Student', description: 'DESCRIPTION')
		student.level = bronzeLevel
		student.save(fflush:true)
		
		def popularQuestion = new BadgeType(name: 'Popular Question', description: 'DESCRIPTION')
		popularQuestion.level = bronzeLevel
		popularQuestion.save(fflush:true)
		
		def notableQuestion = new BadgeType(name: 'Notable Question', description: 'DESCRIPTION')
		notableQuestion.level = silverLevel
		notableQuestion.save(fflush:true)
		
		def famousQuestion = new BadgeType(name: 'Famous Question', description: 'DESCRIPTION')
		famousQuestion.level = goldLevel
		famousQuestion.save(fflush:true)
		
		def niceQuestion = new BadgeType(name: 'Nice Question', description: 'DESCRIPTION')
		niceQuestion.level = silverLevel
		niceQuestion.save(fflush:true)
		
		def goodQuestion = new BadgeType(name: 'Good Question', description: 'DESCRIPTION')
		goodQuestion.level = bronzeLevel
		goodQuestion.save(fflush:true)
		
		def greatQuestion = new BadgeType(name: 'Great Question', description: 'DESCRIPTION')
		greatQuestion.level = goldLevel
		greatQuestion.save(fflush:true)
		
		/*********************************	SOME QUESTION *********************************************/
		def mytags = [tag]
		def question1 = new Question(title: "Why is processing a sorted array faster than an unsorted array?",
										body: "Here is a piece of C++ code that seems very peculiar.",
										tags: tag,
									)
		def question2 = new Question(title: "Edit an incorrect commit message in Git",
										body: "I wrote the wrong thing in a commit message. How can I change the Message? The commit has not been pushed. ",
										tags: tag,
									)
		def question3 = new Question(title: "What is the correct JSON content type?",
										body: "I've been messing around with JSON for some time, just pushing it out as text and it hasn't hurt anybody (that I know of), but I'd like to start doing things properly. I have seen so many purported ... ",
										tags: tag,
									)
		def question4 = new Question(title: "The Definitive C++ Book Guide and List",
										body: "This question attempts to collect the few pearls among the dozens of bad C++ books that are published every year. Unlike many other programming languages,which are often picked up on the go from ... ",
										tags: tag,
									)
		def question5 = new Question(title: "Delete a Git branch both locally and remotely",
										body: "I want to delete a branch both locally and on my remote project fork on GitHub. Successfully Deleted Local Branch git branch -D bugfix Deleted branch bugfix (was 2a14ef7). Attempts to Delete ..",
										tags: tag,
									)
		def question6 = new Question(title: "What is the name of the  operator?",
										body: "After reading Hidden Features and Dark Corners of C++/STL on comp.lang.c++.moderated, I was completely surprised that it compiled and worked in both Visual Studio 2008 and G++ 4.4. The code: ... ",
										tags: tag,
									)
		def question7 = new Question(title: "How do JavaScript closures work?",
										body: "Like the old Albert Einstein said: If you can't explain it to a six-year-old, you really don't understand it yourself. Well, I tried to explain JavaScript closures to a 27-year-old friend and ... ",
										tags: tag,
									)
		def question8 = new Question(title: "Testing if something is hidden",
										body: "In jQuery, it is possible to toggle the visibility of an element, using the functions .hide(), .show() or .toggle(). Using jQuery, how would you test if an element is visible or hidden? ",
										tags: tag,
									)

		profile.addToAskedQuestions(question1).addToAskedQuestions(question2).addToAskedQuestions(question3)
		profile.addToAskedQuestions(question4).addToAskedQuestions(question5).addToAskedQuestions(question6)
		profile.addToAskedQuestions(question7).addToAskedQuestions(question8)
		profile.save(fflush:true)
		
		/*
		def profile2 = new Profile(firstName: 'imane',lastName: 'sabir',
			birthDate: new Date(),aboutMe: "dldk",photo: "kjkk",
			signInDate: new Date(),profileViewsNumber: 0,
			askedQuestions: null,editedQuestions: null,answers: null,responses: null, badges:null,
			 user: testUser).save(flush: true)
	
		
		
		def question = new Question(title: 'GROOVY PROBLEME', body: 'BODYBODYBODYBODYBODYBODYBODYBODY',
		asker: profile, editor: profile2).save(flush: true)
		def question2 = new Question(title: 'GROOVY PROBLEME', body: 'BODYBODYBODYBODYBODYBODYBODYBODY').save(flush: true)
		
		profile.addToAskedQuestions(question)
		profile2.addToAskedQuestions(question2)
		profile.addToEditedQuestions(question2)
		*/
		
			 
/*
 *
	String firstName
	String lastName
	Date birthDate
	String aboutMe
	String photo
	
	def signInDate= new Date()
	int profileViewsNumber
	
	// Réputation
	int reputation
	
	// Question : in time or from the start
	static hasMany = [askedQuestions: Question,
						editededQuestions: Question,
						answers: Question,
						responses: Question,
						badges: Badge]
	
	static belongsTo = [user: SecUser]
 * */
    }
    def destroy = {
    }
}
