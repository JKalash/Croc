//
//  CharExtensionTests.swift
//  CrocTests
//
//  Created by Joseph Kalash on 2/18/18.
//  Copyright © 2018 Joseph Kalash. All rights reserved.
//

import XCTest
import Croc

class CharExtensionTests: XCTestCase {

    func testIsEmoji() {
        XCTAssert(Character("😦").isEmoji)
        XCTAssert(Character("a").isEmoji == false)
        XCTAssert(Character("ã").isEmoji == false)
    }
    
    func testEmojiDescription() {
        XCTAssert(Character("😀").emojiDescription == "grinning face")
        XCTAssert(Character("😷").emojiDescription == "face with medical mask")
        XCTAssert(Character("👷‍♂️").emojiDescription == "man construction worker")
        XCTAssert(Character("˚").emojiDescription == nil)
    }

}
