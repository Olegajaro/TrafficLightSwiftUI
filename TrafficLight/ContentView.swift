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
    @State private var lightIsOn = 1.0
    @State private var lightIsOff = 0.2
    @State private var currentLight = CurrentLight.red
    
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                redSignal
                    .padding()
                TrafficSignalView(color: .yellow.opacity(lightIsOff))
                    .padding(.bottom)
                TrafficSignalView(color: .green.opacity(lightIsOff))
                Spacer()
                Button {
                    buttonName = "NEXT"
                
                } label: {
                    Text(buttonName)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding()
                .background(.blue)
                .cornerRadius(20)
            }
        }
    }
    
    private var redSignal: some View {
        TrafficSignalView(color: .red.opacity(lightIsOff))
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
