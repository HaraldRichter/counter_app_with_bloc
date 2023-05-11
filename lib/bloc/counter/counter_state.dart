part of 'counter_bloc.dart';

/// Die States enthalten alle Parameter, die wir für unsere App benötigen.
class CounterState extends Equatable {
  final int counterValue;
  const CounterState({required this.counterValue});

  // Hier erstellen wir eine Liste aller notwendigen Parameter:
  @override
  List<Object> get props => [counterValue];

  // // Die toMap/fromMap-Methoden sind dafür da, dass der State auch nach dem Schließen
  // // der App oder über einen Neustart hinweg gespeichert werden kann (Hydrated Bloc).
  // // Weil aber HydratedBloc bzw. path_provider mit Flutter Web herumspackt, nutzen wir
  // // diese Methoden hier nicht.
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     'counterValue': counterValue,
  //   };
  // }
  //
  // factory CounterState.fromMap(Map<String, dynamic> map) {
  //   return CounterState(
  //     counterValue: map['counterValue']?.toInt() ?? 0,
  //   );
  // }
}

class CounterInitial extends CounterState {
  // Wir haben einen required-Parameter in der Superclass, den wir daher
  // beim erstellen der Child-Class initialisieren müssen:
  CounterInitial() : super(counterValue: 0);
}

/// Mehrere Counter-Event-States:
// Wenn wir einen BlocListener verwenden wollen, hört dieser auf bestimmte States,
// die wir als "Action-States" bezeichnen können. Wenn wir nur immer den einen CounterState
// triggern, können wir dem Listener nicht sagen, was genau gerade abgeht und was er also tun soll.
// Daher müssen wir den State auf mehrere States aufteilen, die davon abhängen, welche Aktion
// gerade durchgeführt wurde.
// Da der counterValue required ist, bekommen die beiden States jeweils einen Wert
// übergeben, der dann als der required counterValue gesetzt wird.
class CounterIncrementState extends CounterState {
  CounterIncrementState(int increasedValue)
      : super(counterValue: increasedValue);
}

class CounterDecrementState extends CounterState {
  CounterDecrementState(int decreasedValue)
      : super(counterValue: decreasedValue);
}
