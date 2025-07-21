//: [Previous](@previous)

import Foundation

// ----------------------------------------------------------------------
// basic operators are no different
// except there're no C-style ++, --

var partialSum = 0
partialSum += 1

// ----------------------------------------------------------------------
// Ternary operator
var num = 432
let even = (num%2 == 0) ? "even": "false"

// ----------------------------------------------------------------------
// Nil-coalescing operator
// if nil, evaluate to a defined value else implicitly unwrap the optional

let defaultColor: String = "red"
var userDefinedColor: String?

var color = userDefinedColor ?? defaultColor // userDefinedColor!=nil ? userDefinedColor!: defaultColor

// ----------------------------------------------------------------------
// Closed range operator ...

for index in 1...5 {  // 1<=x<=5
    print(index)
}

let names = ["Anna", "Alex", "Brian", "Jack"] // index starts at zero; ends at (names.count - 1)
let count = names.count

// Half open range
for i in 0..<count { // 0<=x<count
    print("Person \(i+1) is called\(names[i])")
}

// One sided ranges
for name in names[2...] {   // 2<=x<=3
    print(name) // Brian, Jack
}

for name in names[...2] {   // 0<=x<=2
    print(name) // Anna, Alex, Brian
}

for name in names[..<2] {   // 0<=x<2
    print(name) // Anna, Alex
}

let range = ...5 // x<=5
range.contains(-1) // true
