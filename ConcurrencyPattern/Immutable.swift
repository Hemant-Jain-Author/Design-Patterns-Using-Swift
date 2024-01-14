struct ImmutablePerson {
    let name: String
    let age: Int
    let gender: String

    init(name: String, age: Int, gender: String) {
        self.name = name
        self.age = age
        self.gender = gender
    }
}

struct Immutable {
    static func main() {
        let person = ImmutablePerson(name: "John Doe", age: 30, gender: "Male")
        let newPerson = ImmutablePerson(name: "John Doe", age: 31, gender: "Male")

        print(person)
        print(newPerson)
        
        // Uncommenting the line below will result in a compilation error
        // person.age = 32
    }
}

Immutable.main()
