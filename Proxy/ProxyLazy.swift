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
    private var realSubject: RealSubject?

    func request() {
        if realSubject == nil {
            realSubject = RealSubject() // Lazy Initialization
        }
        realSubject?.request()
    }
}

// Main class
class ProxyLazy {
    func main() {
        let proxy = Proxy()
        proxy.request()
    }
}

// Create an instance of ProxyLazy and call the main method
let proxyLazy = ProxyLazy()
proxyLazy.main()
