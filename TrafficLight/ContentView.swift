//
//  ContentView.swift
//  TrafficLight
//
//  Created by Келлер Дмитрий on 08.06.2023.
//

import SwiftUI

enum LightState {
    case on, off
    
    var opacity: Double {
        switch self {
        case .on:
            return 1.0
        case .off:
            return 0.2
        }
    }
}

enum LightColor {
    case red, yellow, green
}

struct ContentView: View {
    @State private var currentText = "START"
    @State private var currentLight = LightColor.red
    
    @State private var redLightState: LightState = .off
    @State private var yellowLightState: LightState = .off
    @State private var greenLightState: LightState = .off
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 20){
                CircleView(color: .red, state: redLightState)
                CircleView(color: .yellow, state: yellowLightState)
                CircleView(color: .green, state: greenLightState)
                
                .padding(.bottom, 50)
                Button(action: switchColor) {
                    if currentText == "START" {
                        buttonStyle(text: currentText, opacity: 0.5)
                    } else {
                        buttonStyle(text: currentText, opacity: 1.0)
                    }
                }
            }
        }
    }
    
    private func buttonStyle(text: String, opacity: Double) -> some View {
        Text(text)
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(width: 150, height: 50)
            .background(.blue)
            .cornerRadius(15)
            .opacity(opacity)
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(Color.white.opacity(opacity), lineWidth: 2))
    }
    
    private func switchColor() {
        switch currentLight {
        case .red:
            greenLightState = .off
            redLightState = .on
            currentLight = .yellow
            
        case .yellow:
            redLightState = .off
            yellowLightState = .on
            currentLight = .green
        default:
            yellowLightState = .off
            greenLightState = .on
            currentLight = .red
        }
        
        if currentText == "START" {
            currentText = "NEXT"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

