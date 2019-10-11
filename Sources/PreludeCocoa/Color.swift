//
//  Color.swift
//  PreludeCocoa
//
//  Created by duan on 2019/10/11.
//  Copyright © 2019 monk-studio. All rights reserved.
//

#if os(macOS)
import Cocoa
public typealias Color = NSColor
#else
import UIKit
public typealias Color = UIColor
#endif

public extension Color {
    convenience init(hex: UInt, alpha: CGFloat = 1) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(hex & 0x0000FF) / 255.0,
                  alpha: alpha)
    }

    convenience init(hexStr: String, alpha: CGFloat = 1) {
        let raw = hexStr.replacingOccurrences(of: "#", with: "")
        let hex = UInt(raw, radix: 16) ?? 0
        self.init(hex: hex, alpha: alpha)
    }

    func hexStr() -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0

        getRed(&r, green: &g, blue: &b, alpha: &a)

        let rgb: Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format: "#%06x", rgb)
    }
}
