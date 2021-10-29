//
//  SwitchButton.swift
//  TrafficLight
//
//  Created by Олег Федоров on 29.10.2021.
//

import SwiftUI

struct SwitchButton: View {
    
    let titleButton: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(titleButton)
                .font(.title)
                .bold()
                .foregroundColor(.white)
        }
        .frame(width: 180, height: 50)
        .background(.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 4)
        )
        
    }
}

struct SwitchButton_Previews: PreviewProvider {
    static var previews: some View {
        SwitchButton(titleButton: "START", action: {})
    }
}
