//
//  QuizModel.swift
//  CatAPI
//
//  Created by Pavel Ronaldo on 5/2/20.
//  Copyright © 2020 Pavel Ronaldo. All rights reserved.
//


import Foundation
import UIKit

class Question {
    var question : String?
    var answers : [Answer]!
    var image: String!
    
    init (question: String, answers: [Answer], image: String) {
        self.question = question
        self.answers = answers
        self.image = image    
    }
}

class Answer {
    var response: String!
    var isRight: Bool!
    
    init(answer: String, isRight: Bool) {
        self.response  = answer
        self.isRight = isRight
    }
}
