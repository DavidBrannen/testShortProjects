//
//  FunProjectTests.swift
//  FunProjectTests
//
//  Created by MAC on 3/16/19.
//  Copyright © 2019 MAC. All rights reserved.
//
import XCTest

class FunProjectTests: XCTestCase {


    func testProblem1() {
        let inputs = [1, 2, 3, 4, 5]
        let solutions = 5
            let result = Problem1.perform(inputs)
            let solution = solutions
            XCTAssertEqual(result, solution, "\(inputs) caused an error")
    }
    func testProblem2() {
        let inputs = [1, 2, 8, 14, 5]
        let solutions = 8
        let result = Problem2.perform(inputs)
        let solution = solutions
        XCTAssertEqual(result, solution, "\(inputs) caused an error")
    }
    func testProblem3() {
        let inputs = [1, 2, 3, 4, 5]
        let sum = 7
        let solution1 = 3
        let solution2 = 2
        let result = Problem3.perform(inputs, sum: sum)
        let result1 = result?.0
        let result2 = result?.1
        XCTAssertEqual(result1, solution1, "\(inputs) caused an error1")
        XCTAssertEqual(result2, solution2, "\(inputs) caused an error2")
    }
    func testProblem4() {
        let inputs = [3, 2, 60, 4, 5, 2]
        let k = 40
        let solutions = 9
        let result = Problem4.perform(inputs, k: k)
        let solution = solutions
        XCTAssertEqual(result, solution, "\(inputs) caused an error")
    }

}

//1. Find the number of occurrences of an integer in a sorted array. (logarithmic solution preferred)
struct Problem1 {
    static func perform(_ arr: [Int]) -> Int {
        return arr.count
    }
}

//2. Find the second-largest integer of a non-sorted array (also including cases for negative values).
struct Problem2 {
    static func perform(_ arr: [Int]) -> Int {
        var largest = 0
        var second = 0
        for x in arr {
            if x > largest {
                if largest > second {
                    second = largest
                }
                largest = x
            } else {
                if x > second {
                    second = x
                }
            }
        }
        return second
    }
}

//3. Given an array and a sum, return indices of 2 integers within the array that total to that sum. Solve this in Linear runtime complexity
struct Problem3 {
    static func perform(_ arr: [Int], sum: Int) -> (Int, Int)? {
        var dict = [Int : Int]()
        for (currentIndex,x) in arr.enumerated() {
            let complement = sum - x
            if let y = dict[complement] {
                return (currentIndex, y)
            }
            dict[x] = currentIndex
        }
        return nil
    }
}

//
//4. Given an array and a value k, return the number of contiguous subarrays whose total product <= k. Assume all elements in array are integers > 0 and k is > 0. Provide a linear runtime complexity.
struct Problem4 {
    static func perform(_ arr: [Int], k: Int) -> Int {
        var count = 0
        let arrCount = arr.count
        for (index, n) in arr.enumerated() {
            if n <= k {
                count += 1
                var mul = n
                var j = index + 1
                for _ in j..<arrCount {
                    mul = mul * arr[j]
                    if mul <= k {
                        count += 1
                    } else { break}
                    j += 1
                }
            }
        }
        return count

    }
}
