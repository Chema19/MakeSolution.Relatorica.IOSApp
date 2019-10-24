//
//  ColorPalette.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/20/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

struct BaseColor {
    
    let accentColor = Color("AccentColor")
    let darkPrimaryColor = Color("DarkPrimaryColor")
    let dividerColor = Color("DividerColor")
    let lightPrimaryColor = Color("LightPrimaryColor")
    let primaryColor = Color("PrimaryColor")
    let primaryText = Color("PrimaryText")
    let secondaryText = Color("SecondaryText")
    
}

struct TokenColor {
    let baseColor = BaseColor()
    
    let buttonAccentColor: Color!
    let buttonDarkPrimaryColor: Color!
    let buttonDividerColor: Color!
    let buttonLightPrimaryColor: Color!
    let buttonPrimaryColor: Color!
    let textPrimaryText: Color!
    let textSecondaryText: Color!
    
    init() {
        
        self.buttonAccentColor = baseColor.accentColor
        self.buttonDarkPrimaryColor = baseColor.darkPrimaryColor
        self.buttonDividerColor = baseColor.dividerColor
        self.buttonLightPrimaryColor = baseColor.lightPrimaryColor
        self.textPrimaryText = baseColor.primaryText
        self.textSecondaryText = baseColor.secondaryText
        self.buttonPrimaryColor = baseColor.primaryColor
    }
}

///
// MARK: Add palatte to Color struct
///
///
/// Base colors are not exposed at same layer as Color.Token but inside of which,
/// because we encourage using Token colors instead of Base colors in most cases.
///
extension Color {
    static let Token = TokenColor()
}
