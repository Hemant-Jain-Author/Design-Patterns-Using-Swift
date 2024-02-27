import Foundation

// Flyweight protocol
protocol Flyweight {
    func operation(extrinsicState: Any?)
}

// Concrete Flyweight class
class ConcreteFlyweight: Flyweight {
    private let intrinsicState: String

    init(intrinsicState: String) {
        self.intrinsicState = intrinsicState
    }

    func operation(extrinsicState: Any?) {
        print("Operation inside concrete flyweight")
    }
}

// FlyweightFactory class
class FlyweightFactory {
    private var flyweights: [String: Flyweight] = [:]

    func getFlyweight(key: String) -> Flyweight {
        if let existingFlyweight = flyweights[key] {
            return existingFlyweight
        } else {
            let newFlyweight = ConcreteFlyweight(intrinsicState: key)
            flyweights[key] = newFlyweight
            return newFlyweight
        }
    }

    func getCount() -> Int {
        return flyweights.count
    }
}

// Client code
let factory = FlyweightFactory()
let flyweight1 = factory.getFlyweight(key: "key")
let flyweight2 = factory.getFlyweight(key: "key")
flyweight1.operation(extrinsicState: nil)
print("\(flyweight1) \(flyweight2)")
print("Object count: \(factory.getCount())")

/*
Operation inside concrete flyweight
FlyweightPattern.ConcreteFlyweight FlyweightPattern.ConcreteFlyweight
Object count: 1
*/
