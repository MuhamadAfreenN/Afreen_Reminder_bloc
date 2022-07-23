// To parse this JSON data, do
//
//     final reminder = reminderFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

Reminder reminderFromJson(String str) => Reminder.fromJson(json.decode(str));

String reminderToJson(Reminder data) => json.encode(data.toJson());

class Reminder {
  Reminder({
     this.status,
     this.message,
     this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.alertText,
    required this.reminderDate,
    required this.reminderTime,
  });

  int id;
  String alertText;
  DateTime reminderDate;
  String reminderTime;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    alertText: json["alert_text"],
    reminderDate: DateTime.parse(json["reminder_date"]),
    reminderTime: json["reminder_time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "alert_text": alertText,
    "reminder_date": "${reminderDate.year.toString().padLeft(4, '0')}-${reminderDate.month.toString().padLeft(2, '0')}-${reminderDate.day.toString().padLeft(2, '0')}",
    "reminder_time": reminderTime,
  };


}


class ReminderService{
  final url = "https://dev.boq.wireandswitch.com/api/list_reminder?page_no=0";
  String token = "50|KUxjo3j04ypKtHT9iTriBNsfrhva0srwD1x6OGDJ";


  Future<Reminder> getReminder() async{
    final response = await post(Uri.parse(url), headers: {'accept':'application/json',
      'Authorization':'Bearer $token'});
    print(response.body);
    final reminder = reminderFromJson(response.body);
    print(reminder);
    return reminder;
  }

}


