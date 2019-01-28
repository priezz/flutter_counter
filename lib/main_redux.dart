part of counter;

@immutable
class Model {
    final int counter;
    Model(this.counter);
    Model copyWith({int counter}) => Model(counter ?? this.counter);
}

class IncrementAction {}

final reducers = combineReducers<Model>([
    TypedReducer<Model, IncrementAction>(_onIncrement),
]);
Model _onIncrement(Model state, IncrementAction action) =>
    state.copyWith(counter: state.counter + 1);
final Store<Model> store = Store<Model>(reducers, initialState: Model(0));

void main() => runApp(StoreProvider<Model>(store: store, child: App()));

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Counter Demo (Redux)',
        home: StoreConnector<Model, String>(
            converter: (store) => store.state.count.toString(),
            builder: (context, counter) => view(store, counter),
        ),
    );
}

Widget view(Store store, String counter) => Scaffold(
    floatingActionButton: FloatingActionButton(
        onPressed: () => store.dispatch(IncrementAction()),
        tooltip: 'Increment',
        child: Text(counter),
    ),
);


// class IncrementAction {
//     final int value;
//     IncrementAction({this.value = 1});
// }

// class CounterButton extends StatefulWidget {
//   @override
//   _CounterButtonState createState() => _CounterButtonState();
// }

// class _CounterButtonState extends State<CounterButton> {
//   int _counter = 0;
//   @override
//   Widget build(BuildContext context) => FloatingActionButton(
//         onPressed: () => setState(() => _counter++),
//         mini: true,
//         child: Text(_counter.toString()),
//       );
// }
