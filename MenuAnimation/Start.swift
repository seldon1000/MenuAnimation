//
//  Start.swift
//  MenuAnimation
//
//  Created by Nicolas Mariniello on 05/04/22.
//

import SwiftUI

struct Start: View {
    @State var showMenu: Bool = false
    
    var body: some View {
        VStack(spacing: 48) {
            MainView(showMenu: $showMenu)
            if showMenu {
                MenuView(showMenu: $showMenu)
            }
        }
        .ignoresSafeArea()
    }
}
