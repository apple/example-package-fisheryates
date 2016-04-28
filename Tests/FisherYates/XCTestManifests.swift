/*
 This source file is part of the Swift.org open source project
 
 Copyright 2015 - 2016 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception
 
 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

extension FisherYatesShuffleTest{
    
    static var allTests : [(String, FisherYatesShuffleTest -> () throws -> Void)] {
        return [
                   ("testShuffle",testShuffled)
        ]
    }
}
