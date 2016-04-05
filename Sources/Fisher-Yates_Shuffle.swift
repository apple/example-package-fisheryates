/*
 This source file is part of the Swift.org open source project

 Copyright 2015 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

#if os(Linux)
import Glibc
#else
import Darwin.C
#endif

public extension Collection {
    func shuffle() -> [Generator.Element] {
        var array = Array(self)
        array.shuffleInPlace()

        return array
    }
}

public extension MutableCollection where Index == Int {
    mutating func shuffleInPlace() {
        guard count > 1 else { return }

        for i in 0..<count - 1 {
#if os(Linux)
            let j = Int(random() % (count - i)) + i
#else
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
#endif
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
