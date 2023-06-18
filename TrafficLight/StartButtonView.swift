//
//  StartButtonView.swift
//  TrafficLight
//
//  Created by Келлер Дмитрий on 18.06.2023.
//

import SwiftUI

struct StartButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }
        .frame(width: 200, height: 60)
        .background(.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.white, lineWidth: 4)
        )

    }
}

