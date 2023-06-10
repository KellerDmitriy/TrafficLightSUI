//
//  CircleView.swift
//  TrafficLight
//
//  Created by Келлер Дмитрий on 09.06.2023.
//

import SwiftUI

struct CircleView: View {
    let color: Color
    let state: LightState
    
    var body: some View {
            Circle()
                .foregroundColor(color)
                .frame(width: 130, height: 130)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(color: color, radius: 40)
                .opacity(state.opacity)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .green, state: .off )
    }
}
