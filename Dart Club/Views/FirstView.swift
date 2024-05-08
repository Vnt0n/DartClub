//
//  FirstView.swift
//  Dart Club
//
//  Created by Antoine on 02/05/2024.
//

import SwiftUI

//class DeviceOrientationManager: ObservableObject {
//    static let shared = DeviceOrientationManager()
//    @Published var isLandscape: Bool = false
//    @Published var isFlat: Bool = false
//
//    init() {
//        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
//        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
//    }
//
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//        UIDevice.current.endGeneratingDeviceOrientationNotifications()
//    }
//
//    @objc func orientationChanged() {
//        DispatchQueue.main.async {
//            self.isLandscape = UIDevice.current.orientation.isLandscape
//            self.isFlat = UIDevice.current.orientation.isFlat
//        }
//    }
//}

struct FirstView: View {
//    @ObservedObject private var orientationDetected = DeviceOrientationManager.shared
    @State private var navigateToGame = false
    @StateObject var viewModel = GameViewModel(gameType: 0)
    @FocusState private var focusedPlayerIndex: Int?
//    @State private var showSettingsView = false

    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    Color.black.ignoresSafeArea(.all)
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        
                        if geometry.size.width > 1050 {
                            HStack {
                                Spacer()
                                dartClubText
                                Spacer()
                                mainContentVStack
                                Spacer()
                            }
                            
                        } else {
                            VStack {
                                dartClubText
                                    .padding(.top, 80)
                                mainContentVStack
                            }
                        }
                        
                    } else {
                        VStack {
                            if geometry.size.height > 550 {
                                dartClubText
                            }
                            mainContentVStack
                        }
                    }
                }
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold, design: .default))
                .navigationBarBackButtonHidden(true)
                .interactiveDismissDisabled()
                .navigationDestination(isPresented: $navigateToGame) {
                    GameView(selectedGame: viewModel.currentGame.gameType, players: viewModel.currentGame.players, viewModel: viewModel)
                }
            }
            .preferredColorScheme(.dark)
        }
    }

    var dartClubText: some View {
        VStack {
            Text("Dart   ")
                .font(Font
                    .custom("FightThis", size: UIDevice.current.userInterfaceIdiom == .pad ? 145 : 84))
            .shadow(color: Color.red, radius: 15)
            .foregroundColor(.red)
            .multilineTextAlignment(.center)
            .rotationEffect(Angle(degrees: 347))
            .padding([.trailing], 40)
            .padding(.bottom, UIDevice.current.userInterfaceIdiom == .pad ? -80 : 0)
        
        Text("Club   ")
                .font(Font
                    .custom("FightThis", size: UIDevice.current.userInterfaceIdiom == .pad ? 145 : 84))
            .shadow(color: Color.red, radius: 15)
            .foregroundColor(.red)
            .multilineTextAlignment(.center)
            .rotationEffect(Angle(degrees: 347))
            .padding([.trailing], 40)
            .padding(.top, UIDevice.current.userInterfaceIdiom == .pad ? 0 : -80)
        }
        .transition(.opacity)
    }

    var mainContentVStack: some View {
        VStack {
            Spacer()
            if UIDevice.current.userInterfaceIdiom == .pad {
                playerFieldsTwoRows
            } else {
                playerFieldsOneRow
            }
            if viewModel.currentGame.players.count < 4 {
                addButton
            }
            Spacer()
            gameControls
            settingsToggle
            Spacer()
        }
    }

    var playerFieldsOneRow: some View {
        ForEach(0..<viewModel.currentGame.players.count, id: \.self) { index in
            playerTextField(index: index)

        }
    }

    var playerFieldsTwoRows: some View {
        VStack {

            HStack {
                if viewModel.currentGame.players.count > 0 {
                    playerTextField(index: 0)
                }
                if viewModel.currentGame.players.count > 1 {
                    playerTextField(index: 1)
                }
            }

            HStack {
                if viewModel.currentGame.players.count > 2 {
                    playerTextField(index: 2)
                }
                if viewModel.currentGame.players.count > 3 {
                    playerTextField(index: 3)
                }
            }
        }
    }

    private func playerTextField(index: Int) -> some View {
        TextField("Player \(index + 1)", text: $viewModel.currentGame.players[index].name)
            .padding(.horizontal, 10)
            .textFieldStyle(.roundedBorder)
            .frame(width: 250)
            .multilineTextAlignment(.center)
            .disableAutocorrection(true)
            .foregroundColor(.primary)
            .focused($focusedPlayerIndex, equals: index)
            .font(.title)
    }

    var addButton: some View {
        Button(action: {
            withAnimation {
                viewModel.addPlayer()
                focusedPlayerIndex = viewModel.currentGame.players.count - 1
            }
        }) {
            Label("Add a player", systemImage: "person.fill.badge.plus")
                .accessibilityLabel("Add a player")
                .font(.system(size: 20))
                .padding(.top, 20)
        }
        .buttonStyle(PlainButtonStyle())
    }

    var gameControls: some View {
        HStack {
            Button("301") {
                withAnimation {
                    viewModel.currentGame.gameType = 301
                    viewModel.gameStarted = true
                    navigateToGame = true
                }
            }
            .disabled(!canStartGame)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)

            Text("or").font(.system(size: 20))

            Button("501") {
                withAnimation {
                    viewModel.currentGame.gameType = 501
                    viewModel.gameStarted = true
                    navigateToGame = true
                }
            }
            .disabled(!canStartGame)
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
    }

    var settingsToggle: some View {
        Toggle(isOn: $viewModel.currentGame.isToggledDoubleOut) {
            Text("Double Out").font(.system(size: 18))
        }
        .padding()
        .frame(width: 200)
    }
    
    var canStartGame: Bool {
        !viewModel.currentGame.players.isEmpty && viewModel.currentGame.players.allSatisfy { !$0.name.isEmpty }
    }
    
}



// ///////////////////////////
// PREVIEW //////////////////

#Preview("English") {
    FirstView()
        .environment(\.locale, Locale(identifier: "en"))
}

#Preview("Français") {
    FirstView()
        .environment(\.locale, Locale(identifier: "fr"))
}
