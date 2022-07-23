part of 'reminder_bloc.dart';

abstract class ReminderState extends Equatable {
  const ReminderState();
}

class ReminderLoadingState extends ReminderState {
  @override
  List<Object> get props => [];
}

class ReminderLoadedState extends ReminderState{

  final bool? status;
  final String? message;
  final List<Datum>? data;

  ReminderLoadedState(this.status, this.message, this.data);



  @override
  // TODO: implement props
  List<Object?> get props => [status,message,data];

}

