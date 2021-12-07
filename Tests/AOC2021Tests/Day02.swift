import XCTest
@testable import AOC2021

final class Day02: XCTestCase {
    /// Sample input
    ///
    /// https://adventofcode.com/2021/day/2
    let sampleInput = try! PuzzleInput.getStrings(name: "day02_sample")

    /// Puzzle input
    ///
    /// https://adventofcode.com/2021/day/2/input
    let puzzleInput = try! PuzzleInput.getStrings(name: "day02_puzzle")

    func testPositionalMovement() throws {
        // Given sample input
        let sample = sampleInput.reduce(into: Position(horizontal: 0, depth: 0)) {
            $0 = $0.moveV1(command: $1)
        }
        
        XCTAssertEqual(Position(horizontal: 15, depth: 10), sample)
        XCTAssertEqual(150, sample.factor)
        
        // Given puzzle input
        let puzzle = puzzleInput.reduce(into: Position(horizontal: 0, depth: 0)) {
            $0 = $0.moveV1(command: $1)
        }

        print("Day 2, Part One - Answer:", puzzle.factor)
    }

    func testAimMovement() throws {
        // Given sample input
        let sample = sampleInput.reduce(into: Position(horizontal: 0, depth: 0)) {
            $0 = $0.moveV2(command: $1)
        }

        XCTAssertEqual(Position(horizontal: 15, depth: 60, aim: 10), sample)
        XCTAssertEqual(900, sample.factor)

        // Given puzzle input
        let puzzle = puzzleInput.reduce(into: Position(horizontal: 0, depth: 0)) {
            $0 = $0.moveV2(command: $1)
        }

        print("Day 2, Part Two - Answer:", puzzle.factor)
   }
}
