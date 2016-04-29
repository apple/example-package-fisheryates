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

private func random(max: Int) -> Int {
#if os(Linux)
    return Int(random() % max)
#else
    return Int(arc4random_uniform(UInt32(max)))
#endif
}

public extension MutableCollection where Index == Int, IndexDistance == Int {
    mutating func shuffleInPlace() {
        guard count > 1 else { return }

        for i in 0..<count - 1 {
            let j = random(max: count - i) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
