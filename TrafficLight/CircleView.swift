//
//  CircleView.swift
//  TrafficLight
//
//  Created by Келлер Дмитрий on 09.06.2023.
//

import SwiftUI

enum Condition {
    case lightIsOn
    case lightIsOff
    
    var opacity: Double {
        switch self {
        case .lightIsOn:
            return 1.0
        case .lightIsOff:
            return 0.3
        }
    }
}

struct CircleView: View {
    let color: Color
    let condition: Condition
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 130, height: 130)
                .overlay(Circle()
                    .stroke(Color.white, lineWidth: 2))
                .shadow(color: color, radius: 40)
                .opacity(condition.opacity)
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .green, condition: .lightIsOff )
    }
}
