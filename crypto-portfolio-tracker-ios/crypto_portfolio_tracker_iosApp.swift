//
//  crypto_portfolio_tracker_iosApp.swift
//  crypto-portfolio-tracker-ios
//
//  Created by mukesh.gami on 08/09/25.
//

import SwiftUI

@main
struct crypto_portfolio_tracker_iosApp: App {
    
    @StateObject var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .environmentObject(vm)
        }
    }
}
