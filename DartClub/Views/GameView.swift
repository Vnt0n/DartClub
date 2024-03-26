//
//  GameView.swift
//  DartClub
//
//  Created by Antoine on 26/03/2024.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Moitié supérieure de l'écran (Joueur 1)
            ZStack {
                Color.gray
                    .frame(maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.top)
                VStack {
                    Text("Player 1")
                    Text("501")
                        .font(.system(size: 140, weight: .bold, design: .default))
                }
                .foregroundColor(.black)
            }
            
            // Moitié inférieure de l'écran (Joueur 2)
            ZStack {
                Color.gray
                    .frame(maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.bottom)
                VStack {
                    Text("Player 2")
                    Text("501")
                        .font(.system(size: 140, weight: .bold, design: .default))
                }
                .foregroundColor(.black)
            }
        }
        .edgesIgnoringSafeArea(.horizontal)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameView()
}
