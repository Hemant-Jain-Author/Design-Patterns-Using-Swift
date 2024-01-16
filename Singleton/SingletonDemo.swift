class Database {
    init() {
        print("Database created")
    }

    func addData(_ data: String) {
        print(data)
    }
}

class Singleton {
    private static var instance: Singleton?
    private var db: Database

    private init() {
        db = Database()
    }

    static func getInstance() -> Singleton {
        if instance == nil {
            instance = Singleton()
        }
        return instance!
    }

    func addData(_ data: String) {
        db.addData(data)
    }
}

let s1 = Singleton.getInstance()
let s2 = Singleton.getInstance()

print(ObjectIdentifier(s1))
print(ObjectIdentifier(s2))

s2.addData("Hello, world!")
