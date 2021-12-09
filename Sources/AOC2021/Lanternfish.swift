//
//  Lanternfish.swift
//  
//  Created by David Lindecrantz on 2021-12-09.
//

struct Lanternfish {
    let population: [Int: UInt64]
    
    var count: UInt64 {
        population.reduce(0) { $0 + $1.value }
    }
    
    init(population: [Int: UInt64]) {
        self.population = population
    }
    
    init(_ initialState: [Int]) {
        population = initialState.reduce(into: [Int: UInt64]()) {
            $0.add(1, to: $1)
        }
    }
    
    func next() -> Lanternfish {
        Lanternfish(population: population.reduce(into: [Int: UInt64]()) {
            if $1.key > 0 {
                $0.add($1.value, to: $1.key - 1)
            } else {
                $0.add($1.value, to: 6)
                $0.add($1.value, to: 8)
            }
        })
    }
    
    func next(_ days: UInt) -> Lanternfish {
        if days == 0 {
            return self
        } else {
            return next().next(days - 1)
        }
    }
}

extension Dictionary where Key: FixedWidthInteger, Value: AdditiveArithmetic {
    /// Add `value` to dictionary key
    mutating func add(_ value: Value, to key: Key) {
        if let oldValue = self[key] {
            self[key] = oldValue + value
        } else {
            self[key] = value
        }
    }
}
