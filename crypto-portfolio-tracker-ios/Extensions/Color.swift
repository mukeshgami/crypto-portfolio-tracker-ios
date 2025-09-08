//
//  Color.swift
//  crypto-portfolio-tracker-ios
//
//  Created by mukesh.gami on 08/09/25.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let red = Color("RedColor")
    let green = Color("GreenColor")
    let secondaryText = Color("SecondaryTextColor")
}
