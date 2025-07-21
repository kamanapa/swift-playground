import Foundation


// ----------------------------------------------------------------------
// variables and constants
// statically typed with type inference
var x = 0.0, y = 0.0, z = 0.0
var welcomeMsg: String
welcomeMsg = "Satomi Sartorial"
var red, green, blue: Double
let pi = 3.14159
let 😂 = "::laughcry::"

// ----------------------------------------------------------------------
// printing, string interpolation etc.

print(welcomeMsg)

var friendlyWelcome = "Hello"
var friend = "Robin"
print("\(friendlyWelcome), \(friend).")

// ----------------------------------------------------------------------
// type aliasing
var short: UInt8 = 0
let min8 = UInt8.min
typealias AudioSample = UInt8
var maxAmplitudeFound = AudioSample.max

// ----------------------------------------------------------------------
// booleans and if thens
var truth = 5 > 5 || 1 == 1
if truth {
    print("1==1.")
} else {
    print("nope")
}

// ---------------------------------------------------------------------
// Tuples
let http404Error = (404, "Resource Not Found.")
let http302Redirect = (302, "Http Redirect")

// unravelling a tuple
let (code, error) = http404Error
print("code: \(code), error: \(error)")

// ignore unwanted component
let (httpCode, _) = http302Redirect

// accessing individual elements of an n-dim tuple
typealias Point = (Int, Int, Int)
let north: Point = (0, 1, 0)
print("North (x:\(north.0), y:\(north.1), z:\(north.2))")

// named elements of a tuple
let http200Status = (statusCode: 200, description: "OK")
print("\(http200Status.statusCode): \(http200Status.description)")

// ----------------------------------------------------------------------
// Optionals
// optionals are tagged with ? after the type
// let num: Int = nil does not work

let num: Int? = nil

// forced unwrapping of an optional
if num != nil {
    
} else {
    
}

// shorthand
if let num {
    
} else {
    
}

// implicitly unwrapped optional
let possibleString: String? = "An optional"
let forcedString: String = possibleString!

// ----------------------------------------------------------------------
// Error handling

func canThrowAnError() throws {
    
}

// error propagates up the call chain until it is explicitly handled
do {
    try canThrowAnError()
    // no error
} catch {
    // an error was thrown
}















































