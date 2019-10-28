import Foundation
struct SwiftFusion {
    var text = "Hello, World!"
}

/// The Sieve of Eratosthenes:
///
/// To find all the prime numbers less than or equal to a given integer n:
///    - let l = [2...n]
///    - let p = 2
///    - for i in [(2 * p) through n by p] {
///          mark l[i]
///      }
///    - Remaining indices of unmarked numbers are primes
func sieve(_ n : Int) -> [Int] {
    if n <= 1 {
        return []
    }

    var marked : [Bool] = (0...n).map { _ in false }
    marked[0] = true
    marked[1] = true

    for p in 2..<n {
        for i in stride(from: 2 * p, through: n, by: p) {
            marked[i] = true
        }
    }

    var primes : [Int] = []
    for (t, i) in zip(marked, 0...n) {
        if !t {
            primes.append(i)
        }
    }
    return primes
}

/// Short and sweet check if a number is prime by enumerating from 2...⌈√(x)⌉ and checking 
/// for a nonzero modulus.
func isPrime(n : Int) -> Bool {
    if n == 0 || n == 1 {
        return false
    } else if n == 2 {
        return true
    }
    
    let max = Int(ceil(sqrt(Double(n))))
    for i in 2...max {
        if n % i == 0 {
            return false
        }
    }
    return true
}