import Cocoa

enum Token {
    case Number(Int)
    case Plus
    case Minus
}

class Lexer {
    enum Error: Swift.Error {
        case InvalidCharacter(Character)
    }
    
    let input: String
    var position: String.Index
    
    init(input: String) {
        self.input = input
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Cannot advance past the end!")
        position = input.index(after: position)
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                // Another digit - add it into value
                let digitValue = Int(String(nextCharacter))!
                value = 10*value + digitValue
                advance()
                
            default:
                // A non-digit - go back to regular indexing
                return value
            }
        }
        
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                // Start of a number - need to grab the rest
                let value = getNumber()
                tokens.append(.Number(value))
            case "+":
                tokens.append(.Plus)
                advance()
            case "-":
                tokens.append(.Minus)
                advance()
                
            case " ":
                // Just advance to ignore spaces
                advance()
                
            default:
                // Something unexpected - need to send back an error
                throw Error.InvalidCharacter(nextCharacter)
            }
        }
        
        return tokens
    }
}

class Parser {
    enum Error: Swift.Error {
        case UnexpectedEndOfInput
        case InvalidToken(Token)
    }
    
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        let token = tokens[position]
        position += 1
        return token
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Error.UnexpectedEndOfInput
        }
        
        switch token {
        case .Number(let value):
            return value
        case .Plus:
            fallthrough
        case .Minus:
            throw Error.InvalidToken(token)
        }
    }
    
    func parse() throws -> Int {
        // Require a number first
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
                
            // Getting a Plus or Minus after a Number is legal
            case .Plus:
                let nextNumber = try getNumber()
                value += nextNumber
            case .Minus:
                // After a minus, we must get another number
                let nextNumber = try getNumber()
                value -= nextNumber
                
            // Getting a Number after a number is not legal
            case .Number:
                throw Error.InvalidToken(token)
            }
        }
        
        return value
    }
}

func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
//    guard let tokens = try? lexer.lex() else {
//        print("Lexing failed, but I don't know why")
//        return
//    }
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.InvalidCharacter(let character) {
        print("Input contained an invalid character: \(character)")
    } catch Parser.Error.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.InvalidToken(let token) {
        print("Invalid token during parsing: \(token)")
    } catch {
        print("An error occured: \(error)")
    }
}

evaluate(input: "10 + 3 + 5")
//evaluate(input: "1 + 2 + abcdefg")
evaluate(input: "10 + 5 - 3 - 1")
