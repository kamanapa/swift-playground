//: [Previous](@previous)

import Foundation

// ----------------------------------------------------------------------

// Instance methods are functions that belong to instances of a class, structure, or enumeration.

struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

// ----------------------------------------------------------------------


// Structures and enumerations are value types. By default, the properties of a value type can’t
// be modified from within its instance methods.

struct PointAlt {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

// ----------------------------------------------------------------------


// Assigning self to an entirely different object from within a mutating method

struct PointAlt1 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = PointAlt1(x: x + deltaX, y: y + deltaY)
    }
}

// This example defines an enumeration for a three-state switch. The switch cycles between three
// different power states (off, low and high) every time its next() method is called
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

// ----------------------------------------------------------------------


// Type or "static" methods
class SomeClass {
    // use class in place of static to make it overridable from a subclass
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()

struct LevelTracker {
    nonisolated(unsafe) static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}



// ----------------------------------------------------------------------

// subscripts for classes, structs, enumerations

// syntax
/**
 subscript(index: Int) -> Int {
     get {
         // Return an appropriate subscript value here.
     }
     set(newValue) {
         // Perform a suitable setting action here.
     }
 }
 */

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        get {
            multiplier * index
        }
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
// Prints "six times three is 18


struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

var matrix = Matrix(rows: 2, columns: 2)

// to define a subscript function on a type use the static or class keyword
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)
