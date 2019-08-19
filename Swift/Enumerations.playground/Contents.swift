import Cocoa

enum TextAlignment: Int {
    case Left       = 10
    case Right      = 20
    case Center     = 30
    case Justify    = 40
}

var alignment = TextAlignment.Left
alignment = .Right

//if alignment == .Right {
//    print("we should right-align the text!")
//}
switch alignment {
case .Left:
    print("we are left aligned")
case .Right:
    print("we are RIGHT aligned")
case .Center:
    print("we are centered")
case .Justify:
    print("justified")
}

print("Left has raw value \(TextAlignment.Left.rawValue)")
print("Right has raw value \(TextAlignment.Right.rawValue)")
print("Center has raw value \(TextAlignment.Center.rawValue)")
print("Justify has raw value \(TextAlignment.Justify.rawValue)")
print("The alignment variable has raw value \(alignment.rawValue)")

// Create a raw value.
let myRawValue = 20
// Try to convert the raw value into a TextAlignment
if let myAlignment = TextAlignment(rawValue: myRawValue) {
    // Conversion succeeded!
    print("successfully converted \(myRawValue) into a TextAlignment: \(myAlignment)")
} else {
    // Conversion failed.
    print("\(myRawValue) has no corresponding TextAlignment case")
}

enum ProgrammingLanguage: String {
    case Swift
    case ObjectiveC = "Objective-C"
    case C
    case Cpp = "C++"
    case Java
}
let favorite = ProgrammingLanguage.Swift
print("My favorite programming language is \(favorite.rawValue)")

enum Lightbulb {
    case On
    case Off
    
    func surfaceTemperatureForAmbient(ambient: Double) -> Double {
        switch self {
        case .On:
            return ambient + 150.0
        case .Off:
            return ambient
        }
    }
    
    mutating func toggle() {
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}
var bulb = Lightbulb.On
var ambient = 77.0
var bulbTemp = bulb.surfaceTemperatureForAmbient(ambient: ambient)
print("the bulb's temperature is \(bulbTemp)")
bulb.toggle()
bulbTemp = bulb.surfaceTemperatureForAmbient(ambient: ambient)
print("the bulb's temperature is \(bulbTemp)")

enum ShapeDimensions {
    case Point
    case Square(Double)
    case Rectangle(length: Double, width: Double)
    case RightTriangle(base: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case .Point:
            return 0.0
        case let .Square(side):
            return side * side
        case let .Rectangle(length: l, width: w):
            return l * w
        case let .RightTriangle(base: b, height: h):
            return b * h * 0.5
        }
    }
    func perimeter() -> Double {
        switch self {
        case .Point:
            return 0.0
        case let .Square(side):
            return side * 4
        case let .Rectangle(length: l, width: w):
            return 2 * (l + w)
        case let .RightTriangle(base: b, height: h):
            return b + h + (sqrt((b * b) + (h * h)))
        }
    }
}
var squareShape = ShapeDimensions.Square(10.0)
var rectShape = ShapeDimensions.Rectangle(length: 5.0, width: 10.0)
var pointShape = ShapeDimensions.Point
print("square's area = \(squareShape.area())")
print("rectangle's area = \(rectShape.area())")
print("point's area = \(pointShape.area())")
print("square's perimeter = \(squareShape.perimeter())")
print("rectangle's perimeter = \(rectShape.perimeter())")
print("point's perimeter = \(pointShape.perimeter())")

enum FamilyTree {
    case NoKnownParents
    indirect case OneKnownParent(name: String, ancestors: FamilyTree)
    indirect case TwoKnownParents(fatherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}
let fredAncestors = FamilyTree.TwoKnownParents(
    fatherName: "Fred Sr.",
    fatherAncestors: .OneKnownParent(name: "Beth", ancestors: .NoKnownParents),
    motherName: "Marsha",
    motherAncestors: .NoKnownParents)
