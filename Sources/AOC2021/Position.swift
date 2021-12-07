//
//  Position.swift
//
//  Created by David Lindecrantz on 2021-12-03.
//

public struct Position: Equatable {
    public let horizontal: Int
    public let depth: Int
    public let aim: Int

    public var factor: Int {
        horizontal * depth
    }

    public init(horizontal: Int, depth: Int, aim: Int = 0) {
        self.horizontal = horizontal
        self.depth = depth
        self.aim = aim
    }

    public func moveV1(command: String) -> Position {
        let tokens = command.split(separator: " ")
        switch tokens.count {
        case 2:
            switch (tokens[0], Int(tokens[1])) {
            case let ("forward", .some(a)):
                return Position(horizontal: self.horizontal + a, depth: self.depth)
            case let ("down", .some(a)):
                return Position(horizontal: self.horizontal, depth: self.depth + a)
            case let ("up", .some(a)):
                return Position(horizontal: self.horizontal, depth: self.depth - a)
            default:
                return self
            }
        default:
            return self
        }
    }

    public func moveV2(command: String) -> Position {
        let tokens = command.split(separator: " ")
        switch tokens.count {
        case 2:
            switch (tokens[0], Int(tokens[1])) {
            case let ("forward", .some(a)):
                return Position(horizontal: self.horizontal + a, depth: self.depth + self.aim * a, aim: self.aim)
            case let ("down", .some(a)):
                return Position(horizontal: self.horizontal, depth: self.depth, aim: self.aim + a)
            case let ("up", .some(a)):
                return Position(horizontal: self.horizontal, depth: self.depth, aim: self.aim - a)
            default:
                return self
            }
        default:
            return self
        }
    }
}
