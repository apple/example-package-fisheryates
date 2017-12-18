/*
 This source file is part of the Swift.org open source project

 Copyright 2015 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

#if swift(<=3.0)
    public typealias RandomInteger = IntegerArithmeticType
#elseif swift(<=3.1)
    public typealias RandomInteger = IntegerArithmetic
#else
    public typealias RandomInteger = BinaryInteger
#endif

#if os(OSX)
    import Darwin

    public let random<T: RandomInteger>: (T) -> T = {
        numericCast(arc4random_uniform(numericCast($0)))
    }
#else
    import Glibc

    public let random<T: RandomInteger>: (T) -> T = {
        let upperLimit = RAND_MAX - RAND_MAX % numericCast($0)
        while true {
            let x = Glibc.random()
            if x < upperLimit { return numericCast(x) % $0 }
        }
    }
#endif
