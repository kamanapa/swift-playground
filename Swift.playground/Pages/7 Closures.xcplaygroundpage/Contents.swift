//: [Previous](@previous)

import Foundation

// closures are nested functions that capture and store
// references to any constants and variables in their
// enclosing functions

/*
 { (parameters) -> return type in
     statements
 }
 */

// ----------------------------------------------------------------------
// function parameter with sorted method
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)

// closure with sorted method
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// type-inference from context
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })

// implicit returns
// as with functions, "expression bodies" can be returned implicitly
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

// shorthand argument names
reversedNames = names.sorted(by: { $0 > $1 } )

// operator methods
// String type defines it's own implementation of the > operator
// that takes two Strings as a parameter and returns a single Bool value
reversedNames = names.sorted(by: >)

// ----------------------------------------------------------------------
// Trailing closure syntax

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// one way to call someFunctionThatTakesAClosure
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

// or even simple when the closure is the only parameter
someFunctionThatTakesAClosure {
    // trailing closure's body goes here
}

reversedNames = names.sorted() { $0 > $1 }
// or
reversedNames = names.sorted { $0 > $1 }

// ----------------------------------------------------------------------
// .map:
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let numbers = [16, 58, 510]

// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]

let strings = numbers.map { (number) -> String in
    var number = number // params are const by default
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}


// ----------------------------------------------------------------------
// multiple trailing closures as arguments to a function
/*
 
 func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
 }
 
 loadPicture(from: Server) { picture in
    View.currentPicture = picture
 } onFailure: {
    print("Couldn't download the next picture.")
 }
 
 */

// Escaping closures : A closure is said to escape a function when the closure is passed as an
// argument to the function, but is called after the function returns
var completionHandlers: [() -> Void] = []
@MainActor func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
