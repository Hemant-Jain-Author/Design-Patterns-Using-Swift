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

class View {
    func update(_ data: String) {
        print("View: Updating the view with data: \(data)")
    }
}

class Presenter {
    private var model: Model
    private var view: View

    init() {
        self.model = Model()
        self.view = View()
    }

    func setData(_ data: String) {
        print("Presenter: Receive data from client.")
        model.setData(data)
    }

    func updateView() {
        print("Presenter: Receive update view from client.")
        let data = model.getData()
        view.update(data)
    }
}

func main() {
    print("Client: Pass trigger to Presenter.")
    let presenter = Presenter()
    presenter.updateView()

    presenter.setData("Hello, Students!")
    presenter.updateView()
}

main()

/*
Client: Pass trigger to Presenter.
Presenter: Receive update view from client.
Model: Get data: Hello, World!
View: Updating the view with data: Hello, World!
Presenter: Receive data from client.
Model: Set data : Hello, Students!
Presenter: Receive update view from client.
Model: Get data: Hello, Students!
View: Updating the view with data: Hello, Students!
*/
