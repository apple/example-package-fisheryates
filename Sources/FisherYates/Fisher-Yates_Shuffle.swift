/*
 This source file is part of the Swift.org open source project

 Copyright 2015 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

#if !swift(>=3.0)
    public typealias Collection = CollectionType
    public typealias MutableCollection = MutableCollectionType
#endif

public extension Collection {
    func shuffled() -> [Iterator.Element] {
        var array = Array(self)
        array.shuffle()
        return array
    }
}

#if !swift(>=4.0)
    private extension MutableCollection {
        mutating func swapAt(_ i: Index, _ j: Index) {
            guard i != j else { return }
            swap(&self[i], &self[j])
        }
    }
#endif

#if swift(>=3.0)
    public extension MutableCollection where Self: RandomAccessCollection {
        mutating func shuffle() {
            var n = count
            while n > 1 {
                let i = index(startIndex, offsetBy: count - n)
                let j = index(i, offsetBy: random(n))
                swapAt(i, j)
                n -= 1
            }
        }
    }
#else
    public extension MutableCollection where Index: RandomAccessIndexType {
        mutating func shuffle() {
            var n = count
            while n > 1 {
                let i = startIndex.advancedBy(count - n)
                let j = i.advancedBy(random(n))
                swapAt(i, j)
                n -= 1
            }
        }
    }
#endif
