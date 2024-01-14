import Foundation

// Model
class Model {
    private var data: String = ""
    private var presenter: Presenter?

    func setData(_ data: String) {
        print("Model: Set data.")
        self.data = data
        presenter?.modelUpdateEvent()
    }

    func getData() -> String {
        print("Model: Get data.")
        return data
    }

    func setPresenter(_ presenter: Presenter) {
        self.presenter = presenter
    }
}

// Presenter
class Presenter {
    private var model: Model
    private var view: View

    init(model: Model, view: View) {
        self.model = model
        self.view = view
    }

    func handleUserInput(_ userInput: String) {
        print("Presenter: Handle user input.")
        model.setData(userInput)
    }

    func modelUpdateEvent() {
        print("Presenter: Model update event.")
        view.update(model.getData())
    }
}

// View
class View {
    private var presenter: Presenter?

    func update(_ data: String) {
        print("View: Update UI.")
        print("Data: \(data)")
    }

    func setPresenter(_ presenter: Presenter) {
        self.presenter = presenter
    }

    func getUserInput() {
        print("View: Enter user input: ", terminator: "")
        let userInput = readLine() ?? "hello, world!"
        print(userInput)
        presenter?.handleUserInput(userInput)
    }
}

// Client code
let model = Model()
let view = View()
let presenter = Presenter(model: model, view: view)

model.setPresenter(presenter)
view.setPresenter(presenter)

view.getUserInput()
