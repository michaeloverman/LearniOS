import Cocoa

func printGreeting() {
    print("Hello, playground")
}
printGreeting()

func printPersonalGreeting(names: String...) {
    for name in names {
        print("Hello, \(name)");
    }
}
printPersonalGreeting(names: "Franklin")

func divisionDescription(forNumerator num: Double, andDenominator den: Double, withPunctuation punc: String = ".") -> String {
    return "\(num) divided by \(den) equals \(num / den)\(punc)"
}
print(divisionDescription(forNumerator: 9.0, andDenominator: 3.0))
print(divisionDescription(forNumerator: 9.0, andDenominator: 3.0, withPunctuation: "!"))
printPersonalGreeting(names: "andy", "mike", "amy", "steve")

var error = "The request failed:"
func appendErrorCode(code: Int, toErrorString errorString: inout String) {
    if code == 400 {
        errorString += " bad request"
    }
}
appendErrorCode(code: 400, toErrorString: &error)
error

func areaOfTriangle(withBase base: Double, andHeight height: Double) -> Double {
    let numerator = base * height
    func divide() -> Double {
        return numerator / 2
    }
    return divide()
}
areaOfTriangle(withBase: 3.0, andHeight: 5.0)

func sortEvenOdd(numbers: [Int]) -> (evens: [Int], odds: [Int]) {
    var evens = [Int]()
    var odds = [Int]()
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}

let aBunchOfNumbers = [10,1,4,3,57,43,84,27,156,111]
let theSortedNumbers = sortEvenOdd(numbers: aBunchOfNumbers)
print("The even numbers are: \(theSortedNumbers.evens); the odd numbers are: \(theSortedNumbers.odds)")

func greetByMiddleName(name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle, middleName.count <= 4 else {
        print("Hey, there")
        return
    }
    print("Hey, \(middleName)!")
}
greetByMiddleName(name: (first: "Mathew", middle:"Danger", last: "Schmidt"))

func beanSifter(list: [String]) -> (beans: [String], other: [String]) {
    var beans = [String]()
    var other = [String]()
    for item in list {
        if item.hasSuffix("beans") {
            beans.append(item)
        } else {
            other.append(item)
        }
    }
    return (beans, other)
}
let result = beanSifter(list: ["green beans",
                                      "milk",
                                      "black beans",
                                      "pinto beans",
                                      "apples"])
result.beans == ["green beans", "black beans", "pinto beans"]
result.other == ["milk", "apples"]
