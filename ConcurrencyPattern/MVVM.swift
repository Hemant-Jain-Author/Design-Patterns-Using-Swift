import Foundation

// Model
class Model {
    private var data: String?

    func setData(_ data: String) {
        print("Model: Set data.")
        self.data = data
    }

    func getData() -> String? {
        print("Model: Get data.")
        return data
    }
}

// ViewModel
class ViewModel {
    private var model: Model
    private var data: String?

    init(model: Model) {
        self.model = model
        updateData()
    }

    func updateModel(_ data: String) {
        print("ViewModel: Update data.")
        model.setData(data)
        updateData()
    }

    func updateData() {
        print("ViewModel: Fetch data.")
        data = model.getData()
    }

    func getData() -> String? {
        return data
    }
}

// View
class View {
    private var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    func displayData() {
        if let data = viewModel.getData() {
            print("Display Data: \(data)")
        } else {
            print("Display Data: null")
        }
    }

    func getUserInput() {
        print("View: Enter user input: ", terminator: "")
        let userInput = readLine() ?? "hello, world!"
        print(userInput)
        viewModel.updateModel(userInput)
    }
}

// Client code
let model = Model()
let viewModel = ViewModel(model: model)
let view = View(viewModel: viewModel)

// Display initial data
view.displayData()

// Get user input and update data
view.getUserInput()

// Display updated data
view.displayData()
