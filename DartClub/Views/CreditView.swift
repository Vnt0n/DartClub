//
//  CreditView.swift
//  DartClub
//
//  Created by Antoine on 05/04/2024.
//

import SwiftUI

struct CreditView: View {
    var body: some View {

        ZStack {
            VStack {
                
                Text("Dart   ")
                    .font(Font.custom("FightThis", size: 50))
                    .shadow(color: Color.red, radius: 15)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .rotationEffect(Angle(degrees: 347))
                    .frame(maxWidth: .infinity)
                    .padding([.trailing], 40)
                
                Text("Club   ")
                    .font(Font.custom("FightThis", size: 50))
                    .shadow(color: Color.red, radius: 15)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .rotationEffect(Angle(degrees: 347))
                    .frame(maxWidth: .infinity)
                    .padding([.trailing], 40)
                
                Text(" ")
                    .font(Font.custom("FightThis", size: 40))

                Text("An app provided by")
                    .font(
                        .system(size: 20)
                        .weight(.bold))
                    .padding(.bottom)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque hendrerit non lectus ut auctor. Aliquam cursus a enim quis vehicula. Mauris quis sem interdum, lobortis odio vitae, suscipit ipsum. Mauris volutpat augue pulvinar arcu aliquam sodales maximus vitae urna. Suspendisse congue aliquet risus tempor scelerisque.")
                .lineSpacing(10)
                .multilineTextAlignment(.center)
                .padding()
                Text("Beta V.3.0")
                    .padding(.top, 50)
                    .font(
                        .system(size: 10))
            }
            .frame(maxWidth: 300)
        }
        
    }
}


// PREVIEWS ///////////////////

#Preview {
    CreditView()
}
