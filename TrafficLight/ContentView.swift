//
//  ContentView.swift
//  TrafficLight
//
//  Created by Келлер Дмитрий on 08.06.2023.
//

import SwiftUI

enum CurrentLight {
    case off, red, yellow, green
}

struct ContentView: View {
    @State private var buttonTitle = "START"
    @State private var currentLight: CurrentLight = .off
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 28){
                CircleView(color: .red, opacity: currentLight == .red ? 1 : 0.3)
                CircleView(color: .yellow, opacity: currentLight == .yellow ? 1 : 0.3)
                CircleView(color: .green, opacity: currentLight == .green ? 1 : 0.3)
                
                Spacer()
                StartButtonView(title: buttonTitle) {
                    if buttonTitle == "START" {
                        buttonTitle = "NEXT"
                    }
                    nextColor()
                }
            }
        }
    }
    
    
    private func nextColor() {
        switch currentLight {
        case .off: currentLight = .red
        case .red: currentLight = .yellow
        case .yellow: currentLight = .green
        case .green: currentLight = .red
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

