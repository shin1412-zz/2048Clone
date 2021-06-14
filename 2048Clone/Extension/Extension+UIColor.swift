//
//  Extension+UIColor.swift
//  2048Clone
//
//  Created by Huong Nguyen on 10/06/2021.
//

import UIKit

extension UIColor {
    class func colorWithHex(_ hex: String) -> UIColor {
        var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("0X") {
            cString = String(cString[cString.index(cString.startIndex, offsetBy: 2)..<cString.endIndex])
        }

        if cString.count != 6 {
            return .gray
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
