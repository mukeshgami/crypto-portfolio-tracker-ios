//
//  ContentView.swift
//  crypto-portfolio-tracker-ios
//
//  Created by mukesh.gami on 08/09/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.theme.background
            
            VStack(spacing: 30) {
                Text("Accent Color")
                    .foregroundColor(Color.theme.accent)
                
                Text("Red Color")
                    .foregroundColor(Color.theme.red)
                
                Text("Green Color")
                    .foregroundColor(Color.theme.green)
                
                Text("Secondary Text Color")
                    .foregroundColor(Color.theme.secondaryText)
            }
            .font(.title)
        }
    }
}

#Preview {
    ContentView()
}
