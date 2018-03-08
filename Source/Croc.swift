//
//  Croc.swift
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


let emojiRef = EmojiReference()

extension Character {
    
    
    /// Returns true if the character is an emoji
    public var isEmoji : Bool {
        get {
            return  emojiRef.isEmoji(Array(self.unicodeScalars)) && self.unicodeSupported
        }
    }
    
    /// English description for the emoji. Returns nil if:
    // 1. Character is not an emoji
    // 2. OS does not yet support Unicode version for an emoji
    public var emojiDescription : String? {
        get {
            if isEmoji {
                return emojiRef.description(for: Array(self.unicodeScalars))
            }
            return nil
        }
    }
}

extension String {
    
    /// Returns true if the string is exactly one emoji
    public var isEmoji : Bool {
        get {
            if self.count != 1 { return false}
            return self.first!.isEmoji
        }
    }
    
    
    /// Returns true if the string contains one or more emojis
    public var containsEmojis : Bool {
        get {
            for character in self {
                if character.isEmoji { return true}
            }
            return false
        }
    }
    
    /// Number of emojis in the string
    public var emojiCount : UInt {
        get {
            var count : UInt = 0
            for character in self {
                if character.isEmoji { count += 1 }
            }
            return count
        }
    }
    
    /// English description for the emoji. Returns nil string is not an emoji
    public var emojiDescription : String? {
        get {
            if isEmoji {
                return emojiRef.description(for: Array(self.unicodeScalars))
            }
            return nil
        }
    }
    
    
    /// List of emojis embedded in the string
    public var emojis : Array<Character> {
        get {
            var emojis : Array<Character> = []
            for character in self {
                if character.isEmoji {
                    emojis.append(character)
                }
            }
            return emojis
        }
    }
}


public class Croc {
    
    public static var groupTypes : [EmojiGroup] {
        get {
            return [.smileysPeople,
                    .animalsNature,
                    .foodDrink,
                    .travelPlaces,
                    .activities,
                    .objects,
                    .symbols,
                    .flags]
        }
    }
    
}
