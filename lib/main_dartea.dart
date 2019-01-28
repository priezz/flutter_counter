part of counter;

@immutable
class Model {
    final int counter;
    Model(this.counter);
    Model copyWith({int counter}) => Model(counter ?? this.counter);
}

abstract class Actions {}
class IncrementAction implements Actions {}

Upd<Model, Actions> update(Actions action, Model model) {
    return Upd(action is IncrementAction
        ? model.copyWith(counter: model.counter + 1)
        : model.counter
    );
}

void main() => runApp(App(
    Program<Model, Actions, Timer>(() => Upd(Model(0)), update, view)
));

class App extends StatelessWidget {
    final Program darteaProgram;
    App(this.darteaProgram);

    @override
    Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Counter Demo (Dartea)',
        home: darteaProgram.build(key: Key('root_key')),
    );
}

Widget view(BuildContext context, Dispatch<Actions> dispatch, Model model) => Scaffold(
    floatingActionButton: FloatingActionButton(
        onPressed: () => dispatch(IncrementAction()),
        tooltip: 'Increment',
        child: Text(model.counter.toString()),
    ),
);
