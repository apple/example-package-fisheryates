/*
 This source file is part of the Swift.org open source project

 Copyright 2015 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception

 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
*/

#if canImport(Darwin)
import Darwin

public func random<T: BinaryInteger> (_ n: T) -> T {
  return numericCast( arc4random_uniform( numericCast(n) ) )
}

#elseif canImport(Glibc)

import Glibc

public func random<T: BinaryInteger> (_ n: T) -> T {
  precondition(n > 0)

  let upperLimit = RAND_MAX - RAND_MAX % numericCast(n)

  while true {
    let x = Glibc.random()
    if x < upperLimit { return numericCast(x) % n }
  }
}

#else
#error("unsupported platform")
#endif
