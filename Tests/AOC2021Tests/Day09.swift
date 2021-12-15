import XCTest
@testable import AOC2021

final class Day09: XCTestCase {
    /// Sample input
    ///
    /// https://adventofcode.com/2021/day/9
    let sampleInput = try! PuzzleInput.getStrings(name: "day09_sample")

    /// Puzzle input
    ///
    /// https://adventofcode.com/2021/day/9/input
    let puzzleInput = try! PuzzleInput.getStrings(name: "day09_puzzle")
    
    func testPartOne() throws {
        // Given sample input
        let m = Matrix.load(sampleInput)
    }

    /*
     func testPartTwo() throws {
     }
     */
}

extension Matrix where T == Int {
    static func load(_ strings: [String]) -> Matrix {
        guard strings.count > 0 else { return Matrix(repeating: 0) }

        let s = strings.joined().compactMap { Int(String($0), radix: 10) }
        return Matrix<Int>(rows: strings.count, columns: strings[0].count, sequence: s)
    }
}
