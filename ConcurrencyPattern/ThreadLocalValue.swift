import Foundation

class ThreadLocalValue {
    // ThreadLocal variable
    private static let tlsVar = ThreadLocal<String>()

    // Function to set thread-local value
    private static func setTLSValue(_ value: String) {
        tlsVar.set(value)
    }

    // Function to get thread-local value
    private static func getTLSValue() -> String? {
        return tlsVar.get()
    }

    // Worker thread function
    private static func workerThread() {
        setTLSValue("Thread-specific any value")
        if let tlsValue = getTLSValue() {
            print(tlsValue)
        }
    }

    static func main() {
        // Create and start multiple worker threads
        var threads = [Thread]()
        for _ in 0..<3 {
            let thread = Thread {
                workerThread()
            }
            thread.start()
            threads.append(thread)
        }

        // Wait for all threads to complete
        for thread in threads {
            thread.join()
        }
    }
}

// Run the main function
ThreadLocalValue.main()
