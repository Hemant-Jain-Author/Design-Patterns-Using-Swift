// Abstract class representing a handler
class Handler {
    var successor: Handler?

    init(successor: Handler?) {
        self.successor = successor
    }

    func handleRequest() {
        fatalError("Abstract method. Subclasses must implement this method.")
    }
}

// Concrete class representing a handler
class ConcreteHandler1: Handler {
    override func handleRequest() {
        if true {  // Can handle request.
            print("Finally handled by ConcreteHandler1")
        } else if let successor = successor {
            print("Message passed to next in chain by ConcreteHandler1")
            successor.handleRequest()
        }
    }
}

// Concrete class representing another handler
class ConcreteHandler2: Handler {
    override func handleRequest() {
        if false {  // Can't handle request.
            print("Finally handled by ConcreteHandler2")
        } else if let successor = successor {
            print("Message passed to next in chain by ConcreteHandler2")
            successor.handleRequest()
        }
    }
}

// Client code
let ch1 = ConcreteHandler1(successor: nil)
let ch2 = ConcreteHandler2(successor: ch1)
ch2.handleRequest()
