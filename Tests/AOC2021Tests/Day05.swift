import XCTest
@testable import AOC2021

final class Day05: XCTestCase {
    /// Sample input
    ///
    /// https://adventofcode.com/2021/day/5
    let sampleInput = try! PuzzleInput.getStrings(name: "day05_sample")

    /// Puzzle input
    ///
    /// https://adventofcode.com/2021/day/5/input
    let puzzleInput = try! PuzzleInput.getStrings(name: "day05_puzzle")
    
    func testPartOne() throws {
        // Given sample input
        let sample = SparseCanvas()
        Line.load(text: sampleInput).forEach { sample.draw($0) }
        XCTAssertEqual(sample.dangerAreaCount, 5)

        // Given puzzle input
        let puzzle = SparseCanvas()
        Line.load(text: puzzleInput).forEach { puzzle.draw($0) }
        print("Day 5, Part One - Answer:", puzzle.dangerAreaCount)
    }

    func testPartTwo() throws {
        // Given sample input
        let sample = SparseCanvas()
        Line.load(text: sampleInput, constraints: .orthogonalOrDiagonal).forEach { sample.draw($0) }
        XCTAssertEqual(sample.dangerAreaCount, 12)

        // Given puzzle input
        let puzzle = SparseCanvas()
        Line.load(text: puzzleInput, constraints: .orthogonalOrDiagonal).forEach { puzzle.draw($0) }
        print("Day 5, Part Two - Answer:", puzzle.dangerAreaCount)
    }
}
