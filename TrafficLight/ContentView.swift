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
                
                Spacer()
                
                Button(action: switchColor) {
                    if currentText == "START" {
                        Text(currentText)
                            .font(.largeTitle)
                            .foregroundColor(.white.opacity(0.5))
                            .frame(width: 150, height: 50)
                            .background(.blue)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white.opacity(0.5), lineWidth: 1.5))
                    } else {
                        Text(currentText)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(.blue)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 2))
                    }
                })
                {
                    if currentText == "START" {
                        Text(currentText)
                            .font(.largeTitle)
                            .foregroundColor(.white.opacity(0.5))
                            .frame(width: 150, height: 50)
                            .background(.blue)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white.opacity(0.5), lineWidth: 1.5))
                    } else {
                        Text(currentText)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 50)
                            .background(.blue)
                            .cornerRadius(15)
                            .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 2))
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
         
    private func switchColor() {
        
        if currentText == "START" {
            currentText = "NEXT"
        }
        
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
