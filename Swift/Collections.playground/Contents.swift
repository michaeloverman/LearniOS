import Cocoa

var bucketList1: Array<String>
//var bucketList: [String]
var bucketList = ["Climb Mt Everest"]
//bucketList.append("Fly hotair balloon to Fiji")
//bucketList.append("Watch the Lord of the Rings trilogy in one day")
//bucketList.append("Go on a walkabout")
//bucketList.append("Scuba dive in the Great Blue Hole")
//bucketList.append("Find a triple rainbow")
var newItems = [
    "Fly hot air balloon to Fiji",
    "Watch the Lord of the Rings trilogy in one day",
    "Go on a walkabout",
    "Scuba dive in the Great Blue Hole",
    "Find a triple rainbow"
]
//for item in newItems {
//    bucketList.append(item)
//}
bucketList += newItems
bucketList.remove(at: 2)
print(bucketList.count)
print(bucketList[0...2])
bucketList[2] += " in Australia"
bucketList[0] = "Climb Mt. Kilimanjaro"
bucketList.insert("Toboggan across Alaska", at: 2)
print(bucketList)

var myronsList = [
    "Climb Mt. Kilimanjaro",
    "Fly hot air balloon to Fiji",
    "Toboggan across Alaska",
    "Go on a walkabout in Australia",
    "Scuba dive in the Great Blue Hole",
    "Find a triple rainbow"
]
let equal = (bucketList == myronsList)
let lunches = [
    "Cheeseburger",
    "Veggie Pizza",
    "Chicken Caesar Salad",
    "Black Bean Burrito",
    "Falafel wrap"
]
var reverseLunch = lunches.reversed()
//for item in lunches {
//    reverseLunch.insert(item, at: 0)
//}
print(reverseLunch)

/////////////////////////////////////////
// Ch 10 Dictionaries
/////////////////////////////////////////

var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Dark City": 4]
print("I have rated \(movieRatings.count) movies.")
let darkoRating = movieRatings["Donnie Darko"]
movieRatings["Dark City"] = 5
let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    print("Old rating: \(lastRating); current rating: \(currentRating)")
}
movieRatings["The Cabinet of Dr. Caligari"] = 5
movieRatings.removeValue(forKey: "Donnie Darko")

for (key, value) in movieRatings {
    print("\(key) is rated at \(value)")
}
for movie in movieRatings.keys {
    print("\(movie) has been rated.")
}
let watchedMovies = Array(movieRatings.keys)

var state = [String:[Int]]()
state["MonCounty"] = [123, 234, 345]
state["PrestonCounty"] = [456, 567, 678]
state["MartinCounty"] = [789, 890, 901]
var codes = [Int]()
for vals in state.values {
    codes += vals
}
codes

/////////////////
// Ch 11 Sets
/////////////////

//var groceries = Set<String>()
//groceries.insert("apples")
//groceries.insert("bananas")
//groceries.insert("carambola")
var groceries = Set(["apples","bananas","carambola"])
for food in groceries {
    print(food)
}
let hasBananas = groceries.contains("bananas")
let friendsGroceryBag = Set(["bananas", "cereal", "milk", "oranges"])
let commonSet = groceries.union(friendsGroceryBag)

let roommatesGroceryBag = Set(["apples", "bananas", "cereal", "toothpaste"])
let returns = commonSet.intersection(roommatesGroceryBag)

let yourSecondBag = Set(["Berries", "Yogurt"])
let roommatesSecondBag = Set(["Grapes", "Honey"])
let disjoint = yourSecondBag.isDisjoint(with: roommatesSecondBag)

