import XCTest
@testable import AOC2021

final class ArraySetAlgebraTests: XCTestCase {
    let setABC = Set("ABC")
    let setCDE = Set("CDE")
    let setEFG = Set("EFG")
    
    func testIntersection() throws {
        let ary0 = [Set<String.Element>]()
        let set0 = ary0.intersection()
        XCTAssertEqual(set0, Set(""))

        let ary1 = [setABC]
        let set1 = ary1.intersection()
        XCTAssertEqual(set1, Set("ABC"))
        
        let ary2 = [setABC, setCDE]
        let set2 = ary2.intersection()
        XCTAssertEqual(set2, Set("C"))

        let ary3 = [setABC, setCDE, setEFG]
        let set3 = ary3.intersection()
        XCTAssertEqual(set3, Set(""))
    }

    func testUnion() throws {
        let ary0 = [Set<String.Element>]()
        let set0 = ary0.union()
        XCTAssertEqual(set0, Set(""))

        let ary1 = [setABC]
        let set1 = ary1.union()
        XCTAssertEqual(set1, Set("ABC"))

        let ary2 = [setABC, setCDE]
        let set2 = ary2.union()
        XCTAssertEqual(set2, Set("ABCDE"))

        let ary3 = [setABC, setCDE, setEFG]
        let set3 = ary3.union()
        XCTAssertEqual(set3, Set("ABCDEFG"))
    }
}

final class MatrixTests: XCTestCase {
    let matrix = Matrix(rows: 3, columns: 3, sequence: [1,2,3, 4,5,6, 7,8,9])

    func testSequenceConstructor() throws {
        XCTAssertEqual(15, matrix.row(1)!.reduce(0, +))
        XCTAssertEqual(12, matrix.column(0)!.reduce(0, +))

        XCTAssertEqual(24, matrix.row(2)!.lazy.reduce(0, +))
        XCTAssertEqual(15, matrix.column(1)!.lazy.reduce(0, +))

        if let _ = matrix.row(3) { XCTFail("Row out of bounds") }
        if let _ = matrix.row(-1) { XCTFail("Row out of bounds") }

        if let _ = matrix.column(3) { XCTFail("Column out of bounds") }
        if let _ = matrix.column(-1) { XCTFail("Column out of bounds") }
    }
}
