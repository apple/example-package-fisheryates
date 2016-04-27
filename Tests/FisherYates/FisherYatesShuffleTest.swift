/*
 This source file is part of the Swift.org open source project
 
 Copyright (c) 2014 - 2016 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception
 
 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
*/

@testable import FisherYates
import XCTest

class FisherYatesShuffleTest: XCTestCase {
    
    func testShuffleInPlace(){
        let hand1 = [3,4,5,6,7]
        var hand2 = hand1
        hand2.shuffleInPlace()
        XCTAssertNotEqual(hand1, hand2)
        XCTAssertEqual(hand1.count, hand2.count)
        XCTAssertEqual(hand1.reduce(0, combine: +), hand2.reduce(0, combine: +))
    }
    
    func testShuffle(){
        let hand1 = [2,3,4,5,6]
        let hand2 = hand1.shuffle()
        XCTAssertNotEqual(hand1, hand2)
        XCTAssertEqual(hand1.count, hand2.count)
        XCTAssertEqual(hand1.reduce(0, combine: +), hand2.reduce(0, combine: +))
    }
    
}
