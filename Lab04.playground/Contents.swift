import Foundation
//Lab exercise 4
//Functions
//Exercise 1
//Write a function named printHelloWorld that takes no arguments and returns nothing. It should
//print "Hello, World!".

func printHelloWorld() {
    print("Hello, World!")
}

printHelloWorld()

//
//Exercise 2
//Write a function greet that takes the name of a person (e.g. "Donald Trump") as input and prints a
//greeting to that person (e.g. "Hello, Donald Trump!").

func greet(name: String) {
    print("Hello, \(name)!")
}

greet(name: "Donald Trump")


//Exercise 3
//Write a function greeting that takes the name of a person (e.g. "Donald Trump") as input and
//returns a greeting string (e.g. "Hello, Donald Trump!") that can be printed.

func greeting(name: String) -> String {
    return "Hello, \(name)!"
}

let message = greeting(name: "Donald Trump")
print(message)

//Exercise 4
//Write a function greet that takes the first name and last name of a person (e.g. "Donald" and
//"Trump") as two separate input parameters and prints a greeting to that person (e.g. "Hello, Donald
//Trump!").

func greet(firstName: String, lastName: String) {
    print("Hello, \(firstName) \(lastName)!")
}

// Kullanımı:
greet(firstName: "Donald", lastName: "Trump")


//Exercise 5
//Write a function split(name: String) that takes a name (e.g. "Donald Trump") as input and returns
//the first and the last name separated into a tuple with two elements. To split a string into an array
//with " " as separator, you can use the following:
//let name =
//"Donald Trump"
//let names: [String] = name.components(separatedBy: " ")
//The function should be able to handle the following cases without crashing:
//split(name: "Donald Trump")
//split(name: "Batman")
//split(name: "")
//split(name: "Dwayne \"The Rock\" Johnson")

func split(name: String) -> (String, String) {
    let names: [String] = name.components(separatedBy: " ")
    
    if names.isEmpty || name.isEmpty {
        return ("", "")
    }
    
    if names.count == 1 {
        return (names[0], "")
    }
    
    let firstName = names[0]
    let lastName = names[1..<names.count].joined(separator: " ")
    
    return (firstName, lastName)
}

let result1 = split(name: "Donald Trump")
print(result1)

let result2 = split(name: "Batman")
print(result2)

let result3 = split(name: "")
print(result3)

let result4 = split(name: "Dwayne \"The Rock\" Johnson")
print(result4)

//Exercise 6
//Write a function square that takes an Int as input, but doesn't require a label at the call site,
//i.e. square(3) should work. It should return the square of the input value.

func square(_ number: Int) -> Int {
    return number * number
}

let result = square(3)
print(result)

let result2_ = square(5)
print(result2_)

//Exercise 7
//Write a function whoAmI that takes a name as input parameter. If the name is "Bruce Wayne", the
//function should return "I am Batman", otherwise return "I am not Batman". The input parameter
//should have a default value of "Bruce Wayne".

func whoAmI(name: String = "Bruce Wayne") -> String {
    if name == "Bruce Wayne" {
        return "I am Batman"
    } else {
        return "I am not Batman"
    }
}

print(whoAmI())
print(whoAmI(name: "Bruce Wayne"))
print(whoAmI(name: "Clark Kent"))

//Exercise 8
//Write a function sum that takes a variable number of integers as input and returns the sum of the
//numbers.

func sum(_ numbers: Int...) -> Int {
    var total = 0
    
    for number in numbers {
        total += number
    }
    
    return total
}

print(sum(1, 2, 3))
print(sum(10, 20, 30, 40))
print(sum(5))
print(sum())


func sum2(_ numbers: Int...) -> Int {
    return numbers.reduce(0, +)
}
