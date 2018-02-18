//
//  JKEmojiTests.swift
//  JKEmojiTests
//
//  Created by Joseph Kalash on 2/14/18.
//  Copyright © 2018 Joseph Kalash. All rights reserved.
//

import XCTest
import JKEmoji

class StringExtensionTests: XCTestCase {
    
    func testIsEmoji() {
        
        // Not emojis
        XCTAssert(!"😂😂😂".isEmoji)
        XCTAssert(!"😂😂a😂".isEmoji)
        XCTAssert(!"What is happening".isEmoji)
        XCTAssert(!"".isEmoji)
        XCTAssert(!" ".isEmoji)
        
        // Emojis
        XCTAssert("😂".isEmoji)
        XCTAssert("🍮".isEmoji)
        XCTAssert("💩".isEmoji)
        XCTAssert("🐕".isEmoji)
        XCTAssert("🚣🏿‍♂️".isEmoji)
        XCTAssert("🇷🇺".isEmoji)
        XCTAssert("👀".isEmoji)
    
    }
    
    func testContainsEmojis() {
        XCTAssert(!"".containsEmojis)
        XCTAssert(!" ".containsEmojis)
        XCTAssert(!"∫åß∂ƒ©˙∆˚ˆ¨¥†®´".containsEmojis)
        XCTAssert("AFGFH👍🏻å∑´®†©˙˜µ".containsEmojis)
        XCTAssert("🐝".containsEmojis)
        XCTAssert("🐝😟".containsEmojis)
        XCTAssert("✋🏿".containsEmojis)
    }
    
    func testEmojiDescription() {
        XCTAssert("👻".emojiDescription == "ghost")
        XCTAssert("🙀".emojiDescription == "weary cat face")
        XCTAssert("Hi".emojiDescription == nil)
    }
    
    func testEmojiCount() {
        XCTAssert("ok 😂 my 👻 c 😮he🧓🏾llo ⌛️🎇_uj🏦🥉🎂🅰️🇹🇬🇾🇹🇮🇪√📈👨‍👨‍👦‍👦Ô¨👩‍👩‍👧•‡👭🦉ÒÓ🐽🐬Ï😤".emojiCount == 21)
        XCTAssert("".emojiCount == 0)
        XCTAssert("😈🏪🕣🏳️‍🌈🇱🇧".emojiCount == 5)
        
        //Request emojis for a group
        //Construct a string from a group
        //Make sure matching emoji count
        let groups = JKEmoji.groupTypes
        for group in groups {
            let emojis = JKEmoji.emojis(for: group)
            let concat = String(emojis)
            print(concat)
            XCTAssert(concat.emojiCount == emojis.count)
        }
        
    }
    
    func testEmojis() {
        XCTAssert("ok¢∞§ 📞ª🏤 my√∆ß∆ 👻 c 🚬hello _;=-1".emojis == ["📞","🏤", "👻", "🚬"])
    }
    
}
