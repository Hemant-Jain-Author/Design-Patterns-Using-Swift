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
    private static var db: Database?
    private static let lock = NSLock()

    private init() {
        db = Database()
    }

    static func getInstance() -> Singleton {
        if instance == nil {
            lock.lock()
            defer {
                lock.unlock()
            }
            if instance == nil {
                instance = Singleton()
            }
        }
        return instance!
    }

    func addData(_ data: String) {
        db?.addData(data)
    }
}

class DoubleChecking {
    static func main() {
        let s1 = Singleton.getInstance()
        let s2 = Singleton.getInstance()

        print(s1)
        print(s2)

        s2.addData("Hello, world!")
    }
}

DoubleChecking.main()
