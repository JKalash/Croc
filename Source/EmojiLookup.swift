//
//  EmojiLookup.swift
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
