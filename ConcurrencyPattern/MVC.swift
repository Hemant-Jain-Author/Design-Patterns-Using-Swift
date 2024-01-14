import Foundation

// Model
class Model {
    private var data: String = ""
    private var observers: [Observer] = []

    init() {}

    func setData(_ data: String) {
        print("Model : Set data.")
        self.data = data
        notifyObservers()
    }

    func getData() -> String {
        print("Model : Get data.")
        return data
    }

    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }

    func removeObserver(_ observer: Observer) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }

    func notifyObservers() {
        print("Model : Notify observers.")
        for observer in observers {
            observer.update()
        }
    }
}

// View
class View: Observer {
    private var controller: Controller?
    private var model: Model

    init(model: Model, controller: Controller) {
        self.model = model
        self.controller = controller
        self.model.addObserver(self)
    }

    func update() {
        print("View : Update.")
        let data = model.getData()
        print("Data: \(data)")
    }

    func getUserInput() {
        print("View : Enter user input: ", terminator: "")
        let userInput = readLine() ?? ""
        controller?.handleUserInput(userInput)
    }
}

// Controller
class Controller {
    private var model: Model?
    private var view: View?

    init(model: Model) {
        self.model = model
    }

    func handleUserInput(_ userInput: String) {
        print("Controller : Handle user input.")
        model?.setData(userInput)
        // Can inform view about action.
    }

    func setView(_ view: View) {
        self.view = view
    }
}

// Observer protocol
protocol Observer: AnyObject {
    func update()
}

// Main class
let model = Model()
let controller = Controller(model: model)
let view = View(model: model, controller: controller)
controller.setView(view)
view.getUserInput()
