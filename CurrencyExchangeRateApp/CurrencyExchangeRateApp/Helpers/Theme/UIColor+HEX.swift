//
//  UIColorExtension.swift
//  HEXColor
//
//  Created by R0CKSTAR on 6/13/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

import UIKit

/**
MissingHashMarkAsPrefix:   "Invalid RGB string, missing '#' as prefix"
UnableToScanHexValue:      "Scan hex error"
MismatchedHexStringLength: "Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8"
*/
public enum UIColorInputError: Error {
	case missingHashMarkAsPrefix,
	unableToScanHexValue,
	mismatchedHexStringLength
}

extension UIColor {
	/**
	The shorthand three-digit hexadecimal representation of color.
	#RGB defines to the color #RRGGBB.
	
	- parameter hex3: Three-digit hexadecimal value.
	- parameter alpha: 0.0 - 1.0. The default is 1.0.
	*/
	public convenience init(hex3: UInt16, alpha: CGFloat = 1) {
		let divisor = CGFloat(15)
		let red     = CGFloat((hex3 & 0xF00) >> 8) / divisor
		let green   = CGFloat((hex3 & 0x0F0) >> 4) / divisor
		let blue    = CGFloat( hex3 & 0x00F      ) / divisor
		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}
	
	/**
	The shorthand four-digit hexadecimal representation of color with alpha.
	#RGBA defines to the color #RRGGBBAA.
	
	- parameter hex4: Four-digit hexadecimal value.
	*/
	public convenience init(hex4: UInt16) {
		let divisor = CGFloat(15)
		let red     = CGFloat((hex4 & 0xF000) >> 12) / divisor
		let green   = CGFloat((hex4 & 0x0F00) >>  8) / divisor
		let blue    = CGFloat((hex4 & 0x00F0) >>  4) / divisor
		let alpha   = CGFloat( hex4 & 0x000F       ) / divisor
		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}
	/*
	The six-digit hexadecimal representation of color of the form #RRGGBB.
	
	- parameter hex6:  hex6: Six-digit hexadecimal value.
	- parameter alpha: alpha component
	
	- returns: void
	*/
	public convenience init(hex6: UInt32, alpha: CGFloat = 1) {
		let divisor = CGFloat(255)
		let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
		let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
		let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}
	
	/**
	The six-digit hexadecimal representation of color with alpha of the form #RRGGBBAA.
	
	- parameter hex8: Eight-digit hexadecimal value.
	*/
	public convenience init(hex8: UInt32) {
		let divisor = CGFloat(255)
		let red     = CGFloat((hex8 & 0xFF000000) >> 24) / divisor
		let green   = CGFloat((hex8 & 0x00FF0000) >> 16) / divisor
		let blue    = CGFloat((hex8 & 0x0000FF00) >>  8) / divisor
		let alpha   = CGFloat( hex8 & 0x000000FF       ) / divisor
		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}
	
	public convenience init(rgba_throws rgba: String) throws {
		guard rgba.hasPrefix("#") else {
			throw UIColorInputError.missingHashMarkAsPrefix
		}
		var hexValue: UInt32 = 0
		let hexString: String = rgba.substring(from: rgba.index(rgba.startIndex, offsetBy: 1))
		guard Scanner(string: hexString).scanHexInt32(&hexValue) else {
			throw UIColorInputError.unableToScanHexValue
		}
		switch hexString.count {
		case 3:
			self.init(hex3: UInt16(hexValue))
		case 4:
			self.init(hex4: UInt16(hexValue))
		case 6:
			self.init(hex6: hexValue)
		case 8:
			self.init(hex8: hexValue)
		default:
			throw UIColorInputError.mismatchedHexStringLength
		}
	}
	public convenience init(rgba: String, defaultColor: UIColor = UIColor.clear) {
		guard let color = try? UIColor(rgba_throws: rgba) else {
			self.init(cgColor: defaultColor.cgColor)
			return
		}
		self.init(cgColor: color.cgColor)
	}
	
	public func hexString(_ includeAlpha: Bool) -> String {
		var r: CGFloat = 0
		var g: CGFloat = 0
		var b: CGFloat = 0
		var a: CGFloat = 0
		self.getRed(&r, green: &g, blue: &b, alpha: &a)
		
		if includeAlpha {
			return String(format: "#%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
		} else {
			return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
		}
	}
	
	open override var description: String {
		return self.hexString(true)
	}
	
	open override var debugDescription: String {
		return self.hexString(true)
	}
	/**
	This method function creates a new inverted UIColor object of its currently assigned color.
	
	:returns: UIColor Returns a new UIColor object with the inverted color
	*/
	func invert() -> UIColor {
		var red         :   CGFloat  =   255.0
		var green       :   CGFloat  =   255.0
		var blue        :   CGFloat  =   255.0
		var alpha       :   CGFloat  =   1.0
		
		self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
		
		red     =   255.0 - (red * 255.0)
		green   =   255.0 - (green * 255.0)
		blue    =   255.0 - (blue * 255.0)
		
		return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
	}
    
    
    func getIntValue()-> UInt32 {
        var colorAsUInt : UInt32 = 0

        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            colorAsUInt += UInt32(red * 255.0) << 16 + UInt32(green * 255.0) << 8 + UInt32(blue * 255.0)
        }
        return colorAsUInt
    }
}


public extension UIColor {
    convenience init(hex: String) {
        var red:   CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue:  CGFloat = 0.0
        var alpha: CGFloat = 1.0
        var hex:   String = hex
        
        if hex.hasPrefix("#") {
            let index = hex.index(hex.startIndex, offsetBy: 1)
            hex = String(hex[index...])
        }
        
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch (hex.count) {
            case 3:
                red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = CGFloat(hexValue & 0x00F)              / 15.0
            case 4:
                red   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                green = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                blue  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                alpha = CGFloat(hexValue & 0x000F)             / 15.0
            case 6:
                red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
            case 8:
                red   = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                blue  = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                alpha = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                debugPrint("Invalid RGB string, number of characters after '#' should be either 3, 4, 6 or 8", terminator: "")
            }
        } else {
            debugPrint("Scan hex error")
        }
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
