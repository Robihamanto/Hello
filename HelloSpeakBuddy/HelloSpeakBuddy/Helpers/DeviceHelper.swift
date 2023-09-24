//
//  DeviceHelper.swift
//  HelloSpeakBuddy
//
//  Created by Robihamanto on 2023/09/24.
//

import UIKit

enum DeviceHelper {
    
    static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    static var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    static var deviceOrientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }
    
    static var screenWidth: CGFloat {
        return UIScreen.main.bounds.size.width
    }

    static var screenHeight: CGFloat {
        return UIScreen.main.bounds.size.height
    }
}
