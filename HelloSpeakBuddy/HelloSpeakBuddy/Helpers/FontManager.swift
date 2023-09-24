//
//  FontManager.swift
//  HelloSpeakBuddy
//
//  Created by Robihamanto on 2023/09/24.
//

import SwiftUI

enum FontManager {
    static var typography: Typography {
        if DeviceHelper.isPad {
            return PadTypography()
        }
        return PhoneTypography()
    }
}

protocol Typography {
    var titleFont: Font { get }
    var subtitleFont: Font { get }
    var bodyFont: Font { get }
    var captionFont: Font { get }
    var buttonFont: Font { get }
}

struct PhoneTypography: Typography {
    
    var titleFont: Font
    var subtitleFont: Font
    var bodyFont: Font
    var captionFont: Font
    var buttonFont: Font
    
    init() {
        titleFont = .title
        subtitleFont = .headline
        bodyFont = .body
        captionFont = .caption
        buttonFont = .headline
    }
}

struct PadTypography: Typography {
    
    var titleFont: Font
    var subtitleFont: Font
    var bodyFont: Font
    var captionFont: Font
    var buttonFont: Font
    
    init() {
        titleFont = .largeTitle
        subtitleFont = .title
        bodyFont = .body
        captionFont = .callout
        buttonFont = .title3
    }
}
