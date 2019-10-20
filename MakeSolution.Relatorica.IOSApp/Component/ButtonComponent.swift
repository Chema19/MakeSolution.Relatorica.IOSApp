//
//  ButtonComponent.swift
//  MakeSolution.Relatorica.IOSApp
//
//  Created by Josemaria Inga Villafuerte on 10/19/19.
//  Copyright © 2019 UPC. All rights reserved.
//

import SwiftUI

/// Helper function
private func getOpacityValue(_ isPressed: Bool) -> Double {
    let isPressedOpacity = 0.8
    return isPressed ? isPressedOpacity : 1
}

///
///
// MARK: Token Button
///
///
struct TokenButton {
    var buttonLabel: TokenButtonLabel
    var buttonStyle: TokenButtonStyle
    
    ///
    // Capsule Button
    ///
    private var capsuleBtnText: String! = "capsule"
    /// Capsule Button
    init(capsuleText: String) {
        self.capsuleBtnText = capsuleText
        self.buttonLabel = TokenButtonLabel(text: capsuleText)
        self.buttonStyle = TokenButtonStyle(backgroundColor: .pColor, textColor: .tpColor)
    }
    
    ///
    // Text Button
    ///
    private var textBtnText: String! = "text"
    /// Text Button
    init(buttonText: String) {
        self.textBtnText = buttonText
        self.buttonLabel = TokenButtonLabel(text: buttonText)
        self.buttonStyle = TokenButtonStyle(textColor: .tpColor)
    }
}


extension TokenButton {
    /// Global properties
    enum IconSize: CGFloat, Equatable {
        case extraLarge = 80
        case large = 64
        case medium = 48
        case small = 40
        case mini = 28
    }
    enum ButtonType {
        case circle, icon, capsule, text
    }
    enum StateSwitch {
        case off, on
    }
    /// Circle button
    enum CircleBtnType: Equatable {
        case primary, support
    }
    enum CircleBtnSize: Equatable {
        case medium, small
        
        func getIconSize() -> IconSize {
            switch self {
            case .medium:
                return IconSize.large
            case .small:
                return IconSize.medium
            }
        }
    }
    /// Icon button
    enum IconBtnType: Equatable {
        case tool, action
    }
    enum IconBtnSize: Equatable {
        case large, medium
        
        func getIconSize() -> IconSize {
            switch self {
            case .large:
                return IconSize.small
            case .medium:
                return IconSize.mini
            }
        }
    }
}




///
///
// MARK: Button Label
///
///
struct TokenButtonLabel: View {
    /// Global properties
    private let labelType: LabelTypes
    private var iconName: String?
    
    /// State properties
    var isHighlighted = false
    
    ///
    // Icon Type
    ///
    private var iconSize: TokenButton.IconSize?
    /// Icon Type
    init(name: String, iconSize: TokenButton.IconSize) {
        self.labelType = .icon
        self.iconName = name
        self.iconSize = iconSize
    }
    
    ///
    // Text Type
    ///
    private var btnText: String?
    /// Text Type
    init(text: String) {
        self.labelType = .text
        self.btnText = text
    }
    
    /// Helper function
    func getView() -> some View {
        var renderView: AnyView!
        let highlightSuffix = isHighlighted ? "-highlight" : ""
        
        switch labelType {
        case .icon:
            let iconString = "\(iconName!)\(highlightSuffix)"
            
            renderView = AnyView(
                 Image("\(iconString)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: iconSize!.rawValue, height: iconSize!.rawValue, alignment: .center)
            )
        case .text:
            renderView = AnyView(
                Text("\(btnText!)")
                    .font(Font.Typography.sizingFont(font: .main, size: .body))
            )
        }
        
        return renderView
    }
    
    ///
    // Rendering View
    ///
    var body: some View {
        getView()
    }
}

extension TokenButtonLabel {
    enum LabelTypes {
        case icon, text
    }
    enum TextColor {
        case highlight, main
        
        func getColor() -> Color {
            switch self {
            case .highlight:
                return Color.Token.textPrimaryText
            case .main:
                return Color.Token.textSecondaryText
            }
        }
    }
}

/// State modifier
extension TokenButtonLabel {
    /// Pass highlightSwitch argument bonded with @State variable in order to trigger updates
    mutating func highlight(_ highlightSwitch: TokenButton.StateSwitch) -> Self {
        self.isHighlighted = highlightSwitch == .on ? true : false
        return self
    }
}



///
///
// MARK: Button Style
///
///
struct TokenButtonStyle: ButtonStyle {
    /// Global properties
    private let styleType: StyleType
    private var iconSize: TokenButton.IconSize?
    private var backgroundColor: Color?
    private var borderStyle: StyleAlias.BorderStyle?
    private var textColor: Color?
    
    /// State properties
    var isActive = true
    
    /// Capsule Button
    init(backgroundColor: BackgroundColor, textColor: TextColor) {
        self.styleType = .buttonCapsule
        self.backgroundColor = backgroundColor.getColor()
        self.textColor = textColor.getColor()
    }
    
    /// Text Button
    init(textColor: TextColor) {
        self.styleType = .buttonText
        self.textColor = textColor.getColor()
    }
    
    /// Rendering Button Style
    func makeBody(configuration: Self.Configuration) -> some View {
        var renderView: AnyView!
        let verticalMargin = CapsuleValue.verticalMargin.rawValue
        let horizontalMargin = CapsuleValue.horizontalMargin.rawValue
        
        switch styleType {
            case .buttonCapsule:
                renderView = AnyView(configuration.label
                .padding(.init(top: verticalMargin, leading: horizontalMargin, bottom: verticalMargin, trailing: horizontalMargin))
                .foregroundColor(textColor!)
                .background(backgroundColor!)
                .cornerRadius(horizontalMargin)
            )
            case .buttonText:
                renderView = AnyView(configuration.label
                .padding(.init(top: verticalMargin, leading: horizontalMargin, bottom: verticalMargin, trailing: horizontalMargin))
                .foregroundColor(textColor!)
            )
        }
        
        return renderView.opacity(getOpacityValue(configuration.isPressed || !isActive))
    }
}

extension TokenButtonStyle {
    enum StyleType {
        case buttonCapsule, buttonText
    }
    enum MaskShape {
        case circle, capsule
    }
    enum BorderStyle {
        case regular
    }
    enum TextColor {
        case tpColor, tsColor
        
        func getColor() -> Color {
            switch self {
            case .tpColor:
                return Color.Token.textPrimaryText
            case .tsColor:
                return Color.Token.textSecondaryText
            }
        }
    }
    enum BackgroundColor {
        case pColor, lpColor, dpColor, dColor, aColor
        
        func getColor() -> Color {
            switch self {
            case .pColor:
                return Color.Token.buttonPrimaryColor
            case .lpColor:
                return Color.Token.buttonLightPrimaryColor
            case .dpColor:
                return Color.Token.buttonDarkPrimaryColor
            case .dColor:
                return Color.Token.buttonDividerColor
            case .aColor:
                return Color.Token.buttonAccentColor
            }
        }
    }
    enum CapsuleValue: CGFloat {
        case height = 44
        case horizontalMargin = 128
        case verticalMargin = 16
    }
}

/// State modifier
extension TokenButtonStyle {
    /// Pass highlightSwitch argument bonded with @State variable in order to trigger updates
    mutating func activate(_ activeSwitch: TokenButton.StateSwitch) -> Self {
        self.isActive = activeSwitch == .on ? true : false
        return self
    }
}

