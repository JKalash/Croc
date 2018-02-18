//
//  JKEmoji.swift
//  JKEmoji
//
//  Created by Joseph Kalash on 2/14/18.
//  Copyright © 2018 Joseph Kalash. All rights reserved.
//

let emojiRef = EmojiReference()

extension Character {
    
    
    /// Returns true if the character is an emoji
    public var isEmoji : Bool {
        get {
            return  emojiRef.isEmoji(Array(self.unicodeScalars))
        }
    }
    
    /// English description for the emoji. Returns nil character is not an emoji
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


public class JKEmoji {
    
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
