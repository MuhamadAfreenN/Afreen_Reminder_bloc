import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/delete_reminder.dart';

part 'delete_reminder_event.dart';
part 'delete_reminder_state.dart';

class DeleteReminderBloc extends Bloc<DeleteReminderEvent, DeleteReminderState> {
  final DeleteReminderService _deleteReminderService;


  DeleteReminderBloc(this._deleteReminderService,) : super(DeleteReminderInitial()) {
    on<DeleteReminderEvent>((event, emit)  async{
      // TODO: implement event handler
       final reminder = await _deleteReminderService.deleteReminder(event.id);
    });
  }
}
