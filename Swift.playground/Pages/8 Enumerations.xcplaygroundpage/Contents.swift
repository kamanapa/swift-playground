//: [Previous](@previous)

import Foundation


// An enumeration defines a common type for a group of related values and enables you
// work with those values in a type-safe way within your code.

enum Compass {
    case north
    case south
    case east
    case west
}

// or more conveniently on one line as
enum Graha {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// type is inferred here
var directionToHead = Compass.west

//
var bearing: Compass = .north

// Matching with a Switch case

directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}
// Prints "Watch out for penguins

// Iterating over Enumeration cases
// enum must implement the CaseIterable protocol
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

print("\(Beverage.allCases.count) beverages available.")
for beverage in Beverage.allCases {
    print(beverage)
}

// associated type for Enum cases
// upc and qrCode are the cases and (Int, Int, Int, Int) amd (String) their
// associated values resp.
enum Barcode {
    case upc (Int, Int, Int, Int)
    case qrCode (String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
    case .qrCode(let productCode):
        print("QR code: \(productCode).")
}

// or

switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP.


// Raw Values
// Raw values are not the same as associated values. Raw values are set to prepopulated values
// when you first define the enumeration in your code

enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// implicit raw values "north", "south", "east", "west"
enum CompassPoint: String {
    case north, south, east, west
}

let earthsOrder = Planet.earth.rawValue
// earthsOrder is 3

let sunsetDirection = CompassPoint.west.rawValue
// sunsetDirection is "west"

// Initializing from a raw value
let possiblePlanet = Planet(rawValue: 7)
// possiblePlanet is of type Planet? and equals Planet.uranus
