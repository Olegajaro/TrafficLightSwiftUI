//
//  TrafficSignalView.swift
//  TrafficLight
//
//  Created by Олег Федоров on 26.10.2021.
//

import SwiftUI

struct TrafficSignalView: View {
    var color: Color?

    var body: some View {
        Circle()
            .foregroundColor(color?.opacity(1))
            .frame(width: 120, height: 120)
            .overlay(Circle().stroke(Color(.white), lineWidth: 4))
    }    
}

struct TrafficSignalView_Previews: PreviewProvider {
    static var previews: some View {
        TrafficSignalView(color: .blue)
    }
}
