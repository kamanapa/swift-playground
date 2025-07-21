//: [Previous](@previous)

import Foundation

// ----------------------------------------------------------------------

// stored properties
struct FixedLengthRange {
    var firstValue: Int    // variable stored property
    let length: Int    // const stored property
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// the range represents integer values 0, 1, and 2
rangeOfThreeItems.firstValue = 6
// the range now represents integer values 6, 7, and 8

// ----------------------------------------------------------------------

// If you create an instance of a structure and assign that instance to a constant, you can’t
// modify the instance’s properties, even if they were declared as variable properties
// this is not true for ref types like classes

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// this range represents integer values 0, 1, 2, and 3
// rangeOfFourItems.firstValue = 6
// this will report an error, even though firstValue is a variable property

// ----------------------------------------------------------------------
// Lazy stored properties

// initialized lazily ,i.e., only after the property is actually required
// and not at the time of instantiation. useful when an instance creation has an overhead
// and is not actually required otherwise

class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a nontrivial amount of time to initialize.
    */
    var filename = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter() // not thread-safe
    var data: [String] = []
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property hasn't yet been created

print(manager.importer.filename)
// the DataImporter instance for the importer property has now been created
// Prints "data.txt"

// ----------------------------------------------------------------------
// Computed Properties

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            Point(x: origin.x + size.width/2, y: origin.y + size.height/2) // implicit return
        }
        
        set (newCenter) {
            origin.x = newCenter.x - size.width/2
            origin.y = newCenter.y - size.height/2
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
// initialSquareCenter is at (5.0, 5.0)
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

// ----------------------------------------------------------------------

// shothand setter
// default name is newValue

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2) // newValue is the default name
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// ----------------------------------------------------------------------

// A computed property with a getter but no setter is known as a read-only computed property.
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        get{
            width * height * depth
        }
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
// Prints "the volume of fourByFiveByTwo is 40.0


// get is optional for read-only properties
struct CuboidAlt {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        width * height * depth
    }
}

// property observer:
// You have the option to define either or both of these observers on a property:
// willSet is called just before the value is stored.
// didSet is called immediately after the new value is stored.
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps


