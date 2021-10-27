//
//  ContentView.swift
//  TrafficLight
//
//  Created by Олег Федоров on 26.10.2021.
//

import SwiftUI

struct ContentView: View {
    private enum CurrentLight {
        case red, yellow, green
    }

    @State private var buttonName = "START"
    @State private var opacityRedSignal = 0.2
    @State private var opacityYellowSignal = 0.2
    @State private var opacityGreenSignal = 0.2
    @State private var currentLight = CurrentLight.red
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                TrafficSignalView(color: .red, opacity: opacityRedSignal)
                    .padding()
                TrafficSignalView(color: .yellow, opacity: opacityYellowSignal)
                    .padding(.bottom)
                TrafficSignalView(color: .green, opacity: opacityGreenSignal)
                Spacer()
                Button(action: toggleTheSignal) {
                    Text(buttonName)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .frame(width: 150, height: 50)
                .background(.blue)
                .cornerRadius(20)
            }
            .padding(.bottom)
        }
    }
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
