//
//  CrabShoot.swift
//  
//  Created by David Lindecrantz on 2021-12-09.
//

struct CrabShoot {
    let crabs: [Int: Int]
    
    let minPos: Int
    let maxPos: Int
    let fuelConsumptionTable: [Int]

    var range: ClosedRange<Int> { minPos...maxPos }
        
    init(_ initialState: [Int]) {
        var min = Int.max
        var max = Int.min
        crabs = initialState.reduce(into: [Int: Int]()) {
            if $1 < min { min = $1 }
            if $1 > max { max = $1 }
            return $0.add(1, to: $1)
        }
        minPos = min
        maxPos = max
        
        var acc = 0
        fuelConsumptionTable = (0...maxPos-minPos).map {
            let v = $0 + acc
            acc += $0
            return v
        }
    }
    
    func costForPosition(_ position: Int) -> Int {
        crabs.reduce(0) {
            $0 + abs($1.key - position) * $1.value
        }
    }

    func costsForAllPositions() -> [(Int, Int)] {
        range
            .map { (Int($0), costForPosition($0)) }
            .sorted { $0.1 < $1.1 }
    }

    func costForPositionV2(_ position: Int) -> Int {
        crabs.reduce(0) {
            $0 + fuelConsumptionTable[abs($1.key - position)] * $1.value
        }
    }
    
    func costsForAllPositionsV2() -> [(Int, Int)] {
        range
            .map { (Int($0), costForPositionV2($0)) }
            .sorted { $0.1 < $1.1 }
    }
}
