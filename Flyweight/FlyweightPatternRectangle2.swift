import Foundation

// Shape protocol
protocol Shape {
    func draw(x1: Int, y1: Int, x2: Int, y2: Int)
}

// Rectangle class implementing Shape with Intrinsic State
class RectangleIntrinsic: Shape {
    private let color: String

    init(color: String) {
        self.color = color
    }

    func draw(x1: Int, y1: Int, x2: Int, y2: Int) {
        print("Draw rectangle color: \(self.color) topleft: (\(x1),\(y1)) rightBottom: (\(x2),\(y2))")
    }
}

// RectangleFactory class for managing Flyweight objects
class RectangleFactory {
    private var shapes: [String: Shape] = [:]

    func getRectangle(color: String) -> Shape {
        if let existingRectangle = shapes[color] {
            return existingRectangle
        } else {
            let newRectangle = RectangleIntrinsic(color: color)
            shapes[color] = newRectangle
            return newRectangle
        }
    }
}

// Rectangle class without Flyweight
class RectangleWithoutFlyweight {
    private let color: String

    init(color: String) {
        self.color = color
    }

    func draw(x1: Int, y1: Int, x2: Int, y2: Int) {
        print("Draw rectangle color: \(self.color) topleft: (\(x1),\(y1)) rightBottom: (\(x2),\(y2))")
    }
}

// Client code
let factory = RectangleFactory()
let random = Int.random(in: 0..<10)

var startTime = Date().timeIntervalSince1970
for _ in 0..<100 {
    let rectangle = factory.getRectangle(color: String(random))
    rectangle.draw(x1: Int.random(in: 0..<100), y1: Int.random(in: 0..<100), x2: Int.random(in: 0..<100), y2: Int.random(in: 0..<100))
}
var endTime = Date().timeIntervalSince1970

print("Flyweight Time: \(Int((endTime - startTime) * 1000)) ms")

startTime = Date().timeIntervalSince1970
for _ in 0..<10000 {
    let rectangle = RectangleWithoutFlyweight(color: String(ra
