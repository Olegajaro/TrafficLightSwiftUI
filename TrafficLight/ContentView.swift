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
    
    @State private var opacityRedSignal = 0.2
    @State private var opacityYellowSignal = 0.2
    @State private var opacityGreenSignal = 0.2
    
    @State private var currentLight = CurrentLight.red
    
    private func toggleTheSignal() {
        buttonName = "NEXT"
        
        let lightIsOn = 5.0
        let lightIsOff = 0.2
        
        switch currentLight {
        case .red:
            opacityGreenSignal = lightIsOff
            opacityRedSignal = lightIsOn
            currentLight = CurrentLight.yellow
        case .yellow:
            opacityRedSignal = lightIsOff
            opacityYellowSignal = lightIsOn
            currentLight = CurrentLight.green
        case .green:
            opacityYellowSignal = lightIsOff
            opacityGreenSignal = lightIsOn
            currentLight = CurrentLight.red
        }
    }
}

extension ContentView {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                TrafficSignalView(color: .red, opacity: opacityRedSignal)
                TrafficSignalView(color: .yellow, opacity: opacityYellowSignal)
                TrafficSignalView(color: .green, opacity: opacityGreenSignal)
                
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
