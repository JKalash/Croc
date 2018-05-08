//
//  EmojiLookupTests.swift
//  Croc
//
//  Created by joe on 08/05/2018.
//  Copyright © 2018 Joseph Kalash. All rights reserved.
//

import XCTest
import Croc


class EmojiLookupTests: XCTestCase {
    
    var emojiSubgroups : [EmojiSubGroup] = []
    
    override func setUp() {
        for group in EmojiGroup.allCases {
            emojiSubgroups.append(contentsOf: Croc.subGroups(for: group))
        }
    }
    
    func testEmojisForGroup() {
        XCTAssert(Croc.emojis(for: .activities, limit: 0).count == 0)
        XCTAssert(Croc.emojis(for: .flags, limit: 1).count <= 1)
        XCTAssert(Croc.emojis(for: .foodDrink, limit: 10).count <= 10)
    }

    func testEmojisForSubgroup() {
        
        let eLimit = 5
        for subgroup in emojiSubgroups {
            let emojiCount = Croc.emojis(for: subgroup, limit: eLimit).count
            XCTAssert(emojiCount <= eLimit)
        }
    }
}
