class Student {
    private var name: String
    private var id: Int

    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }

    func getName() -> String {
        return name
    }

    func getId() -> Int {
        return id
    }
}

class Model {
    private var student: Student

    init() {
        self.student = Student(name: "Harry", id: 1)
    }

    func setData(name: String, id: Int) {
        print("Model: Set data : \(name) \(id)")
        self.student = Student(name: name, id: id)
    }

    func getData() -> Student {
        print("Model: Get data.")
        return student
    }
}

class View {
    func update(name: String, id: Int) {
        print("View: Student Info : \(name) \(id)")
    }
}

class Presenter {
    private var model: Model
    private var view: View

    init() {
        self.model = Model()
        self.view = View()
    }

    func setData(name: String, id: Int) {
        print("Presenter: Receive data from client.")
        model.setData(name: name, id: id)
    }

    func updateView() {
        print("Presenter: Receive update from client.")
        let data = model.getData()
        view.update(name: data.getName(), id: data.getId())
    }
}

func main() {
    let presenter = Presenter()
    presenter.updateView()

    presenter.setData(name: "jack", id: 2)
    presenter.updateView()
}

main()

/*
Presenter: Receive update from client.
Model: Get data.
View: Student Info : Harry 1
Presenter: Receive data from client.
Model: Set data : jack 2
Presenter: Receive update from client.
Model: Get data.
View: Student Info : jack 2
*/
