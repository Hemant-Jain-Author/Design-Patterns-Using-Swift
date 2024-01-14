// Invoker
class Invoker {
    private var commands = [Command]()

    func setCommand(command: Command) {
        commands.append(command)
    }

    func executeCommands() {
        for command in commands {
            command.execute()
        }
    }

    func unexecuteCommands() {
        for command in commands {
            command.unexecute()
        }
    }
}

// Command
protocol Command {
    func execute()
    func unexecute()
}

// ConcreteCommand
class ConcreteCommand: Command {
    private let receiver: Receiver

    init(receiver: Receiver) {
        self.receiver = receiver
    }

    func execute() {
        receiver.action(action: "Action 1")
    }

    func unexecute() {
        receiver.action(action: "Action 2")
    }
}

// Receiver
class Receiver {
    func action(action: String) {
        print(action)
    }
}

// Client Code
func main() {
    let receiver = Receiver()
    let concreteCommand = ConcreteCommand(receiver: receiver)
    let invoker = Invoker()

    invoker.setCommand(command: concreteCommand)
    invoker.executeCommands()
    invoker.unexecuteCommands()
}

// Run the client code
main()

/*
Action 1
Action 2
*/
