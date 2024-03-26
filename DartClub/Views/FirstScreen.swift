//
//  SwiftUIView.swift
//  DartClub
//
//  Created by Antoine on 25/03/2024.
//

import SwiftUI

struct FirstScreen: View {
    
    @State private var value: String = ""
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                .ignoresSafeArea(.all)
            VStack {
                
                Spacer()

                Text("Player 1")
                
                TextField("", text: $value).TextFieldStyling()
                                
                Spacer()
                
                Text("Player 2")
                
                TextField("", text: $value).TextFieldStyling()

                Spacer()

                Text("+ Add a player")
               
                Spacer()

            }   .foregroundColor(.white)
                .font(.system(size: 24, weight: .bold, design: .default))
                .shadow(radius: 10)
                .navigationBarBackButtonHidden(true)
         }
    }
    
}

#Preview {
    FirstScreen()
}
