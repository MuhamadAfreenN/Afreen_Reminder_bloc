part of 'delete_reminder_bloc.dart';

abstract class DeleteReminderEvent extends Equatable {
  final String id;
  const DeleteReminderEvent(this.id);
}
