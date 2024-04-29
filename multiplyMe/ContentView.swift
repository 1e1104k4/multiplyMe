//
//  ContentView.swift
//  multiplyMe
//
//  Created by Leila on 4/28/24.
//

import SwiftUI

struct Question {
    let text: String
    let answers: [String]
    let correctIndex: Int
}

struct ContentView: View {
    @State private var selectedMutiplicand = 2
    
    @State private var questions: [Question] = []
    @State private var questionNumber = 0
    @State private var amountOfRounds = 10
    
    @State private var score = 0
    
    var body: some View {
        Form {
            Picker("Practice Numbers Up To: \(selectedMutiplicand)", selection: $selectedMutiplicand) {
                ForEach(2..<15) {
                    Text("\($0)").tag($0)
                }
            }
            Stepper("Amount of Rounds: \(amountOfRounds)", value: $amountOfRounds, in: 5...20, step: 5)
            Button("Start Game") {
                startGame()
            }
            
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
    ContentView()
}
