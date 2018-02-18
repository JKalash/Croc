//
//  EmojiLookup.swift
//  Croc
//
//  Created by Joseph Kalash on 2/17/18.
//  Copyright © 2018 Joseph Kalash. All rights reserved.
//

public extension Croc {
    
    /// Finds subgroups of a given group type
    ///
    /// - Parameters:
    ///   - group: EmojiGroup type. List can be found at Croc.groupTypes
    /// - Returns: A list of emojis
    public static func subGroups(for group: EmojiGroup) -> [EmojiSubGroup] {
        return emojiRef.subGroups(for:group)
    }
    
    /// Finds matching emojis for a given sub-group.
    ///
    /// - Parameters:
    ///   - subgroup: EmojiSubGroup (string) type. List can be found at subGroups(for group: EmojiGroup)
    ///   - limit: Optional limit for the number of emojis to be returned
    /// - Returns: A list of matched emojis
    public static func emojis(for subgroup: EmojiSubGroup, limit : Int = -1) -> Array<Character> {
        return emojiRef.emojis(for: subgroup, limit: limit)
    }
    
    /// Finds matching emojis for a given group.
    ///
    /// - Parameters:
    ///   - group: EmojiGroup type. List can be found at Croc.groupTypes
    ///   - limit: Optional limit for the number of emojis to be returned
    /// - Returns: A list of matched emojis
    public static func emojis(for group: EmojiGroup, limit : Int = -1) -> Array<Character> {
        return emojiRef.emojis(for: group, limit : limit)
    }
}
