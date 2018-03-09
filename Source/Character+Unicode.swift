//
//  Character+Unicode.swift
//  Croc
//
//  Copyright © 2018 Joseph Kalash
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#if os(iOS) || os(watchOS) || os(tvOS)
    
import Foundation
import UIKit


public extension Character {
    
    /// Pick a size, any size really, for a reasonable png bitmap comparison
    private static let refUnicodeSize: CGFloat = 8
    
    /// U+1FFF is merely one of the many unicode characters not yet implemented (or defined).
    /// It thus prints a ῿ question mark, as do all the unavailable characters.
    /// All unavailable unicode characters share the same question mark [?] bitmap
    private static let refUnicodePng = Character("\u{1fff}").png(ofSize: Character.refUnicodeSize) // ῿
    
    /// Tests against the existence of a given unicode glyph on the present OS
    ///
    /// - Returns: true if this unicode (including emoji) will return a meaningful representation (i.e, not a ῿)
    public var unicodeSupported : Bool {
        if let refUnicodePng = Character.refUnicodePng,
            let myPng = self.png(ofSize: Character.refUnicodeSize) {
            return refUnicodePng != myPng
        }
        return false
    }
    
    /// Creates a png from a Character
    ///
    /// - Parameter char: a Character
    /// - Returns: a Portable Network Graphic (png), as Data optional
    public func png(ofSize fontSize: CGFloat) -> Data? {
        
        let attributes = [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)]
        
        let charStr = "\(self)" as NSString
        let size = charStr.size(attributes: attributes)
        
        UIGraphicsBeginImageContext(size)
        charStr.draw(at: CGPoint(x: 0,y :0), withAttributes: attributes)
        var png:Data? = nil
        if let charImage = UIGraphicsGetImageFromCurrentImageContext() {
            png = UIImagePNGRepresentation(charImage)
        }
        UIGraphicsEndImageContext()
        return png
    }
}
    
extension String {
    
    /// Tests against the existence of a given unicode glyph on the present OS
    ///
    /// - Returns: true if this string's unicodes (including emojis) will all return meaningful representations (i.e, not a ῿)
    public var unicodeSupported : Bool {
        print(Array(self.unicodeScalars))
        for char in self {
            if !char.unicodeSupported {
                return false
            }
        }
        return true
    }
}
    

#endif
