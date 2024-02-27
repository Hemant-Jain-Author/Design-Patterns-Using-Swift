// Custom Iterator protocol
protocol CustomIterator {
    associatedtype Element
    func hasNext() -> Bool
    func next() -> Element?
}

// Custom Collection protocol
protocol CustomAggregate {
    associatedtype Element
    associatedtype Iterator: CustomIterator where Iterator.Element == Element
    func makeIterator() -> Iterator
    func addData(_ val: Element)
}

// ConcreteAggregate class
class ConcreteAggregate: CustomAggregate {
    private var data: [Int] = []

    func addData(_ val: Int) {
        data.append(val)
    }

    func makeIterator() -> ConcreteIterator {
        return ConcreteIterator(aggregate: self)
    }

    func getData() -> [Int] {
        return data
    }
}

// ConcreteIterator class
class ConcreteIterator: CustomIterator {
    typealias Element = Int
    private let aggregate: ConcreteAggregate
    private var index: Int = 0

    init(aggregate: ConcreteAggregate) {
        self.aggregate = aggregate
    }

    func hasNext() -> Bool {
        return index < aggregate.getData().count
    }

    func next() -> Int? {
        guard hasNext() else { return nil }
        let value = aggregate.getData()[index]
        index += 1
        return value
    }
}

// Main
let aggregate = ConcreteAggregate()
for i in 0..<10 {
    aggregate.addData(i)
}

let iterator = aggregate.makeIterator()
while let val = iterator.next() {
    print(val, terminator: " ")
}
