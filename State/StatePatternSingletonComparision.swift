import java.time.Duration;
import java.time.Instant;

interface State {
    void handle(Context context);
}

class Context {
    private State currentState;

    Context(State state) {
        this.currentState = state;
    }

    void changeState(State state) {
        this.currentState = state;
    }

    void request() {
        this.currentState.handle(this);
    }
}

class ConcreteState1 implements State {
    private static ConcreteState1 instance;

    private ConcreteState1() {
    }

    static ConcreteState1 getInstance() {
        if (instance == null) {
            instance = new ConcreteState1();
        }
        return instance;
    }

    @Override
    public void handle(Context context) {
        context.changeState(ConcreteState2.getInstance());
    }
}

class ConcreteState2 implements State {
    private static ConcreteState2 instance;

    private ConcreteState2() {
    }

    static ConcreteState2 getInstance() {
        if (instance == null) {
            instance = new ConcreteState2();
        }
        return instance;
    }

    @Override
    public void handle(Context context) {
        context.changeState(ConcreteState3.getInstance());
    }
}

class ConcreteState3 implements State {
    private static ConcreteState3 instance;

    private ConcreteState3() {
    }

    static ConcreteState3 getInstance() {
        if (instance == null) {
            instance = new ConcreteState3();
        }
        return instance;
    }

    @Override
    public void handle(Context context) {
        context.changeState(ConcreteState4.getInstance());
    }
}

class ConcreteState4 implements State {
    private static ConcreteState4 instance;

    private ConcreteState4() {
    }

    static ConcreteState4 getInstance() {
        if (instance == null) {
            instance = new ConcreteState4();
        }
        return instance;
    }

    @Override
    public void handle(Context context) {
        context.changeState(ConcreteState1.getInstance());
    }
}

public class StatePatternSingletonComparision {
    public static void main(String[] args) {
        ConcreteState1 state1 = ConcreteState1.getInstance();
        test(state1, 10);

        ConcreteState1 state2 = ConcreteState1.getInstance();
        test(state2, 10);
    }

    static void test(State state, int count) {
        Context context = new Context(state);
        Instant start = Instant.now();
        for (int i = 0; i < count; i++) {
            context.request();
        }
        Instant end = Instant.now();
        Duration duration = Duration.between(start, end);
        System.out.println(duration.toMillis() / 1000.0);
    }
}
