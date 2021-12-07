//
//  SonarSweep.swift
//
//  Created by David Lindecrantz on 2021-12-03.
//

import Algorithms

public struct SonarSweep {
    enum Change {
        case increased
        case decreased
        case na
        
        var description: String {
            switch self {
            case .increased: return "increased"
            case .decreased: return "decreased"
            case .na: return "N/A - no previous measurement"
            }
        }
    }

    static func describe(sweep: [(Int, Change)]) -> String {
        sweep.reduce(into: "") {
            $0 = $0 + "\($1.0) (\($1.1.description))\n"
        }
    }

    static func sweep(measurements: [Int]) -> [(Int, Change)] {
        ([nil] + measurements.map { Optional($0) })
            .adjacentPairs().map { (a, b) -> (Int, Change) in
                switch (a, b) {
                case let (.none, .some(b)):
                    return (b, .na)
                case let (.some(a), .some(b)):
                    return (b, a == b ? .na : a > b ? .decreased : .increased)
                default:
                    return (0, .na)
                }
            }
    }

    static func countIncreasing(measurements: [Int]) -> Int {
        measurements.adjacentPairs().reduce(into: 0) {
            $0 += $1.0 < $1.1 ? 1 : 0
        }
    }

    static func countIncreasingSlidingSum(measurements: [Int], windowSize: Int) -> Int {
        slidingWindowSums(measurements: measurements, windowSize: windowSize).adjacentPairs().reduce(into: 0) {
            $0 += $1.0 < $1.1 ? 1 : 0
        }
    }

    private static func slidingWindowSums(measurements: [Int], windowSize: Int) -> [Int] {
        slidingWindowSequence(measurements: measurements, windowSize: windowSize).map {
            $0.reduce(0, +)
        }
    }

    private static func slidingWindowSequence(measurements: [Int], windowSize: Int) -> [[Int]] {
        stride(from: 0, through: measurements.count - windowSize, by: 1).map {
            Array(measurements[$0 ..< $0+windowSize])
        }
    }
}
