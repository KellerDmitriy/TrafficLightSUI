//
//  ContentView.swift
//  TrafficLight
//
//  Created by Келлер Дмитрий on 08.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentText = "START"
    @State private var currentLight = Color.red
    
    @State private var redLightCondition: Condition = .lightIsOff
    @State private var yellowLightCondition: Condition = .lightIsOff
    @State private var greenLightCondition: Condition = .lightIsOff
    
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack(spacing: 20){
                CircleView(color: .red, condition: redLightCondition)
                CircleView(color: .yellow, condition: yellowLightCondition)
                CircleView(color: .green, condition: greenLightCondition)
                
                    .padding(.bottom, 50)
                Button(action: {
                    switch currentLight {
                    case .red:
                        greenLightCondition = .lightIsOff
                        redLightCondition = .lightIsOn
                        currentLight = .yellow
                        
                    case .yellow:
                        redLightCondition = .lightIsOff
                        yellowLightCondition = .lightIsOn
                        currentLight = .green
                    default:
                        yellowLightCondition = .lightIsOff
                        greenLightCondition = .lightIsOn
                        currentLight = .red
                    }
                    
                    if currentText == "START" {
                        currentText = "NEXT"
                    }
                }) {
                    Text(currentText)
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 60)
                        .background(.blue)
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white, lineWidth: 3))
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

