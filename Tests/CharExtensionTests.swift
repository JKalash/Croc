//
//  CharExtensionTests
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

class CharExtensionTests: XCTestCase {

    func testIsEmoji() {
        XCTAssert(Character("😦").isEmoji)
        XCTAssert(Character("a").isEmoji == false)
        XCTAssert(Character("ã").isEmoji == false)
    }
    
    func testEmojiDescription() {
        XCTAssert(Character("😀").emojiDescription == "grinning face")
        XCTAssert(Character("😷").emojiDescription == "face with medical mask")
        XCTAssert(!"👷‍♂️".unicodeSupported ||  Character("👷‍♂️").emojiDescription == "man construction worker")
        XCTAssert(Character("˚").emojiDescription == nil)
    }

}
