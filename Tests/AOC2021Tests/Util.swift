import Foundation

enum TestError: Error {
    case fileNotFound
}

struct PuzzleInput {
    static func getInput(name: String) throws -> String {
        guard let url = Bundle.module.url(forResource: name, withExtension: "txt") else {
            throw TestError.fileNotFound
        }
        return try String(contentsOf: url)
    }

    static func getStrings(name: String) throws -> [String] {
        return try getInput(name: name).components(separatedBy: "\n").compactMap { $0.count > 0 ? $0 : nil }
    }
    
    static func getInts(name: String) throws -> [Int] {
        return try getStrings(name: name).compactMap { Int($0) }
    }
}
