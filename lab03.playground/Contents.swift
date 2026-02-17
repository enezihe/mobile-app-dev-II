

// Lab Exercise 3
// Collection Types
// Array


// Exercise 3.1
// Create an empty array with values of type Int and assign it to a variable in as many ways as you can
// think of (there's at least 4 ways).

var a1: [Int] = []
var a2: Array<Int> = []
var a3 = [Int]()
var a4 = Array<Int>()

print(a1, a2, a3, a4)


// Exercise 3.2
// Create an array containing the integer values 4, 8, 15, 16, 23, and 42. There are at least 4 ways to
// do this, as well.

let aa1 = [4, 8, 15, 16, 23, 42]
let aa2: [Int] = [4, 8, 15, 16, 23, 42]
let aa3: Array<Int> = [4, 8, 15, 16, 23, 42]
var aa4 = [Int]()
aa4.append(contentsOf: [4, 8, 15, 16, 23, 42])

print (aa1,aa2,aa3,aa4)



// Exercise 3.3
// Create an array that cannot be modified containing the integer values 4, 8, 15, 16, 23, and 42.
let immutableNumbers = [4, 8, 15, 16, 23, 42]
// let makes the array reference immutable/ no append/replace/remove.

// Exercise 3.4
// Add the values 1138, 1337, and 4711 to the end of the following array:
// var stuff = [4, 8, 15, 16, 23, 42]
var stuff = [4, 8, 15, 16, 23, 42]
stuff.append(1138)
stuff.append(1337)
stuff.append(4711)

print(stuff)


// Exercise 3.5
// Replace the value 15 with the value 17 in the following array:
// var numbers = [4, 8, 15, 16, 23, 42]

var numbers = [4, 8, 15, 16, 23, 42]
numbers[2] = 17
print(numbers)


// Exercise 3.6
// Replace the values 15, 16, and 23 with the values 1, 2, 3, 4, and 5 in the following array:
// var numbers = [4, 8, 15, 16, 23, 42]

var numbers2 = [4, 8, 15, 16, 23, 42]
numbers2[2...4] = [1, 2, 3, 4, 5]
print(numbers2)


// Exercise 3.7
// Create an array containing 10 sheep "🐑" strings. Then print the length of the array.

let sheep = Array(repeating: "🐑", count: 10)
print(sheep)
print("Length:", sheep.count)



// Exercise 3.8
// Write at least one variant of removing the last element in an array, where you don't know the length.

var unknown = [10, 20, 30]

// 1: safe check
if !unknown.isEmpty {
    let removed = unknown.removeLast()
    print("Removed:", removed)
} else {
    print("Array is empty; nothing to remove.")
}

// 2: popLast() returns optional (safest one-liner)
let removed2 = unknown.popLast()
print("Removed with popLast:", removed2 as Any)
print("Now array:", unknown)


// Set


// Exercise 3.9
// Given the following sets:
// let houseAnimals: Set = ["🐶", "🐱"]
// let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
// let cityAnimals: Set = ["🐦", "🐭"]
// Use set operations to...
// 1. ...determine whether the set of house animals is a subset of farm animals.
// 2. ...determine whether the set of farm animals is a superset of house animals.
// 3. ...determine if the set of farm animals is disjoint with city animals.
// 4. ...create a set that only contains farm animals that are not also house animals.
// 5. ...create a set that contains all the animals from all sets.

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

// 1) houseAnimals subset of farmAnimals?
let isSubset = houseAnimals.isSubset(of: farmAnimals)
print("1) Subset:", isSubset)

// 2) farmAnimals superset of houseAnimals?
let isSuperset = farmAnimals.isSuperset(of: houseAnimals)
print("2) Superset:", isSuperset)

// 3) farmAnimals disjoint with cityAnimals?
let isDisjoint = farmAnimals.isDisjoint(with: cityAnimals)
print("3) Disjoint:", isDisjoint)

// 4) farm animals not also house animals (difference)
let onlyFarm = farmAnimals.subtracting(houseAnimals)
print("4) Only farm:", onlyFarm)

// 5) set that contains all animals (union)
let allAnimals = houseAnimals.union(farmAnimals).union(cityAnimals)
print("5) All animals:", allAnimals)


// Dictionary
// Exercise 3.10
// Create an empty dictionary with keys of type String and values of type Int and assign it to a variable
// in as many ways as you can think of (there's at least 4 ways).

// 1) Type annotation + literal
var d1: [String: Int] = [:]

// 2) Generic Dictionary type
var d2: Dictionary<String, Int> = [:]

// 3) Initializer with inferred type from annotation
var d3 = [String: Int]()

// 4) Dictionary initializer
var d4 = Dictionary<String, Int>()

print(d1, d2, d3, d4)



// Exercise 3.11
// Create a mutable dictionary named secretIdentities where the key value pairs are "Hulk" ->
// "Bruce Banner", "Batman" -> "Bruce Wayne", and "Superman" -> "Clark Kent".

var secretIdentities: [String: String] = [
    "Hulk": "Bruce Banner",
    "Batman": "Bruce Wayne",
    "Superman": "Clark Kent"
]

print(secretIdentities)




// Exercise 3.12
// Given the dictionary from exercise 4.10, print the secret identity of Batman. Spoiler: It's Bruce
// Wayne.

if let batmanIdentity = secretIdentities["Batman"] {
    print("Batman is:", batmanIdentity)
} else {
    print("No identity found for Batman.")
}



// Exercise 3.13
// Given the dictionary from exercise 4.10, replace the secret identity of the Hulk with "David Banner",
// which was the Hulk's civilian name on the TV show for some reason. I guess they were not fans of
// alliteration, but I digress.

secretIdentities["Hulk"] = "David Banner"
print("Updated Hulk:", secretIdentities["Hulk"] as Any)


// Exercise 3.14
// Given the dictionary from exercise 4.10, iterate (with a for loop) over all the secret identities and print
// both the values and the keys.

for (hero, identity) in secretIdentities {
    print("\(hero) -> \(identity)")
}

