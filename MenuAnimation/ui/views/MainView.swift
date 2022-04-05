//
//  MainView.swift
//  MenuAnimation
//
//  Created by Nicolas Mariniello on 05/04/22.
//

import SwiftUI

struct MainView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        ZStack {
            Color.pink
                .opacity(0.2)
            Text("hold")
                .font(.system(size: 28, design: .serif))
                .scaleEffect(showMenu ? 0.5 : 1.0)
        }
        .frame(width: UIScreen.main.bounds.width * (showMenu ? 0.5 : 1.0), height: UIScreen.main.bounds.height * (showMenu ? 0.5 : 1.0))
        .onTapGesture {
            if showMenu {
                withAnimation(.easeInOut) {
                    showMenu = false
                }
            }
        }
        .onLongPressGesture {
            withAnimation(.easeInOut) {
                showMenu = true
            }
        }
    }
}
