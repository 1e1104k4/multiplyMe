//
//  GameView.swift
//  multiplyMe
//
//  Created by Leila on 4/29/24.
//

import SwiftUI

struct Question {
    let text: String
    let answers: [String]
    let correctIndex: Int
}

struct GameView: View {
    let selectedMutiplicand: Int // pass from main view
    let amountOfRounds: Int
    
    @State private var questions: [Question] = []
    @State private var questionNumber = 0
    @State private var score = 0
    
    var body: some View {
        Form {
            if questions.isEmpty == false && questionNumber < questions.count {
                Text(questions[questionNumber].text)
                ForEach(0..<questions[questionNumber].answers.count, id: \.self) { index in
                    Button {
                        checkAnswer(index)
                    } label: {
                        Text(questions[questionNumber].answers[index])
                    }
                }
            }
            
            Text("Score: \(score)")
        }
        .onAppear(perform: startGame)
    }
    
    func generateQuestion() {
        let i = Int.random(in: 2...selectedMutiplicand)
        let j = Int.random(in: 2...14)
        let text = "\(i) x \(j) = ?"
        var answers: [String] = []
        let correctAnswer = i * j
        let incorrectFirst = correctAnswer + i
        let incorrectSecond = correctAnswer - i
        let incorrectThird = correctAnswer + j
        let incorrectForth = correctAnswer - j
        answers.append(String(correctAnswer))
        answers.append(String(incorrectFirst))
        answers.append(String(incorrectSecond))
        answers.append(String(incorrectThird))
        answers.append(String(incorrectForth))
        answers.shuffle()
        
        let question = Question(text: text, answers: answers, correctIndex: answers.firstIndex(of: String(correctAnswer)) ?? 0)
        questions.append(question)
    }
    
    func startGame() {
            questions.removeAll()
            while questions.count < amountOfRounds {
                generateQuestion()
            }
            questions.shuffle()
            questionNumber = 0
            score = 0
        }
    
    func checkAnswer(_ index: Int) {
        if index == questions[questionNumber].correctIndex {
            score += 1
        }
        questionNumber += 1
    }
}

#Preview {
    GameView(selectedMutiplicand: 3, amountOfRounds: 5)
}
