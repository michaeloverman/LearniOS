import UIKit

var str = "Hello, playground"
str = "Hello, Swift"
let constStr = str

var nextYear: Int
var bodyTemp: Float
var hasPet: Bool

let emptyString = String()
emptyString.isEmpty
let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()

let defaultNumber = Int()
let defaultBool = Bool()

let number = 42
let meaningOfLife = String(number)

let availableRooms = Set([205, 411, 412])

var countingUp = ["one", "two"]
countingUp.count
countingUp.append("three")

var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 3.4
reading3 = 5.5
//let averageReading = (reading1! + reading2! + reading3!) / 3
if let r1 = reading1,
    let r2 = reading2,
    let r3 = reading3 {
        let avgReading = (r1 + r2 + r3) / 3
} else {
    let errorString = "Instrument reported a reading of nil"
}

let nameByParkingSpace = [13: "Alice", 27: "Bob"]
//let space13Assignee: String? = nameByParkingSpace[13];
if let space13Assignee = nameByParkingSpace[13] {
    print("Key 13 is assigned in the dict")
}
let space42Assignee: String? = nameByParkingSpace[42];

let range = 0..<countingUp.count
for i in range {
    print(countingUp[i])
}

for string in countingUp {
    print(string)
}

for (space, name) in nameByParkingSpace {
    print("Space \(space): \(name)")
}

enum PieType: Int {
    case apple = 0
    case cherry
    case pecan
}
let favoritePie = PieType.apple
let name: String
switch favoritePie {
case .apple:
    name = "Apple"
case .cherry:
    name = "Cherry"
case .pecan:
    name = "Pecan"
default:
    <#code#>
}
