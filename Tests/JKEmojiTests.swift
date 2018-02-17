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
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testIsEmoji() {
        XCTAssert("😂".first!.isEmoji)
        XCTAssert("a".first!.isEmoji == false)
        XCTAssert("😂😂😂".isEmoji == true)
        XCTAssert("😂😂a😂".isEmoji == false)
        XCTAssert("ok 😂 my 👻 c 😮hello ".emojis == ["😂", "👻", "😮"])
    }
    
}
