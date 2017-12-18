/*
 This source file is part of the Swift.org open source project

 Copyright 2015 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

public extension Collection {
    func shuffled() -> [Iterator.Element] {
        var array = Array(self)
        array.shuffle()
        return array
    }
}

public extension MutableCollection {
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
