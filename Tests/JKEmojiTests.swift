//
//  JKEmojiTests.swift
//  JKEmojiTests
//
//  Created by Joseph Kalash on 2/14/18.
//  Copyright © 2018 Joseph Kalash. All rights reserved.
//

import XCTest
import JKEmoji

class JKEmojiTests: XCTestCase {
    
    func testIsEmoji() {
        XCTAssert("😂".first!.isEmoji)
        XCTAssert("a".first!.isEmoji == false)
        XCTAssert("😂😂😂".isEmoji == true)
        XCTAssert("😂😂a😂".isEmoji == false)
        XCTAssert("ok 😂 my 👻 c 😮hello ".emojis == ["😂", "👻", "😮"])
        XCTAssert("ok 😂 my 👻 c 😮hello ".emojiCount == 3)
    }
    
    func testEmojiDescription() {
        XCTAssert("👻".emojiDescription == "ghost")
        XCTAssert("🙀".emojiDescription == "weary cat face")
        XCTAssert("Hi".emojiDescription == nil)
    }
    
}
