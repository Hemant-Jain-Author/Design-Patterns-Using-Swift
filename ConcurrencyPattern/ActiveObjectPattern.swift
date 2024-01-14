import Foundation

// MethodRequest encapsulates a method call along with its arguments
class MethodRequest {
    private var method: () -> Void

    init(_ method: @escaping () -> Void) {
        self.method = method
    }

    func execute() {
        method()
    }
}

// ActiveObject encapsulates its own thread of control and executes methods asynchronously
class ActiveObject: Thread {
    private var queue: BlockingQueue<MethodRequest>
    private var isRunning: Bool

    override init() {
        self.queue = LinkedBlockingQueue()
        self.isRunning = true
        super.init()
    }

    override func main() {
        while isRunning || !queue.isEmpty {
            do {
                if let methodRequest = try queue.take() {
                    methodRequest.execute()
                }
            } catch {
            }
        }
    }

    func scheduleMethod(_ method: @escaping () -> Void) {
        let methodRequest = MethodRequest(method)
        queue.add(methodRequest)
    }

    func stopThread() {
        isRunning = false
        interrupt()
    }
}

// Proxy acts as a wrapper around the ActiveObject and forwards method calls to it
class Proxy {
    private var activeObject: ActiveObject

    init(_ activeObject: ActiveObject) {
        self.activeObject = activeObject
    }

    func invokeMethod(_ method: @escaping () -> Void) {
        activeObject.scheduleMethod(method)
    }
}

// Example usage
let activeObject = ActiveObject()
let proxy = Proxy(activeObject)

// Start the ActiveObject thread
activeObject.start()

// Invoke methods on the Proxy
proxy.invokeMethod { print("Hello") }
proxy.invokeMethod { print("World") }

// Stop the ActiveObject thread
activeObject.stopThread()
