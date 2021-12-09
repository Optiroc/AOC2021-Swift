//
//  SparseCanvas.swift
//
//  Created by David Lindecrantz on 2021-12-09.
//

struct Point: Hashable {
    let x: Int
    let y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    init?(_ str: String) {
        let numbers = str.split(separator: ",").compactMap { Int($0) }
        if numbers.count == 2 {
            x = numbers[0]
            y = numbers[1]
        } else {
            return nil
        }
    }

    static func - (lhs: Point, rhs: Point) -> Point {
        Point(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    func abs() -> Point {
        Point(x: Swift.abs(x), y: Swift.abs(y))
    }
}

struct Line {
    enum Constraints {
        case orthogonal
        case orthogonalOrDiagonal
        case arbitrary
    }

    let p1: Point
    let p2: Point

    init?(text: String, constraints: Constraints) {
        let tokens = text.split(separator: " ")
        guard tokens.count == 3,
              tokens[1] == "->",
              let p1 = Point(String(tokens[0])),
              let p2 = Point(String(tokens[2])) else { fatalError() }

        self.p1 = p1
        self.p2 = p2

        if constraints == .orthogonal, !self.isOrthogonal { return nil }
        if constraints == .orthogonalOrDiagonal, !(self.isOrthogonal || self.isDiagonal) { return nil }
    }

    static func load(text: [String], constraints: Constraints = .orthogonal) -> [Line] {
        text.compactMap { Line(text: $0, constraints: constraints) }
    }

    var isOrthogonal: Bool {
        p1.x == p2.x || p1.y == p2.y
    }

    var isDiagonal: Bool {
        let v = (p2 - p1).abs()
        return v.x == v.y
    }

    var points: [Point] {
        switch ((p1.x, p1.y), (p2.x, p2.y)) {
        case let ((x1, y1), (x2, y2)) where x1 == x2:
            return stride(from: y1, through: y2, by: y1 < y2 ? 1 : -1).map {
                Point(x: x1, y: $0)
            }
        case let ((x1, y1), (x2, y2)) where y1 == y2:
            return stride(from: x1, through: x2, by: x1 < x2 ? 1 : -1).map {
                Point(x: $0, y: y1)
            }
        default:
            // Only correct for diagonals
            return zip(
                stride(from: p1.x, through: p2.x, by: p1.x < p2.x ? 1 : -1),
                stride(from: p1.y, through: p2.y, by: p1.y < p2.y ? 1 : -1)
            ).map {
                Point(x: $0.0, y: $0.1)
            }
        }
    }
}

class SparseCanvas {
    private var canvas = [Point: Int]()

    var dangerAreaCount: Int {
        canvas.values.reduce(into: 0) { $0 += $1 > 1 ? 1 : 0 }
    }

    func putPoint(_ coordinate: Point) {
        if let value = canvas[coordinate] {
            canvas[coordinate] = value + 1
        } else {
            canvas[coordinate] = 1
        }
    }

    func draw(_ line: Line) {
        line.points.forEach { putPoint($0) }
    }
}
