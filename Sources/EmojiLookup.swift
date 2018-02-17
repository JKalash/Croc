//
//  EmojiLookup.swift
//  JKEmojiiOS
//
//  Created by Joseph Kalash on 2/17/18.
//  Copyright © 2018 Joseph Kalash. All rights reserved.
//

public extension JKEmoji {
    public static func subGroups(for group: EmojiGroup) -> [EmojiSubGroup] {
        return emojiRef.subGroups(for:group)
    }
}
