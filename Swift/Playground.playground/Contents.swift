import UIKit

//var str = "Hello, playground"
//str += "!"
//print(str)

//var numberOfStopLights = "Four"
let numberOfStopLights: Int = 4
var population: Int
population = 5422
var hasPostOffice: Bool = false
let townName: String = "Knowhere"
let townDescription = "\(townName) has a population of \(population) and \(numberOfStopLights) stoplights."
print(townDescription)

var message: String
//if population < 10000 {
//    message = "\(population) is a small town."
//} else {
//    message = "\(population) is a large town."
//}
message = population < 10000 ? "\(population) is a small town." : "\(population) is a large town."
print(message)

if !hasPostOffice {
    print("where do we buy stamps.")
}

print("The maximum Int value: \(Int.max).")
print("The minimum Int value: \(Int.min).")
print("The maximum Int32 value: \(Int32.max).")
print("The minimum Int32 value: \(Int32.min).")
print("The maximum Int16 value: \(Int16.max).")
print("The minimum Int16 value: \(Int16.min).")
print("The maximum Int8 value: \(Int8.max).")
print("The minimum Int8 value: \(Int8.min).")
print("The maximum UInt32 value: \(UInt.max).")
print("The minimum UInt32 value: \(UInt.min).")
print("The maximum UInt32 value: \(UInt32.max).")
print("The minimum UInt32 value: \(UInt32.min).")

let numberOfPages: Int = 10
let numberOfChapters = 3
let numberOfPeople: UInt = 40
let volumeAdjustment: Int32 = -1000

print(11/3)
print(-11/3)
print(11%3)
print(-11%3)

let y: Int8 = 120
let z = y &+ 10

let a: Int16 = 200
let b: Int8 = 20
let c = a + Int16(b)

let d1 = 1.1 // Implicitly Double
let d2: Double = 1.1
let f1: Float = 100.3

print(10.0 + 11.4)
print(11.0 / 3.0)
print(12.4.truncatingRemainder(dividingBy: 5.5))

if d1 == d2 {
    print("d1 and d2 are the same!")
}

print("d1 + 0.1 is \(d1 + 0.1)")
if d1 + 0.1 == 1.2 {
    print("d1 + 0.1 is equal to 1.2")
}

let num: Int8 = -1
print(String(num, radix: 2))

var statusCode: Int = 418
var errorString: String = "The request failed with the error:"
//switch statusCode {
////case 400:
////    errorString = "Bad request"
////case 401:
////    errorString = "Unauthorized"
////case 403:
////    errorString = "Forbidden"
////case 404:
////    errorString = "Not found"
////default:
////    errorString = "None"
//case 400, 401, 403, 404:
//    errorString = "There was something wrong with the request."
//    fallthrough
//default:
//    errorString += " Please review the request and try again."
//}
switch statusCode {
case 100, 101:
//    errorString += " Informational, 1xx."
    errorString += " Informational, \(statusCode)."
case 204:
    errorString += " Successful but no content, 204."
case 300...307:
//    errorString += " Redirection, 3xx."
    errorString += " Redirection, \(statusCode)."
case 400...417:
//    errorString += " Client error, 4xx."
    errorString += " Client error, \(statusCode)."
case 500...505:
//    errorString += " Server error, 5xx."
    errorString += " Server error, \(statusCode)."
//default:
//    errorString = "Unknown. Please review the request and try again."
case let unknownCode where (unknownCode >= 200 && unknownCode < 300)
    || unknownCode > 505:
    errorString = "\(unknownCode) is not a known error code."
default:
    errorString =  "Unexpected error encountered."
}

let error1 = (statusCode, errorString)
error1.0
error1.1
let error = (code: statusCode, error: errorString)
error.code
error.error

let firstErrorCode = 404
let secondErrorCode = 200
let errorCodes = (firstErrorCode, secondErrorCode)
switch errorCodes {
case (404, 404):
    print("No items found.")
case (404, _):
    print("First item not found.")
case (_, 404):
    print("Second item not found.")
default:
    print("All items found.")
}

let age = 25
//switch age {
//case 18...35:
//    print("Cool demographic")
//default:
//    break
//}
if case 18...35 = age {
    print("Cool demographic")
}

let point = (x: 1, y: 4)
switch point {
case let q1 where (point.x > 0) && (point.y > 0):
    print("\(q1) is in quadrant 1")
case let q2 where (point.x < 0) && point.y > 0:
    print("\(q2) is in quadrant 2")
case let q3 where (point.x < 0) && point.y < 0:
    print("\(q3) is in quadrant 3")
case let q4 where (point.x > 0) && point.y < 0:
    print("\(q4) is in quadrant 4")
case (_, 0):
    print("\(point) sits on the x-axis")
case (0, _):
    print("\(point) sits on the y-axis")
default:
    print("Case not covered.")
}
