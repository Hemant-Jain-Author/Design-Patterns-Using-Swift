class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Bird: Animal {
    var flightHeight: Int
    
    override init(name: String) {
        self.flightHeight = 0
        super.init(name: name)
    }
    
    func fly() {
        // To be implemented in subclasses
    }
}

class Sparrow: Bird {
    override func fly() {
        print("The sparrow is fluttering its wings.")
        flightHeight = 100
    }
}

class Penguin: Bird {
    func slide() {
        print("The penguin is sliding on its belly!")
    }

    func swim() {
        print("The penguin is swimming in the water!")
    }
    
    override func fly() {
        print("The penguin cannot fly.")
    }
}

class Dodo: Bird {
    override func fly() {
        print("The dodo is extinct and cannot fly.")
    }
}

func test(bird: Bird) {
    bird.fly()
    if bird.flightHeight > 0 {
        print("Bird is flying at a positive height.")
    } else {
        print("Error: fly() method called; flight height is still zero.")
    }
}

let sparrow = Sparrow(name: "Sparrow")
test(bird: sparrow)

let penguin = Penguin(name: "Penguin")
test(bird: penguin)
penguin.slide()
penguin.swim()

let dodo = Dodo(name: "Dodo")
test(bird: dodo)
