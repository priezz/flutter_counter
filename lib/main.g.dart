// GENERATED CODE - DO NOT MODIFY BY HAND

part of counter;

// **************************************************************************
// BuiltReduxGenerator
// **************************************************************************

// ignore_for_file: avoid_classes_with_only_static_members
// ignore_for_file: annotate_overrides

class _$Actions extends Actions {
  factory _$Actions() => new _$Actions._();
  _$Actions._() : super._();

  final ActionDispatcher<Null> increment =
      new ActionDispatcher<Null>('Actions-increment');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    increment.setDispatcher(dispatcher);
  }
}

class ActionsNames {
  static final ActionName<Null> increment =
      new ActionName<Null>('Actions-increment');
}

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_catches_without_on_clauses
// ignore_for_file: avoid_returning_this
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first
// ignore_for_file: unnecessary_const
// ignore_for_file: unnecessary_new
// ignore_for_file: test_types_in_equals

class _$State extends State {
  @override
  final int count;

  factory _$State([void updates(StateBuilder b)]) =>
      (new StateBuilder()..update(updates)).build();

  _$State._({this.count}) : super._() {
    if (count == null) {
      throw new BuiltValueNullFieldError('State', 'count');
    }
  }

  @override
  State rebuild(void updates(StateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  StateBuilder toBuilder() => new StateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is State && count == other.count;
  }

  @override
  int get hashCode {
    return $jf($jc(0, count.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('State')..add('count', count))
        .toString();
  }
}

class StateBuilder implements Builder<State, StateBuilder> {
  _$State _$v;

  int _count;
  int get count => _$this._count;
  set count(int count) => _$this._count = count;

  StateBuilder();

  StateBuilder get _$this {
    if (_$v != null) {
      _count = _$v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(State other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$State;
  }

  @override
  void update(void updates(StateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$State build() {
    final _$result = _$v ?? new _$State._(count: count);
    replace(_$result);
    return _$result;
  }
}
