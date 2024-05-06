//
//  EnterThrowScoreView.swift
//  Dart Club
//
//  Created by Antoine on 02/05/2024.
//

import SwiftUI

struct EnterThrowScoreView: View {
    
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    
    @ObservedObject var viewModel: GameViewModel
    
    @Binding var currentPlayerIndex: Int
    @State private var throwScores = Array(repeating: ScoreEntry(score: nil, isModified: false), count: 3)
    @State private var isDouble = [false, false, false]
    @State private var isTriple = [false, false, false]

    @FocusState private var isFocused: Bool
    @Environment(\.dismiss) var dismiss

    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Spacer()
                
                Text("\(viewModel.currentGame.players[currentPlayerIndex].name)")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .padding(.bottom, 1)

                Text("Enter your score")
                    .font(.system(size: 20, design: .default))

                ForEach(0..<3) { index in
                    ScoreInputRow(index: index, scoreEntry: $throwScores[index], isDouble: $isDouble[index], isTriple: $isTriple[index])
                        .focused($isFocused, equals: index == 0)
                }

                Button("OK          ") {
                    submitScores()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding()
                .disabled(!allScoresEntered)
                .onAppear {
                    DispatchQueue.main.async {
                        self.isFocused = true
                    }
                }

                if viewModel.currentGame.isToggledDoubleOut {
                    Text("Double Out")
                        .foregroundColor(.blue)
                }
                
//////////////////////////////////////////////////////////////////// DEBUG BUTTON /////////////////////////////////////////////////////////////////

        Button(action: {

            print("--------------------------------------------")
            print("--------------------------------------------")
            print("DEBUG")
            print("--------------------------------------------")
            print("--------------------------------------------")
            print("DOUBLE OUT: \(viewModel.currentGame.isToggledDoubleOut)")
            print(" ")
            print(" ")
            
        }) {
            Image(systemName: "ladybug.circle")
                .accessibilityLabel("Undo")
                .font(.system(size: 25))
                .padding()
                .buttonStyle(PlainButtonStyle())
        }
                    
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                
                Spacer()
                
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)

    }

    var allScoresEntered: Bool {
        let allFilled = throwScores.allSatisfy { $0.score != nil }
        let allValid = throwScores.allSatisfy { entry in
            guard let score = entry.score else { return false }
            return (0...20).contains(score) || score == 25 || isResultOfDoublingOrTripling(entry)
        }
        return allFilled && allValid
    }
    
    private func isResultOfDoublingOrTripling(_ scoreEntry: ScoreEntry) -> Bool {
        print("--------------------------------------------")
        print("isResultOfDoublingOrTripling FUNCTION")
        return scoreEntry.isDoubleButtonActivated || scoreEntry.isTripleButtonActivated
    }

    func submitScores() {
        print("--------------------------------------------")
        print("submitScores FUNCTION")
        if allScoresEntered {
            // Créer un tableau de tuples pour chaque lancer avec son score et s'il était un double
            let throwDetails = zip(throwScores.compactMap { $0.score }, isDouble).map { (score: $0, isDouble: $1) }
            viewModel.addScore(forPlayer: currentPlayerIndex, throwDetails: throwDetails)
            currentPlayerIndex = (currentPlayerIndex + 1) % viewModel.currentGame.players.count
            dismiss()
        }
    }

}

struct ScoreEntry {
    var score: Int?
    var isModified: Bool
    var isDoubleButtonActivated: Bool = false
    var isTripleButtonActivated: Bool = false
}

struct ScoreInputRow: View {
    let index: Int
    @Binding var scoreEntry: ScoreEntry
    @Binding var isDouble: Bool
    @Binding var isTriple: Bool
    @FocusState private var textFieldFocus: Bool

    var body: some View {
        
        HStack {
            
            Spacer()
            
            ToggleScoreButton(systemImageName: "2.square", isDoubleButton: true, isActivated: $isDouble, otherIsActivated: $isTriple, scoreEntry: $scoreEntry, factor: 2)
                .onChange(of: isDouble) {
                     textFieldFocus = false
                 }
            
            ToggleScoreButton(systemImageName: "3.square", isDoubleButton: false, isActivated: $isTriple, otherIsActivated: $isDouble, scoreEntry: $scoreEntry, factor: 3)
                .onChange(of: isTriple) {
                    textFieldFocus = false
                }
            
            TextField("\(ordinal(for: index+1)) throw", value: $scoreEntry.score, format: .number)
                .font(.system(size: 22))
                .multilineTextAlignment(.center)
                .padding()
                .keyboardType(.decimalPad)
                .frame(width: 130)
                .focused($textFieldFocus)
                .onChange(of: scoreEntry.score) {
                    if scoreEntry.score == nil {
                        isDouble = false
                        isTriple = false
                        scoreEntry.isDoubleButtonActivated = false
                        scoreEntry.isTripleButtonActivated = false
                    }
                }
                .onTapGesture {
                    if scoreEntry.score != nil {
                        scoreEntry.score = nil
                        isDouble = false
                        isTriple = false
                        scoreEntry.isDoubleButtonActivated = false
                        scoreEntry.isTripleButtonActivated = false
                    }
                }
            
            Spacer()
            Spacer()
            
        }
    }

