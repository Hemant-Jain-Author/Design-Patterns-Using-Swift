import Foundation

protocol Observer: AnyObject {
    func notify(subject: String, message: String)
}

class Courses {
    private var courseStudents = [String: Set<ObjectIdentifier>]()

    func subscribe(subject: String, student: Observer) {
        let id = ObjectIdentifier(student)
        courseStudents[subject, default: []].insert(id)
    }

    func unsubscribe(subject: String, student: Observer) {
        let id = ObjectIdentifier(student)
        courseStudents[subject]?.remove(id)
    }

    func publish(subject: String, message: String) {
        guard let subscribers = courseStudents[subject] else {
            print("No subscribers for subject '\(subject)'.")
            return
        }

        for id in subscribers {
            if let student = id as? Observer {
                student.notify(subject: subject, message: message)
            }
        }
    }
}

class Student: Observer {
    private var name: String

    init(name: String) {
        self.name = name
    }

    func notify(subject: String, message: String) {
        print("\(name) received message on subject '\(subject)': \(message)")
    }
}

func main() {
    let courses = Courses()
    let john = Student(name: "John")
    let eric = Student(name: "Eric")
    let jack = Student(name: "Jack")

    courses.subscribe(subject: "English", student: john)
    courses.subscribe(subject: "English", student: eric)
    courses.subscribe(subject: "Maths", student: eric)
    courses.subscribe(subject: "Science", student: jack)

    courses.publish(subject: "English", message: "Tomorrow class at 11")
    courses.publish(subject: "Maths", message: "Tomorrow class at 1")

    // Unsubscribe Eric from English
    courses.unsubscribe(subject: "English", student: eric)

    courses.publish(subject: "English", message: "Updated schedule for English")
}

main()

/*
Eric received message on subject 'English': Tomorrow class at 11
John received message on subject 'English': Tomorrow class at 11
Eric received message on subject 'Maths': Tomorrow class at 1
John received message on subject 'English': Updated schedule for English
*/
