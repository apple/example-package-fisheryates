/*
 This source file is part of the Swift.org open source project

 Copyright 2015 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

#if swift(>=2.2) && !swift(>=3.0)
    public typealias Collection = CollectionType
#endif


public extension Collection {
    func shuffled() -> [Iterator.Element] {
        var array = Array(self)
        array.shuffle()
        return array
    }
}

#if swift(>=3.0)
    public extension MutableCollection where Self: RandomAccessCollection, IndexDistance == Int {
        mutating func shuffle() {
            guard !isEmpty else { return }
            
            for n in 0 ..< count - 1 {
                let i = index(startIndex, offsetBy: n)
                let j = index(i, offsetBy: random(count - n))
                
                guard i != j else { continue }
                #if swift(>=4.0)
                    swapAt(i, j)
                #else
                    swap(&self[i], &self[j])
                #endif
            }
        }
    }
#else
    public extension MutableCollectionType where Index: RandomAccessIndexType, Index.Distance == Int {
        mutating func shuffle() {
            guard !isEmpty else { return }
            
            for n in 0 ..< count - 1 {
                let i = startIndex.advancedBy(
                let j = i.advancedBy(random(count - n))
                
                guard i != j else { continue }
                swap(&self[i], &self[j])
            }
        }
    }
#endif
