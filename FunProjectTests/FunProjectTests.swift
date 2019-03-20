//
//  FunProjectTests.swift
//  FunProjectTests
//
//  Created by MAC on 3/16/19.
//  Copyright © 2019 MAC. All rights reserved.
//
import XCTest

class FunProjectTests: XCTestCase {
    
    //1. Find the number of occurrences of an integer in a sorted array. (logarithmic solution preferred)
    func testProblem1() {
        let inputs = [1, 2, 3, 3, 3, 3, 3, 4, 5, 5, 6, 7]
        let k = 3
        let solutions = 5
        let result = Problem1.perform(inputs, k)
        let solution = solutions
        XCTAssertEqual(result, solution, "\(inputs), \(k) caused an error")
    }
    //2. Find the second-largest integer of a non-sorted array (also including cases for negative values).
    func testProblem2() {
        let inputs = [-1, -12, -17, -5, -14, -5, 5, 5, 4]
        let solutions = 4
        let result = Problem2.perform(inputs)
        let solution = solutions
        XCTAssertEqual(result, solution, "\(inputs) caused an error")
    }
    //3. Given an array and a sum, return indices of 2 integers within the array that total to that sum. Solve this in Linear runtime complexity
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
    //4. Given an array and a value k, return the number of contiguous subarrays whose total product <= k. Assume all elements in array are integers > 0 and k is > 0. Provide a linear runtime complexity.
    func testProblem4() {
        let inputs = [3, 2, 60, 4, 5, 2]
        let k = 40
        let solutions = 9
        let result = Problem4.perform(inputs, k: k)
        let solution = solutions
        XCTAssertEqual(result, solution, "\(inputs) caused an error")
    }
    //fahad C H /sorted array - find the occurrence of the given key
    func testProblem5() {
        let inputs = [1,2,3,3,3,3,3,3,3,4,5,5,5,5,6,6,6,6,6,6,6,7,8,33,45,66,78]
        //        same as 1
        let k = 3
        let solutions = 7
        let result = Problem5.occurrences(inputs, k)
        let solution = solutions
        XCTAssertEqual(result, solution, "\(inputs) caused an error")
    }
    //binary search - sorted- find the occurrence of the given key
    func testProblem6() {
        let inputs = [1,2,3,3,3,3,3,3,3,4,5,5,5,5,6,6,6,6,6,6,6,7,8,33,45,66,78]
        let k = 5
        let result = Problem6.binaryOccurrences(inputs, k)
        let solution = 4
        XCTAssertEqual(result, solution, "\(inputs) count \(k) caused an error")
    }
}
// binary search for occurrenence count
struct Problem6 {
    static func binaryOccurrences(_ arr: [Int], _ k: Int) -> Int {
        func leftBound () -> Int {
            var lowerBound = 0
            var upperBound = arr.count
            while lowerBound < upperBound {
                let midIndex = lowerBound + (upperBound - lowerBound) / 2
                if arr[midIndex] < k {
                    lowerBound = midIndex + 1
                } else  {
                    upperBound = midIndex
                }
            }
            return lowerBound
        }
        
        func rightBound () -> Int {
            var lowerBound = 0
            var upperBound = arr.count
            while lowerBound < upperBound {
                let midIndex = lowerBound + (upperBound - lowerBound) / 2
                if arr[midIndex] > k {
                    upperBound = midIndex
                } else  {
                    lowerBound = midIndex + 1
                }
            }
            return lowerBound
        }
        
        return rightBound() - leftBound()
    }
}

//***********
//fahad C H /sorted array - find the occurrence of the given key
struct Problem5 {
    static func occurrences(_ arr: [Int],_ k: Int) -> Int {
        return arr.reduce(0) { return $0 + ($1 == k ? 1 : 0) }
        //Do with binary search above
    }
}
//1. Find the number of occurrences of an integer in a sorted array. (logarithmic solution preferred)
struct Problem1 {
    static func perform(_ arr: [Int],_ k: Int) -> Int {
        var intCount = 0
        for r in arr {
            if r == k {
                intCount += 1
            }
            if r > k {break}
        }
        return intCount
    }
}

//2. Find the second-largest integer of a non-sorted array (also including cases for negative values).
struct Problem2 {
    static func perform(_ arr: [Int]) -> Int? {
        var largest = arr[0]
        var second: Int?
        
        for i in 1..<arr.count {
            if arr[i] >= largest {
                largest = arr[i]
            }
        }
        for i in 0..<arr.count {
            if arr[i] < largest {
                second = arr[i]
                break
            }
        }
        if second == nil { return nil }
        for i in 0..<arr.count {
            if arr[i] > second! && arr[i] != largest {
                second = arr[i]
            }
        }
        return second!
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
////////////
//888888888888*******8888
// equate enum case
enum person {
    
    case student(name: String)
    
    case teacher(name: String)
}
// equate enum case... which has... associated values. Yeah, the static comparison method
//Let's implement the Equatable protocol.
extension person: Equatable {
    static func == (lhs: person, rhs: person) -> Bool {
        var lhsVal: String? = nil
        switch(lhs) {
        case .student(let name):
            lhsVal = name
        case .teacher(let name):
            lhsVal = name
        }
        
        var rhsVal: String? = nil
        switch(rhs) {
        case .student(let name):
            rhsVal = name
        case .teacher(let name):
            rhsVal = name
        }
        return lhsVal == rhsVal
    }
}
let student1 = person.student(name: "Foo")
let teacher1 = person.teacher(name: "Foo")

let op = Operation.init()

let blockOp = BlockOperation {
    if student1 == teacher1 {
        print("They are the same")
    }
    else {
        print("They are not the same")
    }
}




