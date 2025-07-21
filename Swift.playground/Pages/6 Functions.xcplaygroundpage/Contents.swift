//: [Previous](@previous)

import Foundation


// ----------------------------------------------------------------------
// function defn == parameters + return values
func greet(name person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
print(greet(name: "ABC"))

// ----------------------------------------------------------------------
// returning mutiple values using tuples
// be aware of nil arrays
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// unwrap the optional return type
if let bounds = minMax(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(bounds.min) and max is \(bounds.max)")
    // Prints "min is -6 and max is 109
}

// ----------------------------------------------------------------------
// when the body of the function is a single expression
// the keyword return is optional
func greeting(name person: String) {
    "Hello" + person
}

print(greeting(name: "MAX"))

// ----------------------------------------------------------------------
// parameter value used in the body of the function
// argument label = expressiveness
// argument label is typically omitted
func examplefunc(part numerator: Int, whole denominator: Int) -> Double {
    Double(numerator)*100.0/Double(denominator)
}

// explicitly omitting argument label
func examplefunc2(_ numerator: Int, _ denominator: Int) -> Double {
    Double(numerator)*100/Double(denominator)
}

// default parameter values
func examplefunc3(_ numerator: Int, _ denominator: Int = 100) -> Double {
    Double(numerator)*100/Double(denominator)
}

print(examplefunc(part: 1, whole: 5)) // prints 20
print(examplefunc2(1,5)) // same
print(examplefunc3(100)) // 1

// ----------------------------------------------------------------------
// variadic parameters accept 0 or more values of the specified type
func arithmeticMean(_ numbers: Double...) -> Double? {
    var total: Double = 0
    if numbers.count == 0 { return nil }
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

if let mean = arithmeticMean() {
    
} else {
    print("doh!")
}
if let mean = arithmeticMean(1, 2, 3, 4, 5) {
    // returns 3.0, which is the arithmetic mean of these five numbers
    print(mean)
}
if let mean = arithmeticMean(3, 8.25, 18.75) {
    // returns 10.0, which is the arithmetic mean of these three numbers
    print(mean)
}

// ----------------------------------------------------------------------
// inout parameters
// function parameters are constants by default
// changes to inout parameters persist long after
// the function has exited execution
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
// obviously, can only pass vars, not constants.
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// ----------------------------------------------------------------------
// Function Types = parameter + return type
// both functions have the type (Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
print(mathFunction(1,2))
var mathFunction2: (Int, Int) -> Int = multiplyTwoInts
print(mathFunction(1,2))

// Function types as parameters
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)
// Prints "Result: 8"

// Function Types as return types
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    var step : (Int) -> Int = stepForward
    if backward {
        step = stepBackward
    }
    return step
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


// Nested functions are hidden inside the scope of the enclosing function
// but their utility lies in the fact that they can be returned
// and called from within another function's scope
func hello() {
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        func stepForward(input: Int) -> Int { return input + 1 }
        func stepBackward(input: Int) -> Int { return input - 1 }
        return backward ? stepBackward : stepForward
    }
    var currentValue = -4
    let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
    // moveNearerToZero now refers to the nested stepForward() function
    while currentValue != 0 {
        print("\(currentValue)... ")
        currentValue = moveNearerToZero(currentValue)
    }
    print("zero!")
    // -4...
    // -3...
    // -2...
    // -1...
    // zero!
}


































































































































































