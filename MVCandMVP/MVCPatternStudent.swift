class Student {
    var name: String
    var id: Int

    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
}

class Model {
    private var student: Student

    init() {
        self.student = Student(name: "Harry", id: 1)
    }

    func setData(name: String, id: Int) {
        print("Model: Set data : \(name) \(id)")
        student.name = name
        student.id = id
    }

    func getData() -> Student {
        print("Model: Get data.")
        return student
    }
}

class View {
    private var model: Model

    init(model: Model) {
        self.model = model
    }

    func update() {
        let student = model.getData()
        print("View: Student Info, Name: \(student.name) Id: \(student.id)")
    }
}

class Controller {
    private var model: Model
    private var view: View

    init() {
        self.model = Model()
        self.view = View(model: model)
    }

    func setData(name: String, id: Int) {
        print("Controller: Receive data from client.")
        model.setData(name: name, id: id)
    }

    func updateView() {
        print("Controller: Receive update view from client.")
        view.update()
    }
}

func main() {
    let controller = Controller()
    controller.updateView()

    controller.setData(name: "Jack", id: 2)
    controller.updateView()
}

main()

/*
Controller: Receive update view from client.
Model: Get data.
View: Student Info, Name: Harry Id: 1
Controller: Receive data from client.
Model: Set data : Jack 2
Controller: Receive update view from client.
Model: Get data.
View: Student Info, Name: Jack Id: 2
*/
