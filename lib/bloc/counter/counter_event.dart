part of 'counter_bloc.dart';

abstract class CounterEvent {}
// Equatable wird hier nicht benötigt.

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}
