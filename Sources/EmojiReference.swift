//
//  EmojiReference.swift
//  JKEmoji
//
//  Created by Joseph Kalash on 2/17/18.
//  Copyright © 2018 Joseph Kalash. All rights reserved.
//

internal class EmojiReference {
    
    private var emojiList : Array<Emoji> = []
    
    //For fast lookup of hashcodes
    private var emojiHashcodes : Dictionary<String, Bool> = [:]
    
    init() {
        //Try to read path to file
        if let path = Bundle(for: EmojiReference.self).path(forResource: "emojis", ofType: "json") {
            if let data = NSData(contentsOfFile: path) {
                if let jsonData = try? JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as! Dictionary<String, Dictionary<String, Array<Dictionary<String, AnyObject>>>> {
                    for (group, subgroups) in jsonData {
                        for (subgroup, emojis) in subgroups {
                            for emoji in emojis {
                                if let codepoints_strings  = emoji["codepoints"] as? Array<String>, let description = emoji["description"] as? String {
                                    //Convert codepoints into UInt32
                                    let codepoints = codepoints_strings.flatMap({ return Unicode.Scalar(UInt32($0, radix: 16)!) })
                                    emojiList.append(Emoji(group: EmojiGroupType(rawValue: group) ?? .objects,
                                                           subgroup: subgroup,
                                                           codePoints: codepoints,
                                                           description: description))
                                    //Fill in the hashcode of the emojiList
                                    emojiHashcodes[codepoints_strings.joined()] = true
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func isEmoji(_ unicode_scalar: Array<Unicode.Scalar>) -> Bool {
        //Convert to array of strings and check if maps to dictionary element
        let hex_string = unicode_scalar.flatMap({ String(format:"%2X", UInt32($0))  }).joined()
        return emojiHashcodes[hex_string] != nil
    }
    
}
