/*
 This source file is part of the Swift.org open source project

 Copyright 2015 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

/// An extension for shuffling an imutable collection of elements.
public extension Collection {
    /// Returns a shuffled array.
    func shuffled() -> [Iterator.Element] {
        var array = Array(self)
        array.shuffle()
        return array
    }
}

/// An extension for shuffling a mutable collection of elements.
public extension MutableCollection {
    /// Shuffles elements in a random order.
    mutating func shuffle() {
        var i = startIndex
        var n = count
        
        while n > 1 {
            let j = index(i, offsetBy: random(n))
            swapAt(i, j)
            formIndex(after: &i)
            n -= 1
        }
    }
}
