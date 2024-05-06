//
//  SettingView.swift
//  multiplyMe
//
//  Created by Leila on 5/6/24.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedMutiplicand: Int
    @Binding var amountOfRounds: Int
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Practice Numbers Up To: \(selectedMutiplicand)", selection: $selectedMutiplicand) {
                    ForEach(2..<15) {
                        Text("\($0)").tag($0)
                    }
                }
                Stepper("Amount of Rounds: \(amountOfRounds)", value: $amountOfRounds, in: 5...20, step: 5)
            }
            .navigationTitle("Settings")
            .toolbar {
                Button("Save") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    SettingView(selectedMutiplicand: .constant(2), amountOfRounds: .constant(5))
}
