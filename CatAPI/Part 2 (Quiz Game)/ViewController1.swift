//
//  ViewController1.swift
//  CatAPI
//
//  Created by Pavel Ronaldo on 5/2/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//


import UIKit

class ViewController1: UIViewController {
    
        @IBOutlet weak var question: UILabel!
        @IBOutlet weak var imgQuestion: UIImageView!
        
        @IBOutlet weak var answer1: UIButton!
        @IBOutlet weak var answer2: UIButton!
        @IBOutlet weak var answer3: UIButton!
        @IBOutlet weak var answer4: UIButton!
        
        @IBOutlet weak var viewFeedback: UIView!
        @IBOutlet weak var feedbackText: UILabel!
        @IBOutlet weak var feedbackButton: UIButton!
        
        var questions : [Question]!
        var currentQuestion = 0
        var quizEnded = false
        
        override func viewDidLoad() {
            super.viewDidLoad()
            loadQuestions()
            startQuiz()
        }
        
        func loadQuestions() -> Void {
            let question1 = Question(
                question: "Guess the breed",

                answers: [
                    Answer(answer: "1", isRight: true),
                    Answer(answer: "2", isRight: false),
                    Answer(answer: "3", isRight: false),
                    Answer(answer: "4", isRight: false)
                ]
                
            )
            
            let question2 = Question(
                question: "Guess the breed",
                answers: [
                    Answer(answer: "22", isRight: true),
                    Answer(answer: "33", isRight: false),
                    Answer(answer: "", isRight: false),
                    Answer(answer: "", isRight: false)
                ]
                
            )
            
            self.questions = [
                question1,
                question2
            ]
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }

        @IBAction func chooseAnswer1(_ sender: AnyObject) {
            selectAnswer(0)
        }
        
        @IBAction func chooseAnswer2(_ sender: AnyObject) {
            selectAnswer(1)
        }
        
        @IBAction func chooseAnswer3(_ sender: AnyObject) {
            selectAnswer(2)
        }
        
        @IBAction func chooseAnswer4(_ sender: AnyObject) {
            selectAnswer(3)
        }
        
        func startQuiz() -> Void {
            questions.shuffle()
            
            for i in 0 ..< questions.count {
                questions[i].answers.shuffle()
            }
            
            quizEnded = false
            currentQuestion = 0
            viewFeedback.isHidden = true
            
            showQuestion(0)
        }
        
        func showQuestion(_ questionId : Int) -> Void {
            enableButtons()
            
            let selectedQuestion : Question = questions[questionId]
            question.text = selectedQuestion.question
            
            answer1.setTitle(selectedQuestion.answers[0].response, for: UIControl.State())
            answer2.setTitle(selectedQuestion.answers[1].response, for: UIControl.State())
            answer3.setTitle(selectedQuestion.answers[2].response, for: UIControl.State())
            answer4.setTitle(selectedQuestion.answers[3].response, for: UIControl.State())
        }
        
        func disableButtons() -> Void {
            answer1.isEnabled = false
            answer2.isEnabled = false
            answer3.isEnabled = false
            answer4.isEnabled = false
            question.isHidden = true
        }
        
        func enableButtons() -> Void {
            answer1.isEnabled = true
            answer2.isEnabled = true
            answer3.isEnabled = true
            answer4.isEnabled = true
            question.isHidden = false
        }
        
        func selectAnswer(_ answerId : Int) -> Void {
            disableButtons()
            
            let answer : Answer = questions[currentQuestion].answers[answerId]
            
            if (true == answer.isRight) {
                feedbackText.text = answer.response + "\n\nCorrect!"
                viewFeedback.backgroundColor = UIColor.green
                feedbackText.textColor = UIColor.black
            } else {
                viewFeedback.backgroundColor = UIColor.red
                feedbackText.text = answer.response + "\n\nFalse!"
                feedbackText.textColor = UIColor.white
            }
            
            if (currentQuestion < questions.count-1) {
                feedbackButton.setTitle("Next", for: UIControl.State())
            } else {
                feedbackButton.setTitle("end", for: UIControl.State())
            }
            
            viewFeedback.isHidden = false
        }
        
        @IBAction func sendFeedback(_ sender: AnyObject) {
            viewFeedback.isHidden = true
            
            if (true == quizEnded) {
                startQuiz()
            } else {
                nextQuestion()
            }
        }
        
        func nextQuestion() {
            currentQuestion += 1
            
            if (currentQuestion < questions.count) {
                showQuestion(currentQuestion)
            } else {
                endQuiz()
            }
        }
        
        func endQuiz() {
            quizEnded = true
            viewFeedback.isHidden = false
            feedbackButton.setTitle("Main Menu", for: UIControl.State())
        }
        
    }


//func downloadJson() {
//       guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?id=abys") else { return }
//              var request = URLRequest(url: url)
//              request.httpMethod = "GET"
//              request.addValue("f2c7dc04-508b-43fc-80e4-f6bd85ed285d", forHTTPHeaderField: "x-api-key")
//
//              let session = URLSession.shared
//              session.dataTask(with: request) { (data, response, error) in
//                  if let response = response {
//                      print(response)
//                  }
//
//                  if let data = data {
//                      do {
//                        let allcats = try JSONDecoder().decode([Image].self, from: data)
//
//                      } catch {
//                          print(error)
//                      }
//                  }
//
//              }.resume()
//
//          }
//
//
