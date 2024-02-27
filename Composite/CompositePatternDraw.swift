// IShape protocol
protocol IShape {
    func move(x: Int, y: Int)
    func draw() -> String
}

// Rectangle
class Rectangle: IShape {
    private var x, y, length, breadth: Int

    init(x: Int, y: Int, length: Int, breadth: Int) {
        self.x = x
        self.y = y
        self.length = length
        self.breadth = breadth
    }

    func move(x: Int, y: Int) {
        self.x += x
        self.y += y
    }

    func draw() -> String {
        print("Draw a Rectangle at (\(x), \(y)).")
        return "<Rectangle>"
    }
}

// Circle
class Circle: IShape {
    private var x, y, radius: Int

    init(x: Int, y: Int, radius: Int) {
        self.x = x
        self.y = y
        self.radius = radius
    }

    func move(x: Int, y: Int) {
        self.x += x
        self.y += y
    }

    func draw() -> String {
        print("Draw a Circle of radius \(radius) at (\(x), \(y)).")
        return "<Circle>"
    }
}

// CompoundShape
class CompoundShape: IShape {
    private var children = Set<IShape>()

    func add(_ child: IShape) {
        children.insert(child)
    }

    func remove(_ child: IShape) {
        children.remove(child)
    }

    func move(x: Int, y: Int) {
        for child in children {
            child.move(x: x, y: y)
        }
    }

    func draw() -> String {
        var result = "Shapes("
        for child in children {
            result += child.draw()
        }
        result += ")"
        return result
    }
}

// Client code
let all = CompoundShape()
all.add(Rectangle(x: 1, y: 2, length: 1, breadth: 2))
all.add(Circle(x: 5, y: 3, radius: 10))

let group = CompoundShape()
group.add(Rectangle(x: 5, y: 7, length: 1, breadth: 2))
group.add(Circle(x: 2, y: 1, radius: 2))
all.add(group)

print(all.draw())
