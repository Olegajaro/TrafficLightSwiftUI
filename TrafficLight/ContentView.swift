//
//  ContentView.swift
//  TrafficLight
//
//  Created by Олег Федоров on 26.10.2021.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {

    @State private var buttonName = "START"
    @State private var currentLight = CurrentLight.red
    
    private func toggleTheSignal() {
        buttonName = "NEXT"
        
        switch currentLight {
        case .red: currentLight = .yellow
        case .yellow: currentLight = .green
        case .green: currentLight = .red
        }
    }
}

extension ContentView {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TrafficSignalView(
                    color: .red,
                    opacity: currentLight == .red ? 1 : 0.3
                )
                TrafficSignalView(
                    color: .yellow,
                    opacity: currentLight == .yellow ? 1 : 0.3
                )
                TrafficSignalView(
                    color: .green,
                    opacity: currentLight == .green ? 1 : 0.3
                )
                
                Spacer()
                
                SwitchButton(titleButton: buttonName, action: toggleTheSignal)
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
