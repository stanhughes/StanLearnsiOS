//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print("Hello Stan!")

// Simple Values

var myVar = 42
myVar = 10

let myLet = 20
//: myLet = 22 //  Connot assign to value 'myLet' is a 'let constant.

let implicitInteger = 70
let implicitDouble = 70.0  // 64-bit floating-point number
let explicitFloat: Float = 70 // 32-bit floating-point number.

//: Values never implicitly convert to another type

//: Inlcude non-string values in string with a backslash (\) before parentheses.
let apples = 3
let organges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + organges) pieces of fruit."

let lastMonth = 2000.0
let thisMonth = 2222.22

let moneyMade = "Money earn is \(lastMonth + thisMonth)"

let firstName = "Stan"
print ("Hi \(firstName)!")

//: Arrays and Dictionaries
let array = [1,2,3]
//: Note that the extra comma at the end is valid syntax.
let dictionary = ["1":1, "2":2, "3":3,]

//: Empty Array
let emptyArray = [Int]()
//:emptyArray.append(1) // Cannot use mutating member on immutalbe value.

//: Empty Dicitonary
let emptyDictionary = [String:Int]()
if emptyDictionary.isEmpty {
    print("Is empty.")
}
print ("\(emptyDictionary.isEmpty)")

//: Type information can be Inferred

var list = ["1", "2",]
var numberDictionary = ["1":1, "2":2,]

list = []
numberDictionary = [:]

//: Control Flow

//: 'if' and 'switch' Conditions
//: 'for-in', 'for', 'while' and 'repead-while' loops
var total = 0
for number in array {
//: Does this go away in Swift 2.3? Nope, it is ++<variable>
    total += number
}
print(total)
if total > 3 {
    print("\(total)>3")
} else {
    print("\(total)!>3")
}

//: Using 'if' and 'let' together with optionals.
var optionalString: String? = "Hello"
optionalString = "Hello again"
repeat {
    if let greet = optionalString {
        print ("\(greet) Stan!")
    }
    optionalString = nil
} while optionalString != nil

//: Nil Coalescing Operator
//: Provides a Default Value

while (optionalString == nil) {
    print ("Hi \(optionalString ?? "Stanley")!")
    optionalString = "Stan"
    print ("Hi \(optionalString ?? "Stanley")!")
}

//: Switch supports any kind of data.
//: Supports a wide variety of comparison operations.

let vegList = ["red pepper", "celery", "cucumber", "watercress", "bell pepperr",]
var resultList = [String]()
for veg in vegList {
//:let veg = "red pepper"
    switch (veg) {
    case "celery":
        print("Ants some raisins and make ants on a log.")
    case "cucumber", "watercress":
        print("Make a tea sandwitch.")
//: 'let' can be used in a pattern to assign the value that matched the pattern.
    case let x where x.hasSuffix("pepper"):
        print("Spicy \(x)?")
    default:
//: Removing the defualt will cause the following error:
//: Switch must be exhaustive.
        print("Make soup with \(veg)")
    }
}

let vegDictionary = [1:"red pepper", 2:"celery", 3:"cucumber", 4:"watercress", 5:"bell pepperr",]
var order = 0
var newDictionary = [Int:String]()
for vegElement in vegDictionary {
    print (vegElement)
    resultList.append(vegElement.1)
    order += 1
    newDictionary[order] = vegElement.1
    //break;
}

print ("resultList=\(resultList)")
print ("newDicitonary=\(newDictionary)")

resultList = [String]()
var veg: String
for myDex in 1...newDictionary.count {
    veg = newDictionary[myDex] ?? "nil"
    resultList.append("\(myDex):\(veg)")
}

print ("resultList=\(resultList)")

let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci":[1,1,2,3,5,8],
    "Square":[1,4,9,16,25],
]

var largest = 0
var kindOf:String? = nil
for (numKind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            kindOf = numKind
        }
    }
}

print("kind=\(kindOf):\(largest)")

resultList = [String]()

//: Omits Upper Value
for index in 1..<4 {
    resultList.append("\(index)")
}

print(resultList)

//: Includes lower and upper value.
resultList = [String]()
for index in 1...4 {
    resultList.append("\(index)")
}

print(resultList)

//: Functions and Closures

//: Minimal function
func myFunc() {
    print("myFunc=\(myFunc)")
}

myFunc()

//: Function returning a tuple.

//: func returnTuple() -> (first:Int, second:Int,) { // Expected type

//: Cannot have an extra comma in a tupel.
func returnTuple() -> (first:Int, second:Int) {
//:return (1,2,)
    return (1,2)
}

returnTuple
print("returnTuple=\(returnTuple)")
returnTuple()
print("returnTuple()=\(returnTuple())")
var myTuple = returnTuple()
//:print("myTuple.0=\(myTuple.0) myTuple.1=\(myTuple.1) myTuple.2=\(myTuple.2)") // Value of tuple type...has not member '2'


print("myTuple.0=\(myTuple.0) myTuple.1=\(myTuple.1)")

//: Variable number of arguments:
//: variadic parameter

