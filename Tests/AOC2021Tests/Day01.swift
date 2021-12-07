import XCTest
@testable import AOC2021

final class Day01: XCTestCase {
    /// Sample input
    ///
    /// https://adventofcode.com/2021/day/1
    let sampleInput = try! PuzzleInput.getInts(name: "day01_sample")

    /// Puzzle input
    ///
    /// https://adventofcode.com/2021/day/1/input
    let puzzleInput = try! PuzzleInput.getInts(name: "day01_puzzle")

    func testSonarSweep() throws {
        // The over-engineered solution, with facsimile log output
        let sweep = SonarSweep.sweep(measurements: sampleInput)
        print(SonarSweep.describe(sweep: sweep))
        
        let increasingMeasurements = sweep.reduce(into: 0) { $0 += $1.1 == .increased ? 1 : 0 }
        XCTAssertEqual(7, increasingMeasurements)
        
        // Given sample input
        XCTAssertEqual(7, SonarSweep.countIncreasing(measurements: sampleInput))
        
        // Given puzzle input
        print("Day 1, Part One - Answer:", SonarSweep.countIncreasing(measurements: puzzleInput))
    }
    
    func testSlidingWindowSonarSweep() throws {
        // Given sample input
        XCTAssertEqual(5, SonarSweep.countIncreasingSlidingSum(measurements: sampleInput, windowSize: 3))

        // Given puzzle input
        print("Day 1, Part Two - Answer:", SonarSweep.countIncreasingSlidingSum(measurements: puzzleInput, windowSize: 3))
    }
}
