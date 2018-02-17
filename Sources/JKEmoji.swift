//
//  JKEmoji.swift
//  JKEmoji
//
//  Created by Joseph Kalash on 2/14/18.
//  Copyright © 2018 Joseph Kalash. All rights reserved.
//

let emojiRef = EmojiReference()

extension Character {
    public var isEmoji : Bool {
        get {
            return  emojiRef.isEmoji(Array(self.unicodeScalars))
        }
    }
    
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
    public var isEmoji : Bool {
        get {
            for character in self {
                if !character.isEmoji { return false}
            }
            return true
        }
    }
    
    public var containsEmoji : Bool {
        get {
            for character in self {
                if character.isEmoji { return true}
            }
            return false
        }
    }
    
    // Returns the number of emojis found
    public var emojiCount : UInt {
        get {
            var count : UInt = 0
            for character in self {
                if character.isEmoji { count += 1 }
            }
            return count
        }
    }
    
    public var emojiDescription : String? {
        get {
            if isEmoji {
                return emojiRef.description(for: Array(self.unicodeScalars))
            }
            return nil
        }
    }
    
    // Returns a list of emojis within the string
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
    
    static var groupTypes : [EmojiGroup] {
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
