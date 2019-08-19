import Cocoa

var volunteerCounts = [1,3,40,32,2,53,77,13]

func sortAscending(i: Int, j: Int) -> Bool {
    return i < j
}

volunteerCounts.sort { $0 < $1 }


let sorted = volunteerCounts
print(sorted)

func makeTownGrand(budget: Int, condition: (Int) -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return toLights + lightsToAdd
        }
        return buildRoads
    } else {
        return nil
    }
}
func evaluateBudget(budget: Int) -> Bool {
    return budget > 10000
}
var stoplights = 4
if let townPlan = makeTownGrand(budget: 10500, condition: evaluateBudget(budget:)) {
    stoplights = townPlan(4, stoplights)
}

//let townPlan = makeTownGrand()
//stoplights = townPlan(4, stoplights)
print("Knowhere has \(stoplights) stoplights")

func makeGrowthTracker(forGrowth growth: Int) -> () -> Int {
    var totalGrowth = 0
    func growthTracker() -> Int {
        totalGrowth += growth
        return totalGrowth
    }
    return growthTracker
}
var currentPopulation = 5422
let growBy500 = makeGrowthTracker(forGrowth: 500)
growBy500()
growBy500()
growBy500()
currentPopulation += growBy500()
let anotherGrow = growBy500
anotherGrow()
var someOtherPopulation = 4061981
let growBy10000 = makeGrowthTracker(forGrowth: 10000)
someOtherPopulation += growBy10000()
currentPopulation

let precincts = [1788, 2043, 3545]
let projected = precincts.map {
//    (population: Int) -> Int in
    $0 * 2
}
projected

let big = projected.filter {
//    (projection: Int) -> Bool in
    $0 > 4000
}
big

let total = projected.reduce(0) { $0 + $1 }
total
