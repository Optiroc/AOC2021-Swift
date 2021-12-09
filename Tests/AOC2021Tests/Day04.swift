import XCTest
@testable import AOC2021

final class Day04: XCTestCase {
    /// Sample input
    ///
    /// https://adventofcode.com/2021/day/4
    let sampleInput = try! PuzzleInput.getInput(name: "day04_sample")

    /// Puzzle input
    ///
    /// https://adventofcode.com/2021/day/4/input
    let puzzleInput = try! PuzzleInput.getInput(name: "day04_puzzle")
    
    func testPartOne() throws {
        // Given sample input
        let sample = Bingo(text: sampleInput)
        XCTAssertEqual(sample.play(), 4512)

        // Given puzzle input
        let puzzle = Bingo(text: puzzleInput)
        print("Day 4, Part One - Answer:", puzzle.play())
    }
    
    func testPartTwp() throws {
        // Given sample input
        let sample = Bingo(text: sampleInput)
        XCTAssertEqual(sample.play(ftw: false), 1924)

        // Given puzzle input
        let puzzle = Bingo(text: puzzleInput)
        print("Day 4, Part Two - Answer:", puzzle.play(ftw: false))
    }
}
