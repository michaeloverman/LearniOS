import UIKit

var errorCode: String?
errorCode = "403"
var errorDescription: String?
//print(errorCode)
//if errorCode != nil {
//    let theError = errorCode!
if let theError = errorCode, let errorInt = Int(theError), errorInt == 404 {
//    if {
//        print("\(theError): \(errorInt)")
//    }
//    print(theError)
    errorDescription = ("\(errorInt + 200): the requested resource was not found.")
}

var upcaseError = errorDescription?.uppercased()
errorDescription

upcaseError?.append(" PLEASE TRY AGAIN.")
upcaseError
//let description: String
//if let errorDescription = errorDescription {
//    description = errorDescription
//} else {
//    description = "No error"
//}
let description = errorDescription ?? "No error."