    private func ordinal(for number: Int) -> String {
        let suffix: [String] = ["th", "st", "nd", "rd", "th", "th", "th", "th", "th", "th"]
        let ones = number % 10
        let tens = (number % 100) / 10
        if tens == 1 {
            return "\(number)th"
        } else {
            return "\(number)\(suffix[ones])"
        }
    }
}

struct ToggleScoreButton: View {
    let systemImageName: String
        let isDoubleButton: Bool
        @Binding var isActivated: Bool
        @Binding var otherIsActivated: Bool
        @Binding var scoreEntry: ScoreEntry
        let factor: Int

        var body: some View {
            Button(action: toggleState) {
                Image(systemName: iconForButton())
                    .font(.system(size: 35))
            }
            .buttonStyle(PlainButtonStyle())
            .foregroundColor(colorForButton())
            .disabled(shouldDisableButton() || otherIsActivated || scoreEntry.score == nil)
        }

    private func toggleState() {
        print("--------------------------------------------")
        print("toggleState FUNCTION")
        guard let currentScore = scoreEntry.score else { return }

        
        if isActivated {
            scoreEntry.score = currentScore / factor
            scoreEntry.isModified = false
        } else {
            scoreEntry.score = currentScore * factor
            scoreEntry.isModified = true
        }

        isActivated.toggle()

        if isActivated {
            if isDoubleButton {
                scoreEntry.isDoubleButtonActivated = true
                scoreEntry.isTripleButtonActivated = false
            } else {
                scoreEntry.isTripleButtonActivated = true
                scoreEntry.isDoubleButtonActivated = false
            }
        } else {
            if isDoubleButton {
                scoreEntry.isDoubleButtonActivated = false
            } else {
                scoreEntry.isTripleButtonActivated = false
            }
        }
    }

    private func shouldDisableButton() -> Bool {
        print("--------------------------------------------")
        print("shouldDisableButton FUNCTION")
        guard let score = scoreEntry.score else { return true }

        if scoreEntry.isDoubleButtonActivated || scoreEntry.isTripleButtonActivated {
            return false
        }

        if score == 25 && isDoubleButton {
            // Activer le bouton double
            return false
        }
        
        if score == 0 {
            return true
        }
        
        if score < 0 || score > 20 {
            return true
        }

        return false
    }

    private func iconForButton() -> String {
        print("--------------------------------------------")
        print("iconForButton FUNCTION")
          if shouldDisableButton() || otherIsActivated || scoreEntry.score == nil {
              return systemImageName
          } else {
              return isActivated ? "\(systemImageName).fill" : systemImageName
          }
      }
    
    private func colorForButton() -> Color {
        print("--------------------------------------------")
        print("colorForButton FUNCTION")
        if shouldDisableButton() || otherIsActivated || scoreEntry.score == nil {
            return .gray
        } else {
            return .blue
        }
    }
}


// ///////////////////////////
// PREVIEW //////////////////

struct EnterThrowScoreView_Previews: PreviewProvider {
    static var previews: some View {
        let gameType = 180
        let viewModel = GameViewModel(gameType: gameType)

        while viewModel.currentGame.players.count < 4 {
            viewModel.addPlayer()
        }

        viewModel.currentGame.players[0].name = "Alice"
        viewModel.currentGame.players[1].name = "Bob"
        viewModel.currentGame.players[2].name = "Charlie"
        viewModel.currentGame.players[3].name = "Dana"
        
        viewModel.currentGame.isToggledDoubleOut = true

        return Group {
            EnterThrowScoreView(viewModel: viewModel, currentPlayerIndex: .constant(0))
                .previewDisplayName("English")
                .environment(\.locale, Locale(identifier: "en"))

            EnterThrowScoreView(viewModel: viewModel, currentPlayerIndex: .constant(1))
                .previewDisplayName("Français")
                .environment(\.locale, Locale(identifier: "fr"))
        }
    }
}
