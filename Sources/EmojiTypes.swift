//
//  EmojiTypes.swift
//  JKEmoji
//
//  Created by Joseph Kalash on 2/17/18.
//  Copyright © 2018 Joseph Kalash. All rights reserved.
//

public enum EmojiGroupType : String {
    case smileysPeople = "Smileys & People"
    case animalsNature = "Animals & Nature"
    case foodDrink = "Food & Drink"
    case travelPlaces = "Travel & Places"
    case activities = "Activities"
    case objects = "Objects"
    case symbols = "Symbols"
    case flags = "Flags"
}

public struct Emoji : Equatable {
    var group : EmojiGroupType
    var subgroup : String
    var codePoints : Array<Unicode.Scalar>
    var description : String
    
    public static func ==(lhs: Emoji, rhs: Emoji) -> Bool {
        return lhs.codePoints == rhs.codePoints
    }
}
