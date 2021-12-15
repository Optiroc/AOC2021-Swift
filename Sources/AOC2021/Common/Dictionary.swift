//
//  Dictionary.swift
//
//  Created by David Lindecrantz on 2021-12-09.
//

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
