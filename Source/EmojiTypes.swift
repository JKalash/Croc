//
//  EmojiTypes.swift
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

public enum EmojiGroup : String {
    case smileysPeople = "Smileys & People"
    case animalsNature = "Animals & Nature"
    case foodDrink = "Food & Drink"
    case travelPlaces = "Travel & Places"
    case activities = "Activities"
    case objects = "Objects"
    case symbols = "Symbols"
    case flags = "Flags"
}

public typealias EmojiSubGroup = String

public struct Emoji : Equatable {
    var group : EmojiGroup
    var subgroup : EmojiSubGroup
    var codePoints : Array<Unicode.Scalar>
    var description : String
    
    public static func ==(lhs: Emoji, rhs: Emoji) -> Bool {
        return lhs.codePoints == rhs.codePoints
    }
}

//Starting with Swift 4.2, we can add protocol conformance to CaseIterable to benefit from 'allCases'
//Include custom implementation for backwards compatibility

extension EmojiGroup: CaseIterable {}

#if swift(>=4.2)
#else
public protocol CaseIterable {
    associatedtype AllCases: Collection where AllCases.Element == Self
    static var allCases: AllCases { get }
}
extension CaseIterable where Self: Hashable {
    public static var allCases: [Self] {
        return [Self](AnySequence { () -> AnyIterator<Self> in
            var raw = 0
            return AnyIterator {
                let current = withUnsafeBytes(of: &raw) { $0.load(as: Self.self) }
                guard current.hashValue == raw else {
                    return nil
                }
                raw += 1
                return current
            }
        })
    }
}
#endif
