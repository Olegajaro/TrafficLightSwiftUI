//
//  TrafficSignalView.swift
//  TrafficLight
//
//  Created by Олег Федоров on 27.10.2021.
//

import SwiftUI

struct TrafficSignalView: View {
    
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .opacity(opacity)
            .frame(width: 120, height: 120)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct TrafficSignalView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficSignalView(color: .blue, opacity: 1)
    }
}
