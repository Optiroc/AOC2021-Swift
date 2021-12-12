import XCTest
@testable import AOC2021

final class Day08: XCTestCase {
    /// Sample input
    ///
    /// https://adventofcode.com/2021/day/8
    let sampleInput = try! PuzzleInput.getStrings(name: "day08_sample")

    /// Puzzle input
    ///
    /// https://adventofcode.com/2021/day/8/input
    let puzzleInput = try! PuzzleInput.getStrings(name: "day08_puzzle")
    
    func testPartOne() throws {
        // Given sample input
        let sample = SevenSegment.load(sampleInput)
        let sampleUniqueDigits = sample.reduce(0) {
            $0 + SevenSegment.digitsWithUniqueNumberOfSegments(in: $1.outputs)
        }

        XCTAssertEqual(sampleUniqueDigits, 26)

        // Given puzzle input
        let puzzle = SevenSegment.load(puzzleInput)
        let puzzleUniqueDigits = puzzle.reduce(0) {
            $0 + SevenSegment.digitsWithUniqueNumberOfSegments(in: $1.outputs)
        }

        print("Day 8, Part One - Answer:", puzzleUniqueDigits)
    }
    
    func testPartTwo() throws {
        // Given sample input
        let tinySample = SevenSegment.load(["acedgfb cdfbe gcdfa fbcad dab cefabd cdfgeb eafb cagedb ab | cdfeb fcadb cdfeb cdbaf"])
        let tinySum = tinySample.reduce(0) { $0 + $1.getCode() }
        XCTAssertEqual(tinySum, 5353)

        let sample = SevenSegment.load(sampleInput)
        let sampleSum = sample.reduce(0) { $0 + $1.getCode() }
        XCTAssertEqual(sampleSum, 61229)

        // Given puzzle input
        let puzzle = SevenSegment.load(puzzleInput)
        let puzzleSum = puzzle.reduce(0) { $0 + $1.getCode() }

        print("Day 8, Part Two - Answer:", puzzleSum)
    }
}
