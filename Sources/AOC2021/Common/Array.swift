//
//  Array.swift
//
//  Created by David Lindecrantz on 2021-12-09.
//

extension Array where Element: SetAlgebra {
    func intersection() -> Element {
        if let first = self.first {
            return self.dropFirst().reduce(into: first) {
                $0 = $0.intersection($1)
            }
        } else {
            return Element()
        }
    }
    
    func union() -> Element {
        if let first = self.first {
            return self.dropFirst().reduce(into: first) {
                $0 = $0.union($1)
            }
        } else {
            return Element()
        }
    }
}
