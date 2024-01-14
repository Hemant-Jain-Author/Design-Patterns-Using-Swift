import Foundation

// Expression protocol
protocol Expression {
    func interpret() -> Int
}

// Number class implementing Expression
class Number: Expression {
    private let value: Int

    init(_ value: Int) {
        self.value = value
    }

    func interpret() -> Int {
        return value
    }
}

// Plus class implementing Expression
class Plus: Expression {
    private let left: Expression
    private let right: Expression

    init(_ left: Expression, _ right: Expression) {
        self.left = left
        self.right = right
    }

    func interpret() -> Int {
        return left.interpret() + right.interpret()
    }
}

// Minus class implementing Expression
class Minus: Expression {
    private let left: Expression
    private let right: Expression

    init(_ left: Expression, _ right: Expression) {
        self.left = left
        self.right = right
    }

    func interpret() -> Int {
        return left.interpret() - right.interpret()
    }
}

// Context class
class Context {
    private var variables = [String: Int]()

    func getValue(_ name: String) -> Int {
        return variables[name] ?? 0
    }

    func setValue(_ name: String, _ value: Int) {
        variables[name] = value
    }
}

// Interpreter class
class Interpreter {
    static func parseExpression(_ expression: String, _ context: Context) -> Expression {
        if expression.range(of: "\\d+", options: .regularExpression) != nil {
            return Number(Int(expression)!)
        } else if expression.contains("+") {
            let parts = expression.components(separatedBy: " + ", maxSplits: 1)
            return Plus(parseExpression(parts[0], context), parseExpression(parts[1], context))
        } else if expression.contains("-") {
            let parts = expression.components(separatedBy: " - ", maxSplits: 1)
            return Minus(parseExpression(parts[0], context), parseExpression(parts[1], context))
        } else {
            return Number(context.getValue(expression))
        }
    }
}

// Client code
let context = Context()
context.setValue("x", 10)
context.setValue("y", 5)

let expression = Interpreter.parseExpression("x + y + 2", context)
let result = expression.interpret()
print(result)
