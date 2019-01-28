part of counter;

abstract class Actions extends ReduxActions {
    Actions._();
    factory Actions() => _$Actions();
    ActionDispatcher<Null> get increment;
}

abstract class State implements Built<State, StateBuilder> {
    State._();
    factory State() => _$State._(count: 0);
    int get count;
}

final reducerBuilder = ReducerBuilder<State, StateBuilder>()
    ..add(ActionsNames.increment, increment);
increment(State state, Action<Null> action, StateBuilder builder) {
    builder.count = state.count + 1; // action.payload;
}
// Store API contains three getters: stream, state, and actions.
final store = Store<State, StateBuilder, Actions>(
    reducerBuilder.build(),
    State(),
    Actions(),
    middleware: [loggingMiddleware],
);

void main() => runApp(ReduxProvider(store: store, child: App()));

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Counter Demo (Redux)',
        home: StoreConnection<State, Actions, int>(
            connect: (state) => state.count,
            builder: (BuildContext context, int count, Actions actions) => view(count, actions),
        ),
    );
}

Widget view(int count, Actions actions) => Scaffold(
    floatingActionButton: FloatingActionButton(
        onPressed: () => actions.increment(),
        tooltip: 'Increment',
        child: Text(count.toString()),
    ),
);

NextActionHandler loggingMiddleware(MiddlewareApi api) => (ActionHandler next) => (Action action) {
    final prevState = api.state;
    debugPrint('Action: $action');
    debugPrint('Previous State: $prevState');
    next(action);
    if (prevState != api.state) {
        debugPrint('Resulting State: ${api.state}');
    }
};
