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

void main() {
  BlocSupervisor().delegate = DebugBlocDelegate();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Counter Demo (Bloc)',
        home: BlocProvider<CounterBloc>(
          bloc: _counterBloc,
          child: Home(),
        ),
      );

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder<CounterEvent, int>(
      bloc: _counterBloc,
      builder: (BuildContext context, int count) => view(_counterBloc, count),
    );
  }
}

Widget view(CounterBloc bloc, int counter) => Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.dispatch(Increment()),
        tooltip: 'Increment',
        child: Text(counter.toString()),
      ),
    );

class DebugBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition.toString());
  }
}
