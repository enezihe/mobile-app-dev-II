import UIKit

var temperature : Double = 24.5
temperature = 19.0
print("Q1: temperature" , temperature)


let seconsInHour: Int = 3600
// seconsInHour = 4000

var age: Int = 25
var year = 2026

let numberOfWheels: Int
numberOfWheels = 4

let π = 3.141592653589793
let pi = Double.pi

var 🤓 = "smart"; var 😀 = "happy";

var temperature_ = 22.5
print(temperature)

let city = "Toronto"
let temp = 18

print(city, temp)

// Q8 max value for int 2¹⁶ = 65,536

print("Int16 min:", Int16.min)
print("Int16 max:", Int16.max)

// Q9

// Pi is of type Double.If an expression contains a floating-point value, the result becomes a floating-point type.
let pi_ = 3 + 0.141592654

//Exercise 1.10
//What happens if you try the following code? Why?
//let myNumber: UInt = -17
//Negative integer '-17' overflows when stored into unsigned type 'UInt'.It can store only zero and positive numbers

                    
//                    
//Exercise 1.11
//What happens if you try the following code? Why?
//let bigNumber: Int16 = 32767 + 1
// get a compile-time error, 32767 is already max value.

let bigNumber: Int16 = Int16.max &+ 1
print(bigNumber)


//Exercise 1.12

//Why does the following code not work? What do you need to add to it to make it work, if we
//absolutely want to store this value as an integer, i.e. 3, but we don't want to change the type of the
//variables?
//let pi = 3.141592654
//let approximatePi: Int = pi

let pi__ = 3.141592654
let approximatePi: Int = Int(pi__)

//The code does not work because Swift does not allow implicit conversion from Double to Int, as it would cause loss of precision. To make it work while keeping the same variable types, you must explicitly convert the value using Int(pi).



//Exercise 1.13 EXTRA CREDIT
//The following code will print true, which means that valueA and valueB are equal. Why are they
//equal? (The << is the bitshift left operator.)
//let valueA: Int16 = -0x8000
//let valueB: Int16 = 0x4000 << 1
//print(valueA == valueB)
//Comments

//valueA = -32768
//binary = 1000 0000 0000 0000
//valueB = -32768
//binary = 1000 0000 0000 0000

//In two’s complement systems, the minimum negative value has no positive counterpart.





//Exercise 1.14
//There are two types of comments. Single-line and multiline comments. Write one of both.


//Exercise 1.15
//In Swift multiline comments can be nested. Write a nested multiline comment.
//Semicolons
//This is not really an exercise, but try to avoid using semicolons. If you have to use a semicolon, you
//are probably doing something wrong. :-) It's generally preferred code style to write each statement
//on its own line.
//Tuples

/* multiline comments
  /*
   inner comment
   */
*/




//Exercise 1.16
//Assign a tuple with two values in it to a constant named player. The values could represent the
//number of a hockey player and the name of the hockey player. For example, Igor Larionov whose
//number used to be 8.
let player = (number: 8, name: "Igor Larionov")






//Exercise 1.17
//OK, now you have a player tuple. Decompose (i.e. split) the number and the name into two
//constants named numberand name. This could be done in at least three ways. Try all three.


let number = player.number
let name = player.name

let (number_, name_) = player

let numbeR = player.0
let namE = player.1








//Optionals
//Exercise 1.18
//Can a constant have an optional type? If you're not sure, try it and see what happens.

let value: Int? = 17
let value_: Int?


//Exercise 1.19
//Why doesn't this work? What needs to be added to value on the second line for this to work?
//let value: Int? = 17
//let banana: Int = value

if let unwrapped = value {
    let banana: Int = unwrapped
}
//This code does not work because value is an optional (Int?) that may be nil, and Swift does not allow assigning a potentially nil value directly to a non-optional Int unless it is first unwrapped.


//Exercise 1.20
//If value in the previous exercise had been nil, what would have happened if you force
//unwrapped value?
//let value: Int? = nil
//let banana: Int = value!

let banana: Int = value ?? 0


//If value is nil and you force-unwrap it using value!, the app will crash at runtime because Swift tries to access a value that does not exis


//Exercise 1.21
//What would be a better way to assign value to the banana constant?
//
//A better way to assign value to the banana constant is to safely unwrap the optional using optional binding or the nil-coalescing operator instead of force unwrapping.
//
//

if let banana = value {
    // use banana safely
}




