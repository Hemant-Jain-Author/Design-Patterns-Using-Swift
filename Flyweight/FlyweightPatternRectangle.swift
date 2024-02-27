import Foundation

// Shape protocol
protocol Shape {
    func draw(x1: Int, y1: Int, x2: Int, y2: Int)
}

// Rectangle class implementing Shape
class Rectangle: Shape {
    private let colour: String

    init(colour: String) {
        self.colour = colour
    }

    func draw(x1: Int, y1: Int, x2: Int, y2: Int) {
        //print("Draw rectangle colour: \(self.colour) topleft: (\(x1),\(y1)) rightBottom: (\(x2),\(y2))")
    }
}

// RectangleFactory class
class RectangleFactory {
    private var shapes: [String: Shape] = [:]

    func getRectangle(colour: String) -> Shape {
        if let existingRectangle = shapes[colour] {
            return existingRectangle
        } else {
            let newRectangle = Rectangle(colour: colour)
            shapes[colour] = newRectangle
            return newRectangle
        }
    }

    func getCount() -> Int {
        return shapes.count
    }
}

// Client code
let factory = RectangleFactory()
let random = Int.random(in: 0..<1000)

for _ in 0..<100 {
    let rectangle = factory.getRectangle(colour: String(random))
    rectangle.draw(x1: Int.random(in: 0..<100), y1: Int.random(in: 0..<100), x2: Int.random(in: 0..<100), y2: Int.random(in: 0..<100))
}

print(factory.getCount())


