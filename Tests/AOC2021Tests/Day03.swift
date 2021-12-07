import XCTest
@testable import AOC2021

final class Day03: XCTestCase {
    /// Sample input
    ///
    /// https://adventofcode.com/2021/day/3
    let sampleInput = try! PuzzleInput.getStrings(name: "day03_sample")

    /// Puzzle input
    ///
    /// https://adventofcode.com/2021/day/3/input
    let puzzleInput = try! PuzzleInput.getStrings(name: "day03_puzzle")

    func testErrorCodes() throws {
        // Given sample input
        let sample = BinaryDiagnostic(report: sampleInput)
        XCTAssertEqual(22, sample.gamma)
        XCTAssertEqual(9, sample.epsilon)
        XCTAssertEqual(198, sample.powerConsumption)

        // Given puzzle input
        let puzzle = BinaryDiagnostic(report: puzzleInput)
        print("Day 3, Part One - Answer:", puzzle.powerConsumption)
    }

    func testPartTwo() throws {
        // Given sample input
        let sample = BinaryDiagnostic(report: sampleInput)
        XCTAssertEqual(23, sample.oxygenGeneratorRating)
        XCTAssertEqual(10, sample.co2ScrubberRating)
        XCTAssertEqual(230, sample.lifeSupportRating)

        // Given puzzle input
        let puzzle = BinaryDiagnostic(report: puzzleInput)
        print("Day 3, Part Two - Answer:", puzzle.lifeSupportRating)
    }
}
