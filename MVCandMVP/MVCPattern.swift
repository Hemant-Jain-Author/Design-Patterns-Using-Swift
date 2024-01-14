// Model class
class Model {
    private var data: String

    init() {
        self.data = "Hello, World!"
    }

    func setData(_ data: String) {
        print("Model: Set data : \(data)")
        self.data = data
    }

    func getData() -> String {
        print("Model: Get data: \(data)")
        return data
    }
}

// View class
class View {
    private var model: Model

    init(model: Model) {
        self.model = model
    }

    // In classic MVC, the view interacts with the model to get data.
    func update() {
        let data = model.getData()
        print("View: Updating the view with data : \(data)")
    }
}

// Controller class
class Controller {
    private var model: Model
    private var view: View

    init() {
        self.model = Model()
        self.view = View(model: model)
    }

    func setData(_ data: String) {
        print("Controller: Receive data from client.")
        model.setData(data)
    }

    func updateView() {
        print("Controller: Receive update view from client.")
        view.update()
    }
}

// Client code
let controller = Controller()
controller.updateView()

controller.setData("Hello, Students!")
controller.updateView()


/*
Controller: Receive update view from client.
Model: Get data: Hello, World!
View: Updating the view with data : Hello, World!
Controller: Receive data from client.
Model: Set data : Hello, Students!
Controller: Receive update view from client.
Model: Get data: Hello, Students!
View: Updating the view with data : Hello, Students!
*/
