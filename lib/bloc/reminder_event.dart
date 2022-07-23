part of 'reminder_bloc.dart';

abstract class ReminderEvent extends Equatable {
  const ReminderEvent();
}

class LoadApiEvent extends ReminderEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
