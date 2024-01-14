import Foundation

class Barrier {
    private var count: Int
    private let barrierLock = NSLock()
    private let barrierCondition = NSCondition()

    init(_ count: Int) {
        self.count = count
    }

    func waitBarrier() {
        barrierLock.lock()
        defer {
            barrierLock.unlock()
        }

        count -= 1

        if count > 0 {
            barrierCondition.wait()
        } else {
            barrierCondition.broadcast()
        }
    }
}

class Worker: Runnable {
    private let barrier: Barrier
    private let id: Int

    init(_ barrier: Barrier, _ id: Int) {
        self.barrier = barrier
        self.id = id
    }

    func run() {
        print("Worker \(id) started")

        // Simulating some work
        for _ in 0..<3 {
            print("Worker \(id) working...")
            // Simulating some computation
        }

        print("Worker \(id) finished")

        barrier.waitBarrier()
    }
}

class BarrierPattern {
    static func main() {
        let numWorkers = 3
        let barrier = Barrier(numWorkers)
        var threads = [Thread]()

        for i in 0..<numWorkers {
            let worker = Worker(barrier, i)
            let thread = Thread {
                worker.run()
            }
            threads.append(thread)
            thread.start()
        }

        for thread in threads {
            thread.join()
        }

        print("All workers finished. Proceeding to the next step.")
    }
}

BarrierPattern.main()
