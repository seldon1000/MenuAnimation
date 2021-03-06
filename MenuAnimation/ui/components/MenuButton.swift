//
//  MenuButton.swift
//  MenuAnimation
//
//  Created by Nicolas Mariniello on 05/04/22.
//

import SwiftUI

struct MenuButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Color.white
                    .cornerRadius(.infinity)
                    .frame(width: UIScreen.main.bounds.width / 2, height: 56)
                Text(label)
                    .font(.system(size: 16, design: .serif))
                    .foregroundColor(.black)
            }
            .shadow(color: .gray.opacity(0.2), radius: 8)
        }
    }
}
