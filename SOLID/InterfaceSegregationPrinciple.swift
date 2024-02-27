import Foundation

// Printer protocol
protocol Printer {
    func printDocument(document: String)
    func scan()
    func fax(document: String)
}

protocol Printable {
    func printDocument(_ document: String)
}

protocol Scannable {
    func scan()
}

protocol Faxable {
    func faxDocument(_ document: String)
}

class BasicInkjetPrinter: Printable, Scannable {
    func printDocument(_ document: String) {
        print("Printing \(document) using basic inkjet printer")
    }
}

class HighEndOfficePrinter: Printable, Scannable, Faxable {
    func printDocument(_ document: String) {
        print("Printing \(document) using high-end office printer")
    }

    func scan() {
        print("Scanning using high-end office printer")
    }

    func faxDocument(_ document: String) {
        print("Faxing \(document) using high-end office printer")
    }
}

// Client code
let basicPrinter = BasicInkjetPrinter()
basicPrinter.printDocument("Sample Document")

let officePrinter = HighEndOfficePrinter()
officePrinter.printDocument("Important Report")
officePrinter.scan()
officePrinter.faxDocument("Confidential Memo")
