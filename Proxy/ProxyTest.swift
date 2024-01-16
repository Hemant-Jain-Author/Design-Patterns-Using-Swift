import Foundation

// Subject protocol
protocol Subject {
    func request()
}

// RealSubject class conforming to Subject protocol
class RealSubject: Subject {
    func request() {
        print("Concrete Subject Request Method")
    }
}

// Proxy class conforming to Subject protocol
class Proxy: Subject {
    private var realSubject: RealSubject

    init() {
        self.realSubject = RealSubject()
    }

    func request() {
        realSubject.request()
    }
}

// Main class
class ProxyTest {
    func main() {
        let proxy = Proxy()
        proxy.request()
    }
}

// Create an instance of ProxyTest and call the main method
let proxyTest = ProxyTest()
proxyTest.main()
