import UIKit

//var myInt: Int = 0
//
//for _ in 1...5 {
//    myInt += 1
//    print(myInt)
//}

//for var i = 0; i < 6; i++ {
//    myInt += 1
//    print(myInt)
//}
//var i = 1
//while i < 6 {
//    myInt += 1
//    print(myInt)
//    i += 1
//}
//for case let i in 1...100 where i % 3 == 0 {
//    print(i)
//}

//var shields = 5
//var blastersOverheating = false
//var blasterFireCount = 0
//while shields > 0 {
//    if blastersOverheating {
//        print("Blasters are overheated! Cooldown initiated.")
//        sleep(5)
//        print("Blasters ready to fire")
//        sleep(1)
//        blastersOverheating = false
//        blasterFireCount = 0
//    }
//    if blasterFireCount > 100 {
//        blastersOverheating = true
//        continue
//    }
//    // Fire blasters!
//    print("Fire blasters!")
//    blasterFireCount += 1
//}

var mutable = "Hello, mutable"
mutable += "!"
for c: Character in mutable {
    print("\(c)")
}
let oneCoolDude = "\u{1F60E}"
let aAcute = "\u{006d}\u{0301}"
let bAcute = "\u{00E1}"
for scalar in mutable.unicodeScalars {
    print("\(scalar.value) ")
}
print(" ")
print(aAcute.count == bAcute.count)

let fromStart = mutable.startIndex
let toPosition = 4 // The first position is 0
let end = mutable.index(fromStart, offsetBy: toPosition)
let range = fromStart...end
let fifthCharacter = mutable[range]
