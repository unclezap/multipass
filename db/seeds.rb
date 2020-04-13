# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Answer.delete_all
Question.delete_all
Quiz.delete_all
UserScore.delete_all
User.delete_all

zeb = User.create(name: "Zeb")
joe = User.create(name: "Joe")
chris = User.create(name: "Chris")
jack = User.create(name: "Jack")

mtg = Quiz.create(title: "Magic Quiz", description: "All things Magic", user_id: joe.id, category: "Nerds", private: false)
birds = Quiz.create(title: "Bird Quiz!", description: "Some birds are cool", user_id: chris.id, category: "Nature", private: false)
instructor_dogs = Quiz.create(title: "Do You Know All Your Instructors' Cute Dogs???", description: "Match the dog to the instructor", user_id: zeb.id, category: "Nature", private: true)

ulamog = Question.create(question_text: "What set is Ulamog from?", quiz_id: mtg.id)
quail = Question.create(question_text: "Where does the California Quail live?", quiz_id: birds.id)
beans = Question.create(question_text: "Who does Beans belong to?", quiz_id: instructor_dogs.id)
paprika = Question.create(question_text: "Who does Paprika belong to?", quiz_id: instructor_dogs.id)

rightu = Answer.create(question_id: ulamog.id, correct: true, answer_text: "Rise of Aldrazi")
wrongu = Answer.create(question_id: ulamog.id, correct: false, answer_text: "Ikoria, Lair of Behemoths")

rightq = Answer.create(question_id: quail.id, correct: true, answer_text: "West Coast")
wrongq = Answer.create(question_id: quail.id, correct: false, answer_text: "Only Califorina")

rightb = Answer.create(question_id: beans.id, correct: true, answer_text: "Hal")
wrongb = Answer.create(question_id: beans.id, correct: false, answer_text: "John")

rightp = Answer.create(question_id: paprika.id, correct: true, answer_text: "Jake")
wrongp = Answer.create(question_id: paprika.id, correct: false, answer_text: "Jack")

test_score = UserScore.create(user_id: jack.id, quiz_id: instructor_dogs.id, score: 1)


