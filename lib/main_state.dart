part of counter;

void main() => runApp(App());

class App extends StatelessWidget {
    @override
    Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Counter Demo (Redux)',
        home: Home(),
    );
}

class Home extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    int _counter = 0;
    increment() => setState(() => _counter = _counter + 1);

    @override
    Widget build(BuildContext context) => Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => increment(),
          tooltip: 'Increment',
          child: Text(_counter.toString()),
      ),
  );
}
