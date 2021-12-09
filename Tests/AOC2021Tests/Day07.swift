import XCTest
@testable import AOC2021

final class Day07: XCTestCase {
    /// Sample input
    ///
    /// https://adventofcode.com/2021/day/7
    let sampleInput = try! PuzzleInput.getInts(name: "day07_sample")

    /// Puzzle input
    ///
    /// https://adventofcode.com/2021/day/7/input
    let puzzleInput = try! PuzzleInput.getInts(name: "day07_puzzle")
    
    func testPartOne() throws {
        // Given sample input
        let sample = CrabShoot(sampleInput)
        XCTAssertEqual(sample.costForPosition(1), 41)
        XCTAssertEqual(sample.costForPosition(10), 71)
        XCTAssertEqual(sample.costsForAllPositions().first!.1, 37)

        // Given puzzle input
        let puzzle = CrabShoot(puzzleInput)
        let cheapest = puzzle.costsForAllPositions().first!
        XCTAssertEqual(cheapest.0, 350)
        XCTAssertEqual(cheapest.1, 345035)

        print("Day 7, Part One - Answer:", cheapest.1)
    }
    
    func testPartTwo() throws {
        // Given sample input
        let sample = CrabShoot(sampleInput)
        XCTAssertEqual(sample.costForPositionV2(5), 168)
        XCTAssertEqual(sample.costForPositionV2(2), 206)
        XCTAssertEqual(sample.costsForAllPositionsV2().first!.1, 168)

        // Given puzzle input
        let puzzle = CrabShoot(puzzleInput)
        let cheapest = puzzle.costsForAllPositionsV2().first!
        XCTAssertEqual(cheapest.0, 478)
        XCTAssertEqual(cheapest.1, 97038163)

        print("Day 7, Part Two - Answer:", cheapest.1)
    }
}
