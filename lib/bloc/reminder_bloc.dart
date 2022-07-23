import 'package:bloc_8_reminder_app/model/list_reminder.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reminder_event.dart';
part 'reminder_state.dart';

class ReminderBloc extends Bloc<ReminderEvent, ReminderState> {

  final ReminderService _reminderService;

  ReminderBloc(this._reminderService) : super(ReminderLoadingState())  {
    on<LoadApiEvent>((event,emit) async {
      final reminder = await _reminderService.getReminder();
      emit(ReminderLoadedState(reminder.status, reminder.message, reminder.data));

    });

  }
}

