//
//  MainView.swift
//  multiplyMe
//
//  Created by Leila on 4/29/24.
//

import SwiftUI

struct MainView: View {
    @State private var selectedMutiplicand = 2
    @State private var amountOfRounds = 10
    
    var body: some View {
        Form {
            Picker("Practice Numbers Up To: \(selectedMutiplicand)", selection: $selectedMutiplicand) {
                ForEach(2..<15) {
                    Text("\($0)").tag($0)
                }
            }
            Stepper("Amount of Rounds: \(amountOfRounds)", value: $amountOfRounds, in: 5...20, step: 5)
            NavigationLink(destination: GameView(selectedMutiplicand: selectedMutiplicand, amountOfRounds: amountOfRounds)) {
                Text("Start Game")
            }
        }
    }
}

#Preview {
    MainView()
}
