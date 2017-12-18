/*
 This source file is part of the Swift.org open source project

 Copyright 2015 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

#if swift(<=3.0)
    typealias SignedInteger = _SignedIntegerType
#elseif swift(<=4.0)
    typealias SignedInteger = _SignedInteger
#endif

#if os(OSX)
    import Darwin

    public let random<T: SignedInteger>: (T) -> T = {
        numericCast(arc4random_uniform(numericCast($0)))
    }
#else
    import Glibc

    public let random<T: SignedInteger>: (T) -> T = {
        let upperLimit = RAND_MAX - RAND_MAX % numericCast($0)
        while true {
            let x = Glibc.random()
            if x < upperLimit { return numericCast(x) % $0 }
        }
    }
#endif
