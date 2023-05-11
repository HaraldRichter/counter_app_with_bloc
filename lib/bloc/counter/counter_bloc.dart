import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../bloc_imports.dart';

part 'counter_state.dart';
part 'counter_event.dart';

/// Hier konvertieren wir die Events zu States, d.h. wir sagen dem Bloc, was er tun soll.

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    /// Mit nur einem State:
    // Das Event schaut sich den vorherigen State an, erhöht bzw. senkt den
    // CounterValue um 1 und emittet dies dann als neuen State:
    // on<CounterEvent>((event, emit) {
    //   emit(CounterState(counterValue: state.counterValue + 1));
    // });

    /// Mit mehreren States:
    on<CounterIncrementEvent>((event, emit) {
      emit(CounterIncrementState(state.counterValue + 1));
    });
    on<CounterDecrementEvent>((event, emit) {
      emit(CounterDecrementState(state.counterValue - 1));
    });
  }
}

/// Mit Hydrated Bloc:
// class CounterBloc extends HydratedBloc<CounterEvent, CounterState> {
//   CounterBloc() : super(CounterInitial()) {
//     on<CounterIncrementEvent>((event, emit) {
//       emit(CounterIncrementState(state.counterValue + 1));
//     });
//     on<CounterDecrementEvent>((event, emit) {
//       emit(CounterDecrementState(state.counterValue - 1));
//     });
//   }
//
//   @override
//   CounterState? fromJson(Map<String, dynamic> json) {
//     return CounterState.fromMap(json);
//   }
//
//   @override
//   Map<String, dynamic>? toJson(CounterState state) {
//     return state.toMap();
//   }
// }
