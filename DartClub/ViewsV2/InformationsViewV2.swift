//
//  InformationsView.swift
//  DartClub
//
//  Created by Antoine on 23/04/2024.
//

import SwiftUI

struct InformationsViewV2: View {
    
    @State private var showCreditView = false

    @Binding var throwsScoresHistories: [GameViewV2.ThrowsScoresHistory]
    
    @Binding var player1ThrowsScores: [Int]
    @Binding var player2ThrowsScores: [Int]
    @Binding var player3ThrowsScores: [Int]
    @Binding var player4ThrowsScores: [Int]

    var totalScorePlayer1: Int
    var totalScorePlayer2: Int
    var totalScorePlayer3: Int
    var totalScorePlayer4: Int

    var namePlayer1: String
    var namePlayer2: String
    var namePlayer3: String
    var namePlayer4: String

    var player1Wins: Int {
        throwsScoresHistories.filter { $0.winner == namePlayer1 }.count
    }
        
    var player2Wins: Int {
        throwsScoresHistories.filter { $0.winner == namePlayer2 }.count
    }
        
    var player3Wins: Int {
        throwsScoresHistories.filter { $0.winner == namePlayer3 }.count
    }
    
    var player4Wins: Int {
        throwsScoresHistories.filter { $0.winner == namePlayer4 }.count
    }

    var body: some View {
        VStack {
            
            VStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 1)
            }
            
