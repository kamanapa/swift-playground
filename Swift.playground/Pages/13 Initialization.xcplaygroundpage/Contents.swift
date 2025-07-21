//: [Previous](@previous)

import Foundation

// Stored properties can’t be left in an indeterminate state
// Initializers are called to create a new instance of a
// particular type

// You can assign a value to a constant property at any point during initialization, as long as
// it’s set to a definite value by the time initialization finishes.

struct Fahrenheit {
    let temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// Prints "The default temperature is 32.0° Fahrenheit

// alternative
struct FahrenheitAlt {
    var temperature = 32.0
}

// multiple initializers to initialize instances in different ways
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0”

// argument labels and parameter names work the same way inside init blocks
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
// let veryGreen = Color(0.0, 1.0, 0.0)
// this reports a compile-time error - argument labels are required
