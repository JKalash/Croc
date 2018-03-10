//
//  StringExtensionTests.swift
//  CrocTests
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
import XCTest
import Croc

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
        XCTAssert("🚣🏿‍♂️".count > 1 ||  "🚣🏿‍♂️".isEmoji)
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
        
        print("_😂_👻_😮_🧓🏾_⌛️_🎇_🏦_🥉_🎂_🅰️_🇹🇬_🇾🇹_🇮🇪_📈_👨‍👨‍👦‍👦_👩‍👩‍👧_👭_🦉_🧚🏿‍♂️_🧟‍♀️_👯‍♀️_👳🏿‍♂️_🌮_🎿_🏎_🏖_📷_📋_".emojiCount)
        
        if #available(iOS 11.0, *) {
             XCTAssert("_😂_👻_😮_🧓🏾_⌛️_🎇_🏦_🥉_🎂_🅰️_🇹🇬_🇾🇹_🇮🇪_📈_👨‍👨‍👦‍👦_👩‍👩‍👧_👭_🦉_🧚🏿‍♂️_🧟‍♀️_👯‍♀️_👳🏿‍♂️_🌮_🎿_🏎_🏖_📷_📋_".emojiCount >= 26)
        }
        else if #available(iOS 9.0, *) {
            XCTAssert("_😂_👻_😮_🧓🏾_⌛️_🎇_🏦_🥉_🎂_🅰️_🇹🇬_🇾🇹_🇮🇪_📈_👨‍👨‍👦‍👦_👩‍👩‍👧_👭_🦉_🧚🏿‍♂️_🧟‍♀️_👯‍♀️_👳🏿‍♂️_🌮_🎿_🏎_🏖_📷_📋_".emojiCount >= 23)
        }
        else if #available(iOS 8.0, *) {
            XCTAssert("_😂_👻_😮_🧓🏾_⌛️_🎇_🏦_🥉_🎂_🅰️_🇹🇬_🇾🇹_🇮🇪_📈_👨‍👨‍👦‍👦_👩‍👩‍👧_👭_🦉_🧚🏿‍♂️_🧟‍♀️_👯‍♀️_👳🏿‍♂️_🌮_🎿_🏎_🏖_📷_📋_".emojiCount >= 20)
        }
        
        
        XCTAssert("".emojiCount == 0)
        XCTAssert("😈🏪🕣🏳️‍🌈🇱🇧".emojiCount == 5)
        
        //Request emojis for a group
        //Construct a string from a group
        //Make sure matching emoji count
        let groups = Croc.groupTypes
        for group in groups {
            let emojis = Croc.emojis(for: group)
            let concat = emojis.map({ String($0)}).joined(separator: " ")
            XCTAssert(concat.emojiCount == emojis.count)
        }
        
    }
    
    func testEmojis() {
        XCTAssert("ok¢∞§ 📞ª🏤 my√∆ß∆ 👻 c 🚬hello _;=-1".emojis == ["📞","🏤", "👻", "🚬"])
        XCTAssert("".emojis == [])
        XCTAssert("hello, world!".emojis == [])
        
        //Request emojis for a group
        //Construct a string from a group
        //Make sure matching emoji count
        let groups = Croc.groupTypes
        for group in groups {
            let emojis = Croc.emojis(for: group)
            let concat = emojis.map({ String($0)}).joined(separator: " ")
            XCTAssert(concat.emojis.count == emojis.count)
        }
    }
    
}
