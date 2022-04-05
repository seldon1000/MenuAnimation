//
//  MenuView.swift
//  SwiftUI_Animations
//
//  Created by Nicolas Mariniello on 05/04/22.
//

import SwiftUI

struct MenuView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            MenuButton(label: "Button 1") {
                withAnimation(.easeInOut) {
                    showMenu = false
                }
            }
            MenuButton(label: "Button 2") {
                withAnimation(.easeInOut) {
                    showMenu = false
                }
            }
        }
    }
}