            ScrollView {
                
                LazyVStack(pinnedViews: .sectionHeaders) {
                    
                    Section {
                        
                        // Premier tableau
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue.opacity(0.2))
                                .padding(.horizontal)
                            
                            VStack {
                                
                                Text("CURRENT GAME")
                                    .fontWeight(.bold)
                                
                                Divider()
                                Spacer()
                                
                                if !player1ThrowsScores.isEmpty || !player2ThrowsScores.isEmpty || !player3ThrowsScores.isEmpty || !player4ThrowsScores.isEmpty {
                                    VStack {
                                        Spacer()

                                        HStack {
                                            
                                            Text("")
                                                .fontWeight(.bold)
                                                .frame(maxWidth: .infinity)
                                            
                                            Text("\(namePlayer1)")
                                                .fontWeight(.bold)
                                                .font(.system(size: 17))
                                                .frame(maxWidth: .infinity)
                                                .padding(.bottom, 15)
                                            
                                            Spacer()
                                            
                                            Text("\(namePlayer2)")
                                                .fontWeight(.bold)
                                                .font(.system(size: 17))
                                                .frame(maxWidth: .infinity)
                                                .padding(.bottom, 15)
                                            
                                            if !namePlayer3.isEmpty {
                                                
                                                Spacer()
                                                
                                                Text("\(namePlayer3)")
                                                    .fontWeight(.bold)
                                                    .font(.system(size: 17))
                                                    .frame(maxWidth: .infinity)
                                                    .padding(.bottom, 15)
                                                
                                            }
                                            
                                            if !namePlayer4.isEmpty {
                                                
                                                Spacer()
                                                
                                                Text("\(namePlayer4)")
                                                    .fontWeight(.bold)
                                                    .font(.system(size: 17))
                                                    .frame(maxWidth: .infinity)
                                                    .padding(.bottom, 15)
                                                
                                            }
                                            
                                        }
                                        .padding(.horizontal)
                                        
                                        ForEach(0..<max(player1ThrowsScores.count, player2ThrowsScores.count, player3ThrowsScores.count, player4ThrowsScores.count), id: \.self) { index in
                                            
                                            Divider()
                                            
                                            HStack {
                                                
                                                Spacer()
                                                
                                                Text("Turn \(index + 1)")
                                                    .fontWeight(.bold)
                                                    .font(.system(size: 15))
                                                    .frame(maxWidth: .infinity)
                                                
                                                Spacer()
                                                Divider()
                                                
                                                Text("\(index < player1ThrowsScores.count ? "\(player1ThrowsScores[index])" : "-")")
                                                    .frame(maxWidth: .infinity)
                                                    .font(.system(size: 17))
                                                
                                                Spacer()
                                                Divider()
                                                
                                                Text("\(index < player2ThrowsScores.count ? "\(player2ThrowsScores[index])" : "-")")
                                                    .frame(maxWidth: .infinity)
                                                    .font(.system(size: 17))
                                                
                                                if !namePlayer3.isEmpty {
                                                    
                                                    Spacer()
                                                    Divider()
                                                    
                                                    Text("\(index < player3ThrowsScores.count ? "\(player3ThrowsScores[index])" : "-")")
                                                        .frame(maxWidth: .infinity)
                                                        .font(.system(size: 17))
                                                }
                                                
                                                
                                                if !namePlayer4.isEmpty {
                                                    
                                                    Spacer()
                                                    Divider()
                                                    
                                                    Text("\(index < player4ThrowsScores.count ? "\(player4ThrowsScores[index])" : "-")")
                                                        .frame(maxWidth: .infinity)
                                                        .font(.system(size: 17))
                                                }

                                            }
                                            .padding(.horizontal)
                                            
                                            Divider()
                                            
                                        }
                                        
                                        Divider()

                                        HStack {
                                            
                                            Spacer()

                                            Text("Score")
                                                .font(.system(size: 15))
                                                .fontWeight(.bold)
                                                .frame(maxWidth: .infinity)
                                            
                                            Spacer()
                                            Divider()
                                            
                                            Text("\(totalScorePlayer1)")
                                                .font(.system(size: 15))
                                                .fontWeight(.bold)
                                                .frame(maxWidth: .infinity)
                                            
                                            Spacer()
                                            Divider()
                                            
                                            Text("\(totalScorePlayer2)")
                                                .font(.system(size: 15))
                                                .fontWeight(.bold)
                                                .frame(maxWidth: .infinity)
                                            
                                            if !namePlayer3.isEmpty {
                                                
                                                Spacer()
                                                Divider()
                                                
                                                Text("\(totalScorePlayer3)")
                                                    .font(.system(size: 15))
                                                    .fontWeight(.bold)
                                                    .frame(maxWidth: .infinity)
                                                
                                            }
                                            
                                            if !namePlayer4.isEmpty {
                                                
                                                Spacer()
                                                Divider()
                                                
                                                Text("\(totalScorePlayer4)")
                                                    .font(.system(size: 15))
                                                    .fontWeight(.bold)
                                                    .frame(maxWidth: .infinity)
                                                
                                            }
                                            
                                        }
                                        .padding(.horizontal)
                                        
                                        Spacer()
                                        
                                        Divider()
                                        Divider()
                                        
                                        Text("Average Throws Score")
                                            .frame(maxWidth: .infinity)
                                            .font(.system(size: 14))
                                            .fontWeight(.bold)

                                        Divider()
                                        
                                        HStack {
                                            
                                            Spacer()

                                            Text("\(namePlayer1)")
                                                .font(.system(size: 14))
                                                .frame(maxWidth: .infinity)
                                            
                                            Spacer()
                                            Divider()
                                            
                                            Text("\(calculateAverageThrowsScore(scores: player1ThrowsScores))")
                                                .frame(maxWidth: .infinity)
                                                .font(.system(size: 14))
                                            
                                            Spacer()
                                        }
                                        
                                        Divider()

                                        HStack {
                                            
                                            Spacer()

                                            Text("\(namePlayer2)")
                                            .font(.system(size: 14))
                                            .frame(maxWidth: .infinity)

                                            Spacer()
                                            Divider()

                                            Text("\(calculateAverageThrowsScore(scores: player2ThrowsScores))")
                                                .frame(maxWidth: .infinity)
                                                .font(.system(size: 14))
                                            
                                            Spacer()

                                        }
                                        
                                        if !player3ThrowsScores.isEmpty {

                                            Divider()
                                            
                                            HStack {
                                                         
                                                Spacer()

                                                Text("\(namePlayer3)")
                                                    .font(.system(size: 14))
                                                    .frame(maxWidth: .infinity)

                                                Spacer()
                                                Divider()

                                                Text("\(calculateAverageThrowsScore(scores: player3ThrowsScores))")
                                                    .frame(maxWidth: .infinity)
                                                    .font(.system(size: 14))
                                                
                                                Spacer()
                                                
                                            }
                                        }
                                                                                
                                        if !player4ThrowsScores.isEmpty {

                                            Divider()
                                            
                                            HStack {
                                                         
                                                Spacer()

                                                Text("\(namePlayer4)")
                                                    .font(.system(size: 14))
                                                    .frame(maxWidth: .infinity)

                                                Spacer()
                                                Divider()

                                                Text("\(calculateAverageThrowsScore(scores: player4ThrowsScores))")
                                                    .frame(maxWidth: .infinity)
                                                    .font(.system(size: 14))
                                                
                                                Spacer()
                                                
                                            }
                                        }
                                    }
                                }
                            }.padding()
                        }
                        
                    } header: {
                        Text("ScoreBoard")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                    }
                    .padding(.bottom, 15)
                    
