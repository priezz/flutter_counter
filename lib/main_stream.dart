part of counter;

class State {
  int counter = 0;
  final StreamController<int> controller = StreamController<int>.broadcast();
  increment() => controller.sink.add(++counter);
}

State state = State();

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Counter Demo (Redux)',
        home: Home(),
      );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamBuilder(
        stream: state.controller.stream.transform(StreamTransformer.fromHandlers(
          handleData: (int value, EventSink<int> sink) => sink.add(-value),
        )),
        initialData: state.counter,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) => view(snapshot.data),
      );
}

Widget view(int counter) => Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => state.increment(),
        tooltip: 'Increment',
        child: Text(counter.toString()),
      ),
    );
