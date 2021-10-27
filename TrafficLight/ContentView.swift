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
    @State private var lightIsOn = 5.0
    @State private var lightIsOff = 0.2
    @State private var currentLight = CurrentLight.red
    @State private var redColor: Color = .red
    @State private var yellowColor: Color = .yellow
    @State private var greenColor: Color = .green
    @State private var tapCount = 0
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                TrafficSignalView(color: redColor)
                    .padding()
                TrafficSignalView(color: yellowColor)
                    .padding(.bottom)
                TrafficSignalView(color: greenColor)
                Spacer()
                signalSwitchingButton
            }
            .padding(.bottom)
        }
    }
    
    private var signalSwitchingButton: some View {
        Button {
            buttonName = "NEXT"
            
            tapCount += 1
            
            toggleTheSignal()
        } label: {
            Text(buttonName)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 150, height: 50)
        .background(.blue)
        .cornerRadius(20)
    }
    
    private func toggleTheSignal() {
        switch currentLight {
        case .red:
            if tapCount == 1 {
                greenColor = greenColor
            } else {
                greenColor = greenColor.opacity(lightIsOff)
            }
            redColor = redColor.opacity(lightIsOn)
            currentLight = CurrentLight.yellow
        case .yellow:
            redColor = redColor.opacity(lightIsOff)
            yellowColor = yellowColor.opacity(lightIsOn)
            currentLight = CurrentLight.green
        case .green:
            yellowColor = yellowColor.opacity(lightIsOff)
            greenColor = greenColor.opacity(lightIsOn)
            currentLight = CurrentLight.red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