                    if !throwsScoresHistories.isEmpty {
                        
                        Section {
                            
                            // Deuxième tableau
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color.green.opacity(0.2))
                                    .padding(.horizontal)
                                
                                VStack {
                                    
                                    ForEach(throwsScoresHistories.indices, id: \.self) { index in
                                        let history = throwsScoresHistories[index]
                                        if !history.winner.isEmpty {
                                            
                                            VStack {
                                                
                                                Text("GAME \(index + 1)")
                                                    .fontWeight(.bold)
                                                    .font(.system(size: 20))

                                                Spacer()
                                                
                                                Text("🎉 \(history.winner) won! 🥇")
                                                    .fontWeight(.bold)
                                                
                                                Divider()
                                                Spacer()
                                                
                                                Spacer()
                                                
                                                HStack {
                                                    Text("")
                                                        .fontWeight(.bold)
                                                        .frame(maxWidth: .infinity)
                                                    
                                                    Text("\(namePlayer1)")
                                                        .fontWeight(.bold)
                                                        .font(.system(size: 17))
                                                        .frame(maxWidth: .infinity)
                                                        .padding(.bottom, 15)
                                                    
                                                    Spacer()
                                                    
                                                    Text("\(namePlayer2)")
                                                        .fontWeight(.bold)
                                                        .font(.system(size: 17))
                                                        .frame(maxWidth: .infinity)
                                                        .padding(.bottom, 15)
                                                    
                                                    Spacer()
                                                    
                                                    if !history.player3.isEmpty {
                                                        Text("\(namePlayer3)")
                                                            .fontWeight(.bold)
                                                            .font(.system(size: 17))
                                                            .frame(maxWidth: .infinity)
                                                            .padding(.bottom, 15)
                                                        
                                                        Spacer()
                                                    }
                                                    
                                                    Spacer()
                                                    
                                                    if !history.player4.isEmpty {
                                                        Text("\(namePlayer4)")
                                                            .fontWeight(.bold)
                                                            .font(.system(size: 17))
                                                            .frame(maxWidth: .infinity)
                                                            .padding(.bottom, 15)
                                                        
                                                        Spacer()
                                                        
                                                    }
                                                }
                                                .padding(.horizontal)
                                                
                                                ForEach(0..<max(history.player1.count, history.player2.count, history.player3.count, history.player4.count), id: \.self) { index in
                                                    
                                                    Divider()
                                                    
                                                    HStack {
                                                        
                                                        Text("Turn \(index + 1)")
                                                            .fontWeight(.bold)
                                                            .font(.system(size: 15))
                                                            .frame(maxWidth: .infinity)
                                                        
                                                        Spacer()
                                                        Divider()
                                                        
                                                        Text("\(index < history.player1.count ? "\(history.player1[index])" : "-")")
                                                            .frame(maxWidth: .infinity)
                                                            .font(.system(size: 17))
                                                        
                                                        Spacer()
                                                        Divider()
                                                        
                                                        Text("\(index < history.player2.count ? "\(history.player2[index])" : "-")")
                                                            .frame(maxWidth: .infinity)
                                                            .font(.system(size: 17))
                                                        
                                                        Spacer()
                                                        Divider()
                                                        
                                                        if !history.player3.isEmpty {
                                                            Text("\(index < history.player3.count ? "\(history.player3[index])" : "-")")
                                                                .frame(maxWidth: .infinity)
                                                                .font(.system(size: 17))
                                                            
                                                            Spacer()
                                                            Divider()
                                                        }
                                                        
                                                        if !history.player4.isEmpty {
                                                            Text("\(index < history.player4.count ? "\(history.player4[index])" : "-")")
                                                                .frame(maxWidth: .infinity)
                                                                .font(.system(size: 17))
                                                                
                                                            Spacer()
                                                            
                                                        }
                                                    }
                                                    .padding(.horizontal)
                                                    
                                                    Divider()
                                                }
                                                
                                                Text("Average Throws Score")
                                                    .frame(maxWidth: .infinity)
                                                    .font(.system(size: 14))
                                                    .fontWeight(.bold)
                                                
                                                Divider()
                                                
                                                HStack {
                                                    
                                                    Spacer()
                                                    
                                                    Text("\(namePlayer1)")
                                                        .font(.system(size: 14))
                                                        .frame(maxWidth: .infinity)
                                                    
                                                    Spacer()
                                                    Divider()
                                                    
                                                    Text("\(calculateAverageThrowsScore(scores: history.player1))")
                                                        .frame(maxWidth: .infinity)
                                                        .font(.system(size: 14))
                                                    
                                                    Spacer()
                                                }
                                                
                                                Divider()
                                                
                                                HStack {
                                                    
                                                    Spacer()
                                                    
                                                    Text("\(namePlayer2)")
                                                        .font(.system(size: 14))
                                                        .frame(maxWidth: .infinity)
                                                    
                                                    Spacer()
                                                    Divider()
                                                    
                                                    Text("\(calculateAverageThrowsScore(scores: history.player2))")
                                                        .frame(maxWidth: .infinity)
                                                        .font(.system(size: 14))
                                                    
                                                    Spacer()
                                                    
                                                }
                                                
                                                Divider()
                                                
                                                if !history.player3.isEmpty {
                                                    
                                                    HStack {
                                                        
                                                        Spacer()
                                                        
                                                        Text("\(namePlayer3)")
                                                            .font(.system(size: 14))
                                                            .frame(maxWidth: .infinity)
                                                        
                                                        Spacer()
                                                        Divider()
                                                        
                                                        Text("\(calculateAverageThrowsScore(scores: history.player3))")
                                                            .frame(maxWidth: .infinity)
                                                            .font(.system(size: 14))
                                                        
                                                        Spacer()
                                                        
                                                    }
                                                    Divider()
                                                }
                                                                                                
                                                if !history.player4.isEmpty {
                                                    
                                                    HStack {
                                                        
                                                        Spacer()
                                                        
                                                        Text("\(namePlayer4)")
                                                            .font(.system(size: 14))
                                                            .frame(maxWidth: .infinity)
                                                        
                                                        Spacer()
                                                        Divider()
                                                        
                                                        Text("\(calculateAverageThrowsScore(scores: history.player4))")
                                                            .frame(maxWidth: .infinity)
                                                            .font(.system(size: 14))
                                                        
                                                        Spacer()
                                                        
                                                    }
                                                    Divider()
                                                }
                                            }
                                            .padding()
                                            
                                        }
                                        
                                    }
                                }
                            }
                            
                        } header: {
                            Text("History")
                                .font(.title)
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                        }
                        
                    }
                                        
                    // Troisième tableau
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.yellow.opacity(0.2))
                            .padding(.horizontal)
                        
                        VStack {
                            
                            Text("🎉 VICTORIES 🥇")
                                .font(.headline)
                                .padding(.top, 15)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Divider()
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Text("\(namePlayer1)")
                                        .font(.system(size: 17))
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity)

                                    Spacer()
                                    Divider()

                                    Text("\(player1Wins)")
                                        .font(.system(size: 17))
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity)

                                    Spacer()
                                    
                                }
                                
                                Divider()
                                
                                HStack {
                                    
                                    Spacer()
                                    
                                    Text("\(namePlayer2)")
                                        .font(.system(size: 17))
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity)

                                    Spacer()
                                    Divider()

                                    Text("\(player2Wins)")
                                        .font(.system(size: 17))
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity)

                                    Spacer()
                                }
                                                                
                                if !namePlayer3.isEmpty {

                                    Divider()

                                    HStack {
                                        
                                        Spacer()
                                        
                                        Text("\(namePlayer3)")
                                            .font(.system(size: 17))
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity)

                                        Spacer()
                                        Divider()

                                        Text("\(player3Wins)")
                                            .font(.system(size: 17))
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity)

                                        Spacer()
                                        
                                    }
                                    
                                }

                                if !namePlayer4.isEmpty {
                                    
                                    Divider()
                                    
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Text("\(namePlayer4)")
                                            .font(.system(size: 17))
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity)

                                        Spacer()
                                        Divider()

                                        Text("\(player4Wins)")
                                            .font(.system(size: 17))
                                            .fontWeight(.bold)
                                            .frame(maxWidth: .infinity)

                                        Spacer()
                                        
                                    }
                                    
                                }
                            }
                            .padding()
                        }
                    }
                    Image(systemName: "info.bubble")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .onTapGesture {
                            showCreditView = true
                        }
                        .padding(.bottom, 25)
                        .padding(.top, 25)
                        .sheet(isPresented: $showCreditView) {
                                   CreditView()
                        }
                }
            }
        }
    }
}


