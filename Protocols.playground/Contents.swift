import Cocoa

func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
}

//func printTable(data: [[Int]]) {
//func printTable(rowLabels: [String], columnLabels: [String], data: [[Int]]) {
func printTable(dataSource: TabularDataSource & CustomStringConvertible) {
    print("Table: \(dataSource.description)")
    
    // Crete arrays of the row and column labels
    let rowLabels = (0 ..< dataSource.numberOfRows).map {
        dataSource.labelForRow(row: $0)
    }
    let columnLabels = (0 ..< dataSource.numberOfColumns).map {
        dataSource.labelForColumn(column: $0)
    }
    
    // Create an array of the width of each row label
    let rowLabelWidths = rowLabels.map { $0.count }
    
    // Determine length of longest row label
    guard let maxRowLabelWidth = rowLabelWidths.max() else {
        return
    }
    
    // Create first row containing column headers
    var firstRow: String = padding(amount: maxRowLabelWidth) + " |"
    
    // Also keep track of the width of each column
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.count)
    }
    print(firstRow)
    
//    for row in data {
//    // Create an empty string
//    var out = ""
    
//    for (i, row) in data.enumerated() {
    for i in 0 ..< dataSource.numberOfRows {
        // Pad the row lobel out so they are all the same length
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(amount: paddingAmount) + " |"
        
        // Append each item in this row to our string
//        for item in row {
//            out += " \(item) |"
//        for (j, item) in row.enumerated() {
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(row: i, column: j)
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.count
            out += padding(amount: paddingAmount) + itemString
        }
        
        // Done - print it!
        print(out)
    }
}

//let rowLabels = ["Joe", "Karen", "Fred", "Anastasia Clementine"]
//let columnLabels = ["Age", "Years of Experience"]
//let data = [
//    [30, 6],
//    [40, 18],
//    [50, 20],
//    [60, 24],
//]
//
//printTable(rowLabels: rowLabels, columnLabels: columnLabels, data: data)
struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    var description: String {
        return "Department (\(name))"
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Age"
        case 1: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        switch column {
        case 0: return person.age
        case 1: return person.yearsOfExperience
        default: fatalError("Invalid column!")
        }
    }
    
}

var department = Department(name: "Engineering")
department.addPerson(person: Person(name: "Joe", age: 30, yearsOfExperience: 6))
department.addPerson(person: Person(name: "Karen", age: 40, yearsOfExperience: 18))
department.addPerson(person: Person(name: "Fred", age: 50, yearsOfExperience: 20))

printTable(dataSource: department)
//print(department)
