//Lab Exercise 2
//Basic Operators
//Assignment Operator
//We have already used the assignment operator for simple values.
//var value = 17
//value = 1337
//Exercise 2.1
//What would happen if you used the assignment operator in the following way? (This is mainly an
//exercise for Objective-C coders.)
//var value = 17
//if value = 19 {
// print("Whatever and stuff.")
//}
//  = is assignment, not a boolean expression. So this will not compile.

//Arithmetic Operators
//Everyone knows how these work. They're basically the same as in other lanugages.
//+, -, *, -
var value = 17
if value == 19 {
    print("Whatever and stuff.")
}



//Exercise 2.2
//Use all the arithmetic operators in a single statement and assign the result to a constant.

let result = (10 + 5) * 2 - 6 / 3
print(result) // (15*2) - 2 = 28


//Exercise 2.3
//Append the string "Larionov" to the end of the string "Igor " and assign the resulting string to a
//constant.
let first = "Igor "
let fullName = first + "Larionov"
print(fullName) // Igor Larionov




//Exercise 2.4
//What happens if you try the unary increment operator (e.g. value++) from other C-like languages?
//var value = 0
//value++  *** not compile

var value1 = 0
value1 += 1
// or
value1 = value1 + 1



//Exercise 2.5
//How do you check if two strings are equal in Swift?
// need to use ==

let a = "Hello"
let b = "Hello"
print(a == b)

//Exercise 2.6
//Let's compare some tuples. Guess if these are true or false:
//(1, "zebra") < (2, "apple")
//(2, "zebra") < (1, "apple")
//(3, "apple") < (3, "bird")
//(4, "dog") == (4, "dog")
//(4, "dog") == (4, "cat")
//Ternary Conditional Operator

print((1, "zebra") < (2, "apple"))  // true
print((2, "zebra") < (1, "apple"))  // false
print((3, "apple") < (3, "bird"))   // true
print((4, "dog") == (4, "dog"))     // true
print((4, "dog") == (4, "cat"))     // false



//Exercise 2.7
//Use the ternary conditional operator to assign the correct number of days in a year to the
//constant daysInYeardepending on the value of leapYear.
//var leapYear = true
//Nil-Coalescing Operator
//Coalescing is not the easiest word to spell. You could think of it as the default operator, I guess.

var leapYear = true
let daysInYear = leapYear ? 366 : 365
print(daysInYear)



//Exercise 2.8
//Use the nil-coalescing operator ?? to provide a fallback value if a value for the optional
//variable name has not been provided.
//// The first name is optional in this example.
//var firstName: String? = nil
//// The last name is however not optional.
//var lastName: String = "Jones"
//// Use ?? operator here to provide a fallback value,
//// if no first name has been provided.
//// For example, the default value could be "Dr.",
//// because this code is to be used at a medical conference.
//var name: String = firstName
//name += " " + lastName
//print(name)
//Range Operators

var firstName: String? = nil
var lastName: String = "Jones"

let fallbackFirstName = firstName ?? "Dr."
var name = fallbackFirstName
name += " " + lastName
print(name) // Dr. Jones


//Exercise 2.9: Closed Range Operator
//Define a closed range, e.g. for an amplifier volume knob that goes from 0 to 11. The range should
//include both 0 and 11, because this amplifier really does go to 11.

let volumeClosedRange = 0...11
print(volumeClosedRange.contains(11))


//Exercise 2.10: Open Range Operator
//Define an open range, e.g. for an amplifier volume knob that goes from 0 to 10. The range should
//include both 0 and 10, but not 11.

let volumeOpenRange = 0..<11
print(volumeOpenRange.contains(10))
print(volumeOpenRange.contains(11))




//Strings and Characters
//Exercise 2.11
//Create the string "Detroit Red Wings" from the following variables/constants and assign it to the
//constant hockeyTeam:
//let city: String = "Detroit"
//var color = "Red"
//let wings = "Wings"
//First do it using concatenation and then again using interpolation.

let city: String = "Detroit"
var color = "Red"
let wings = "Wings"

let hockeyTeam1 = city + " " + color + " " + wings
print(hockeyTeam1)

let hockeyTeam2 = "\(city) \(color) \(wings)"
print(hockeyTeam2)




//Exercise 2.12
//Assign the length of the string "4, 8, 15, 16, 23, 42" to the variable length.

let text = "4, 8, 15, 16, 23, 42"
var length = text.count
print(length)


//Exercise 2.13
//The book states that you can modify/mutate a string by making it a variable and not a constant, as
//follows:
//var variableString = "Detroit"
//variableString += " Red Wings"
//How does this work with regards to strings being value types?

var variableString = "Detroit"
variableString += " Red Wings"


var a1 = "Detroit"
var b1 = a1         // b shares storage initially
a1 += " Red Wings"  //a gets its own copy before change
print(a) // Detroit Red Wings
print(b) // Detroit