func sumOf(numbers: Int...) -> Int {
    
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

sumOf()
sumOf(1,2,3,4)

func averageOf(numbers: Int...) -> Int? {
    var sum = 0
    var average: Int?
    //var count = numbers.count
    for number in numbers {
        sum += number
    }
    if numbers.count != 0 {
        average = sum/numbers.count
    } else {
        average = nil
    }
    
    return average
}

averageOf()
averageOf(1,2,3,4,5,6,7)

//: Functions can be nested.

func outer() {
    func nested() {
        print("I am a nested function.")
    }
    nested() // Commenting out the call means that 'nested' can never be called.
}

outer
outer()

// Functions are first-class types.

func returnFunc() -> (() -> Int) {
    func nested() -> Int {
        print("\(returnFunc):\(nested)")
        return 1
    }
    return nested
}

var passedFunc = returnFunc()

passedFunc()

//: What is wrong with this?
//: I don't really understand the problem or what I am saying with on ().
//: Perhaps the function is really defined in the context with '-> Void' being
//: declared.

//:func badFunc() -> (()) { // Unexpect non-void return value in void function
func badFunc() -> (() -> Void) {
    func nested() {
        badFunc
        nested // Why does this function look like thie '() -> ()'?
        print("\(badFunc):\(nested)")
        //return 1
    }
    return nested // Unexpected non-void return value in void function.
}

var myReturnedFunc = badFunc()

myReturnedFunc()

//: Function that takes a fuction as its argument.

//:takeFunc() // can I do this inside a app?

func takeFunc(function: () -> Void) {
    function()
}

func sendIn() {
    print("sendIn function")
    sendIn
}

takeFunc
takeFunc(sendIn)

//: Two ways to do a void return?

//:func takeFuncAnother(function: () -> () {}  // Expected ',' separator
//: Nope, it seems to thing that is another void function, not a void.

//: Within a function the order matters, unless it is delcared outside the function.
func testFuncOrder() {
    //beforeFuncFunc()  // Use of local variable before its declaration
    //func beforeFuncFunc() {}
    beforeFuncFunc
    beforeFuncFunc()
    //beforeLet // Use of local variable before its declaratioin.
    // let beforeLet = 0
    beforeLet  // Order of non-local variables doesn't seem to matter.
}

func beforeFuncFunc() {
    print("\(beforeFuncFunc)")
}

let beforeLet = 0

beforeFuncFunc
beforeFuncFunc()

testFuncOrder
testFuncOrder()

var i:Int = 0

for i in 1...3 { // This is the same as for 'var i'. The 'i' declared outside is not see inside the for loop
    print(i)
}
for var i in 1..<4 {
    print(i)
}

let j:Int

for j in 1...3 {
    print(i+j)
}

//:
//: Closures
//:

//: Functions are special cases of closures.

//: Closure: a clock of code that can be called later.
//:   Access to variables and function available in scope where closure was created.
//:
//: Can write a closure without name by enclosing it in braces.
//:
//:   Separate arguments and return type from body with the 'in' keyword.

func takeAFunc(function: () -> Void) {
    takeFunc
    function
    function()
    function()
}

takeAFunc;
takeAFunc({print("anonymous fuction 1")})
takeAFunc({() in print("anonymous function 2")})
takeAFunc({() -> Void in print("anonymous function 3")})

while true {break}

var numbers = [20, 19, 2, 12]

//: Writing closures concisely
//:
//:    Closure's type is known
//:
//: Single statmenet closures implicitly return the value of their only statement.

let mappedNumbers0 = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

print (mappedNumbers0)

//: Because it is only line, we can ommit return value.
let mappedNumbers = numbers.map({ number in 3 * number })

print(mappedNumbers)

//: Because the closure is the last argument, we can
//: drop the parentheses.
let mappedNumbers2 = numbers.map { number in 3 * number}

print(mappedNumbers2)

//: Because we reference the by number, we can drop the name.
let mappedNumbers3 = numbers.map { 3 * $0 }

print( mappedNumbers3 )
// numbers.sort(isOrderedBefore: (Int, Int) -> Bool )


//:
//: How small can I go?
//:
//: Making a closure more concise.
//:

func mySort(first: Int, second: Int) -> Bool {
    return first > second
}

var sortedNumbers = numbers.sort(mySort)

//: Some things that don't work
//:
//:sortedNumbers = numbers.sort {mySort} // error: Argument passed to call that takes no arguments
//: This is not code but a pointer to code.

//:sortedNumbers = numbers.sort mySort // error: function produces expected type '[Int]'; did you mean to call it with '()'?
//: sort doesn't know that a parameter is being passed

//: Declare the function with a closure.
//
//:Function declaration can now be dropped.
sortedNumbers = numbers.sort({
    (first: Int, second: Int) -> Bool in
    return first > second
})

// Closure is only argument to function.
// Drop parentesis.
sortedNumbers = numbers.sort{
    (first: Int, second: Int) -> Bool in
    return first > second
}

// Type in parameter is known, drop type declaration Int.
sortedNumbers = numbers.sort{
    (first, second)  in
    return first > second
}

// Single statement, drop 'return' keyword.
sortedNumbers = numbers.sort {
    first, second in
    first > second
}

// Reference parameters by number, drop names.
sortedNumbers = numbers.sort {
    $0 > $1
}

// All goes to one clean, nice and simple line.
sortedNumbers = numbers.sort { $0 > $1 }

sortedNumbers

