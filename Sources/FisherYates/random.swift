/*
 This source file is part of the Swift.org open source project

 Copyright 2015 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

#if swift(>=4.0)
    public typealias RandomInteger = BinaryInteger
#elseif swift(>=3.0)
    public typealias RandomInteger = IntegerArithmetic
#else
    public typealias RandomInteger = IntegerArithmeticType
#endif

#if os(OSX)
    import Darwin

    public func random<T: RandomInteger> (_ n: T) -> T {
        numericCast(arc4random_uniform(numericCast(n)))
    }
#else
    import Glibc

    public func random<T: RandomInteger> (_ n: T) -> T {
        let upperLimit = RAND_MAX - RAND_MAX % numericCast(n)
        while true {
            let x = Glibc.random()
            if x < upperLimit { return numericCast(x) % n }
        }
    }
#endif
