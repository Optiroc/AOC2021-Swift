import XCTest
@testable import AOC2021

final class Day06: XCTestCase {
    /// Sample input
    ///
    /// https://adventofcode.com/2021/day/6
    let sampleInput = try! PuzzleInput.getInts(name: "day06_sample")

    /// Puzzle input
    ///
    /// https://adventofcode.com/2021/day/6/input
    let puzzleInput = try! PuzzleInput.getInts(name: "day06_puzzle")
    
    func testPartOne() throws {
        // Given sample input
        XCTAssertEqual(Lanternfish(sampleInput).next(18).count, 26)
        XCTAssertEqual(Lanternfish(sampleInput).next(80).count, 5934)

        // Given puzzle input
        let answer = Lanternfish(puzzleInput).next(80).count
        XCTAssertEqual(answer, 391671)
        print("Day 5, Part One - Answer:", answer)
    }

    func testPartTwo() throws {
        // Given sample input
        XCTAssertEqual(Lanternfish(sampleInput).next(256).count, 26984457539)

        // Given puzzle input
        let answer = Lanternfish(puzzleInput).next(256).count
        XCTAssertEqual(answer, 1754000560399)
        print("Day 5, Part Two - Answer:", answer)
    }
}