// FUNCTIONS ///////////////////

func calculateAverageThrowsScoreV2(scores: [Int]) -> Int {
  guard !scores.isEmpty else { return 0 }
  let sum = scores.reduce(0, +)
  return Int(round(Double(sum) / Double(scores.count)))
}

// PREVIEW ///////////////////


struct InformationsViewV2_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // 4 Players
            InformationsViewV2(throwsScoresHistories: .constant([GameViewV2.ThrowsScoresHistory(player1: [5, 57, 25, 65, 89, 45, 78], player2: [45, 36, 75, 29, 27, 65, 25], player3: [14, 28, 35, 45, 20, 18], player4: [26, 14, 22, 98, 36, 50], winner: "Bob"), GameViewV2.ThrowsScoresHistory(player1: [15, 5, 2, 25, 29, 35, 8], player2: [25, 6, 15, 19, 37, 62], player3: [4, 18, 31, 15, 29, 17], player4: [3, 20, 31, 19, 27, 36], winner: "Alice")]),
                               player1ThrowsScores: .constant([10, 55, 35, 15]),
                               player2ThrowsScores: .constant([25, 41, 17]),
                               player3ThrowsScores: .constant([54, 22, 14]),
                               player4ThrowsScores: .constant([27, 34, 12]),
                               totalScorePlayer1: 369,
                               totalScorePlayer2: 250,
                               totalScorePlayer3: 150,
                               totalScorePlayer4: 230,
                               namePlayer1: "Alice",
                               namePlayer2: "Bob",
                               namePlayer3: "Charlie",
                               namePlayer4: "Joe")
                .previewDevice(PreviewDevice(rawValue: "4 Players"))
                .previewDisplayName("4 Players")
            
            // 3 Players
            InformationsViewV2(throwsScoresHistories: .constant([GameViewV2.ThrowsScoresHistory(player1: [5, 57, 25, 65, 89, 45, 78], player2: [45, 36, 75, 29, 27, 65, 25], player3: [14, 28, 35, 45, 20, 18], player4: [], winner: "Bob"), GameViewV2.ThrowsScoresHistory(player1: [15, 5, 2, 25, 29, 35, 8], player2: [25, 6, 15, 19, 37, 62], player3: [4, 18, 31, 15, 29, 17], player4: [], winner: "Alice")]),
                               player1ThrowsScores: .constant([10, 55, 35, 15]),
                               player2ThrowsScores: .constant([25, 41, 17]),
                               player3ThrowsScores: .constant([54, 22, 14]),
                               player4ThrowsScores: .constant([]),
                               totalScorePlayer1: 369,
                               totalScorePlayer2: 250,
                               totalScorePlayer3: 150,
                               totalScorePlayer4: 230,
                               namePlayer1: "Alice",
                               namePlayer2: "Bob",
                               namePlayer3: "Charlie",
                               namePlayer4: "")
                .previewDevice(PreviewDevice(rawValue: "3 Players"))
                .previewDisplayName("3 Players")
            
            // 2 Players
            InformationsViewV2(throwsScoresHistories: .constant([GameViewV2.ThrowsScoresHistory(player1: [5, 57, 25, 65, 89, 45, 78], player2: [45, 36, 75, 29, 27, 65, 25], player3: [], player4: [], winner: "Bob"), GameViewV2.ThrowsScoresHistory(player1: [15, 5, 2, 25, 29, 35, 8], player2: [25, 6, 15, 19, 37, 62], player3: [], player4: [], winner: "Alice")]),
                               player1ThrowsScores: .constant([10, 55, 35, 15]),
                               player2ThrowsScores: .constant([25, 41, 17]),
                               player3ThrowsScores: .constant([]),
                               player4ThrowsScores: .constant([]),
                               totalScorePlayer1: 369,
                               totalScorePlayer2: 250,
                               totalScorePlayer3: 150,
                               totalScorePlayer4: 230,
                               namePlayer1: "Alice",
                               namePlayer2: "Bob",
                               namePlayer3: "",
                               namePlayer4: "")
                .previewDevice(PreviewDevice(rawValue: "2 Players"))
                .previewDisplayName("2 Players")
        }
    }
}