class Rectangle {
    private var height: Int
    private var width: Int

    init(height: Int, width: Int) {
        self.height = height
        self.width = width
    }

    func setWidth(_ width: Int) {
        self.width = width
    }

    func setHeight(_ height: Int) {
        self.height = height
    }

    func getWidth() -> Int {
        return width
    }

    func getHeight() -> Int {
        return height
    }
}

class Square: Rectangle {
    init(sideLength: Int) {
        super.init(height: sideLength, width: sideLength)
    }

    override func setWidth(_ width: Int) {
        super.setWidth(width)
        super.setHeight(width)
    }

    override func setHeight(_ height: Int) {
        super.setWidth(height)
        super.setHeight(height)
    }
}

func testRectangle() {
    let r = Rectangle(height: 10, width: 20)
    testRect(rect: r)
}

func testSquare() {
    let s = Square(sideLength: 10)
    s.setWidth(20)
    testRect(rect: s)
}

func testRect(rect: Rectangle) {
    rect.setHeight(10)
    rect.setWidth(20)
    if 200 == rect.getHeight() * rect.getWidth() {
        print("success")
    } else {
        print("failure")
    }
}

testRectangle()
testSquare()
