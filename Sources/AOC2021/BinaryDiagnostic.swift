//
//  BinaryDiagnostic.swift
//
//  Created by David Lindecrantz on 2021-12-08.
//

public struct BinaryDiagnostic {
    enum RatingType {
        case oxygen
        case co2
    }

    let report: [String]

    var count: Int {
        report.count
    }

    var gamma: Int {
        Int(columns.reduce(into: "") { $0 += String($1.mostCommon!) }, radix: 2)!
    }

    var epsilon: Int {
        Int(columns.reduce(into: "") { $0 += String($1.leastCommon!) }, radix: 2)!
    }

    var powerConsumption: Int {
        gamma * epsilon
    }

    var oxygenGeneratorRating: Int {
        let r = Self.filterRatingReadouts(self, rating: .oxygen)
        if r.count != 1 { fatalError() }
        return Int(r.report[0], radix: 2)!
    }

    var co2ScrubberRating: Int {
        let r = Self.filterRatingReadouts(self, rating: .co2)
        if r.count != 1 { fatalError() }
        return Int(r.report[0], radix: 2)!
    }

    var lifeSupportRating: Int {
        oxygenGeneratorRating * co2ScrubberRating
    }

    var columnCount: Int {
        report.first!.count
    }

    var columns: [String] {
        (0..<columnCount).map { column($0) }
    }

    func column(_ index: Int) -> String {
        report.reduce(into: "") { $0 += $1.at(index) }
    }

    static func filterRatingReadouts(_ diagnostic: BinaryDiagnostic, rating: RatingType = .oxygen, column: Int = 0) -> BinaryDiagnostic {
        let col = diagnostic.column(column)

        let filterBy: String
        if col.tiedFrequencies {
            filterBy = rating == .oxygen ? "1" : "0"
        } else {
            filterBy = String(rating == .oxygen ? col.mostCommon! : col.leastCommon!)
        }

        let bd = BinaryDiagnostic(report: diagnostic.report.filter { $0.at(column) == filterBy })
        return bd.count == 1 ? bd : filterRatingReadouts(bd, rating: rating, column: column + 1)
    }
}

extension Sequence where Self.Iterator.Element: Hashable {
    var frequencies: [Element: Int] {
        var f: [Element: Int] = [:]
        for element in self {
            f[element] = (f[element] ?? 0) + 1
        }
        return f
    }

    var tiedFrequencies: Bool {
        let f = frequencies.sorted { $0.1 > $1.1 }
        if f.count > 1 {
            return f[0].value == f[1].value
        }
        return false
    }

    var mostCommon: Element? {
        frequencies.sorted { $0.1 > $1.1 }.first?.key
    }

    var leastCommon: Element? {
        frequencies.sorted { $0.1 < $1.1 }.first?.key
    }
}

extension String {
    func at(_ position: Int) -> String {
        if position < count {
            return String(self[index(startIndex, offsetBy: position)])
        }
        return ""
    }
}
