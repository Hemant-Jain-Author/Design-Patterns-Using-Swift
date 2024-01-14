// Component
class Component {
    func operation() {
        fatalError("Operation must be overridden by subclasses")
    }
}

// Composite
class Composite: Component {
    private var children = Set<Component>()

    override func operation() {
        print("Composite Operation")
        for child in children {
            child.operation()
        }
    }

    func add(_ component: Component) {
        children.insert(component)
    }

    func remove(_ component: Component) {
        children.remove(component)
    }
}

// Leaf
class Leaf: Component {
    override func operation() {
        print("Leaf Operation")
    }
}

// Client code
let composite = Composite()
composite.add(Leaf())

let composite2 = Composite()
composite2.add(Leaf())

composite.add(composite2)
composite.operation()
