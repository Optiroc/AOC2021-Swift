//
//  SevenSegment.swift
//
//  Created by David Lindecrantz on 2021-12-10.
//

struct SevenSegment {
    //   0:      1:      2:      3:      4:
    //  aaaa    ....    aaaa    aaaa    ....
    // b    c  .    c  .    c  .    c  b    c
    // b    c  .    c  .    c  .    c  b    c
    //  ....    ....    dddd    dddd    dddd
    // e    f  .    f  e    .  .    f  .    f
    // e    f  .    f  e    .  .    f  .    f
    //  gggg    ....    gggg    gggg    ....
    //
    //   5:      6:      7:      8:      9:
    //  aaaa    aaaa    aaaa    aaaa    aaaa
    // b    .  b    .  .    c  b    c  b    c
    // b    .  b    .  .    c  b    c  b    c
    //  dddd    dddd    ....    dddd    dddd
    // .    f  e    f  .    f  e    f  .    f
    // .    f  e    f  .    f  e    f  .    f
    //  gggg    gggg    ....    gggg    gggg

    let patterns: [String]
    let outputs: [String]

    init(_ text: String)  {
        let input = text.split(separator: "|")
        guard input.count == 2 else { fatalError() }

        patterns = input[0].split(separator: " ").map { String($0) }
        outputs = input[1].split(separator: " ").map { String($0) }
        guard patterns.count == 10, outputs.count == 4 else { fatalError() }
    }

    func getCode() -> Int {
        let table = Self.makeWireTable(from: patterns)
        return outputs.reduce(0) { $0 * 10 + Self.decipher(pattern: $1, using: table) }
    }

    static func digitsWithUniqueNumberOfSegments(in strings: [String]) -> Int {
        let unique = [2, 4, 3, 7]
        return strings.reduce(0) { $0 + (unique.contains($1.count) ? 1 : 0) } //
    }

    static func load(_ texts: [String]) -> [SevenSegment] {
        texts.map { SevenSegment($0) }
    }

    static func decipher(pattern: String, using table: [Int: Set<String.Element>]) -> Int {
        let s = Set(pattern)
        for (v, k) in table {
            if s == k { return v }
        }
        fatalError()
    }

    static func makeWireTable(from strings: [String]) -> [Int: Set<String.Element>] {
        var digits = [Int: Set<String.Element>]()

        // Map trivial patterns, put symbols for 5/6-segment digits in sets
        var wireSets5 = [Set<String.Element>]()
        var wireSets6 = [Set<String.Element>]()

        strings.forEach { pattern in
            switch (pattern.count, Set(pattern)) {
            case let (2, a):
                digits[1] = a
            case let (3, a):
                digits[7] = a
            case let (4, a):
                digits[4] = a
            case let (7, a):
                digits[8] = a
            case let (5, a):
                wireSets5.append(a)
            case let (6, a):
                wireSets6.append(a)
            case (0, _), (1, _):
                fatalError()
            default: break
            }
        }

        let wireIntersection5 = wireSets5.intersection()
        let wireIntersection6 = wireSets6.intersection()
        let wireSet6minus5 = wireIntersection6.subtracting(wireIntersection5) // Segment B & F
        let wireSet5minus6 = wireIntersection5.subtracting(wireIntersection6) // Segment D

        // Deduce 5-segment digits (2, 3, 5)
        guard let five = wireSets5.filter({ $0.isSuperset(of: wireSet6minus5) }).first else { fatalError() }
        digits[5] = five
        digits[2] = wireSets5.filter({ $0.subtracting(five).count == 2 }).first
        digits[3] = wireSets5.filter({ $0.subtracting(five).count == 1 }).first

        // Deduce 6-segment digits (0, 6, 9)
        digits[0] = digits[8]?.subtracting(wireSet5minus6)
        digits[9] = digits[7]?.union(five)
        digits[6] = digits[0]?.subtracting(digits[1]!).union(five)

        return digits
    }
}
