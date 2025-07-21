//: [Previous](@previous)

import Foundation


// ----------------------------------------------------------------------
// Arrays
var someInts: [Int] = []
someInts.append(3)

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)

// array padded with default values
var row = Array(repeating: 0, count: 4)
var appendedArray = someInts + row

// literal arrays
var cart = ["eggs", "fish"]
cart += ["baking powder"]
cart += ["flour", "chocolate spread", "butter"]

cart[0] = "half a dozen eggs"

cart.insert("Maple Syrup", at: 1)

cart.remove(at: 3)

for (index, item) in cart.enumerated() {
    print("index: \(index+1), item: \(item)")
}

print(cart)

for item in cart {
    print(item)
}

cart.removeLast()

print(cart)

// ----------------------------------------------------------------------
// Sets

var breakfast: Set<String> = ["eggs", "milk", "butter", "bacon"]
breakfast.insert("hashbrowns")
breakfast.remove("milk")

for item in breakfast {
    print("\(item)")
}

// Set operations
let oddDigits: Set = [1, 3, 5, 7, 9]

let evenDigits: Set = [0, 2, 4, 6, 8]

let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted() // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

oddDigits.intersection(evenDigits).sorted() // []

oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // [1, 9]

oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()// [1, 2, 9]


// Set memberships
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals) // true

farmAnimals.isSuperset(of: houseAnimals) // true

farmAnimals.isDisjoint(with: cityAnimals) // true

// ----------------------------------------------------------------------
// Dictionaries

var namesOfIntegers: [Int: String] = [:]
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:] // empty again

// dictionary literal
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("The airports dictionary contains \(airports.count) items.")

// use "subscript" notation to access or change the value at key
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

// subscripting a map returns an optional which can be unwrapped in the usual way.
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}

// the same is true for the updateValue func
// this method returns an optional value of the dictionary’s value type
// which can be unwrapped as before.
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

// removing a key-value pair is simillar
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}

// in subscript notation
airports["APL"] = nil

// iterating over a map is simillar to iterating over a list/array
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// retrieve an iterable collection of a dictionary’s keys
// or values by accessing its keys and values properties
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
