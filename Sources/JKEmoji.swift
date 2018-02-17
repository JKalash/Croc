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
}

extension String {
    public var isEmoji : Bool {
        get {
            for character in self {
                if character.isEmoji == false { return false}
            }
            return true
        }
    }
}

extension String {
    
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
