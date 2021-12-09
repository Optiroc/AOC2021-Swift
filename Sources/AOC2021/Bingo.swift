//
//  Bingo.swift
//
//  Created by David Lindecrantz on 2021-12-08.
//

import Foundation
import Algorithms

struct Bingo {
    let numbers: [Int]
    let boards: [BingoBoard]
    
    init(text: String) {
        var chunks = text
            .components(separatedBy: "\n")
            .split(separator: "")
        
        numbers = chunks
            .removeFirst().first!
            .split(separator: ",")
            .map { Int($0)! }
                
        boards = chunks.map {
            BingoBoard(array: $0.map { $0 })
        }
    }
    
    func play(ftw: Bool = true) -> Int {
        var boardsWon = Set<Int>()
        for turn in 0..<numbers.count {
            let drawn = Set(numbers[0...turn])
            for (index, board) in boards.enumerated() {
                if let result = board.result(drawn: drawn, current: numbers[turn]) {
                    boardsWon.insert(index)
                    if boardsWon.count == (ftw ? 1 : boards.count) { return result }
                }
            }
        }
        return 0
    }    
}

struct BingoBoard {
    let width: Int
    let height: Int
    let numbers: [Int]
    let sets: [Set<Int>]
    
    init(array: [String]) {
        height = array.count
        width = array.first!.split(separator: " ").count

        numbers = array
            .flatMap { $0.split(separator: " ") }
            .map { Int($0)! }
        
        if numbers.count != height * width {
            fatalError()
        }
        
        // Rows
        var s = [Set<Int>]()
        s += numbers.chunks(ofCount: width).map { Set($0) }
        
        // Columns
        for i in 0..<width {
            s += [Set(numbers.dropFirst(i).striding(by: width))]
        }
        
        // Diagonals ... don't count
        /*
        s += [Set(numbers.striding(by: width + 1).map { $0 })]
        s += [Set(numbers.dropFirst(width - 1).striding(by: width - 1).dropLast().map { $0 })]
        */
        
        sets = s
    }
    
    func result(drawn: Set<Int>, current: Int) -> Int? {
        for s in sets {
            if s.isSubset(of: drawn) {
                return current * numbers
                    .filter { !drawn.contains($0) }
                    .reduce(0, +)
            }
        }
        return nil
    }
}
