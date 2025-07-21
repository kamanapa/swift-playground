//: [Previous](@previous)

import Foundation

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// ----------------------------------------------------------------------

let someResolution = Resolution()
let someVideoMode = VideoMode()
print("The width of someResolution is \(someResolution.width)")
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is now 1280

// ----------------------------------------------------------------------

// structs, enums are value types;
// A value type is a type whose value is copied when it’s
// assigned to a variable or constant, or when it’s passed to a
// function.

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd // a full-fledged copy is made
print("cinema is now \(cinema.width) pixels wide")
// Prints "cinema is now 2048 pixels wide"

print("hd is still \(hd.width) pixels wide")
// Prints "hd is still 1920 pixels wide

// ----------------------------------------------------------------------
// classes are ref types
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

// no copies of class-instances are ever made
// only references are copied so essentially
// an instance may have many variables pointing to it.
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Prints "The frameRate property of tenEighty is now 30.0
