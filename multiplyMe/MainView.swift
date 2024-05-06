//
//  MainView.swift
//  multiplyMe
//
//  Created by Leila on 4/29/24.
//

import SwiftUI

struct MainView: View {
    @State private var isSettingSheet = false
    @State private var selectedMutiplicand = 2
    @State private var amountOfRounds = 10
    
    var body: some View {
        NavigationStack {
            Form {
                NavigationLink(destination: GameView(selectedMutiplicand: selectedMutiplicand, amountOfRounds: amountOfRounds)) {
                    Text("Start Game")
                }
                Button("Settings") {
                    isSettingSheet.toggle()
                }
            }
            .sheet(isPresented: $isSettingSheet) {
                SettingView(selectedMutiplicand: $selectedMutiplicand, amountOfRounds: $amountOfRounds)
            }
            .navigationTitle("MultiplyMe")
        }
    }
}

#Preview {
    MainView()
}
