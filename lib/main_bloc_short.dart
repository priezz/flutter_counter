part of counter;

abstract class CounterEvent {}

class Increment extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(int currentState, CounterEvent event) async* {
    if (event is Increment) yield currentState + 1;
  }
}

final CounterBloc counterBloc = CounterBloc();

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Counter Demo (Bloc)',
        home: BlocProvider<CounterBloc>(
          bloc: counterBloc,
          child: BlocBuilder<CounterEvent, int>(
            bloc: counterBloc,
            builder: (BuildContext context, int count) => view(count),
          ),
        ),
      );
}

Widget view(int counter) => Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterBloc.dispatch(Increment()),
        tooltip: 'Increment',
        child: Text(counter.toString()),
      ),
    );
