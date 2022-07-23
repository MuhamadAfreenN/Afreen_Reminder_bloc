// To parse this JSON data, do
//
//     final deleteReminder = deleteReminderFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart';

DeleteReminder deleteReminderFromJson(String str) => DeleteReminder.fromJson(json.decode(str));

String deleteReminderToJson(DeleteReminder data) => json.encode(data.toJson());

class DeleteReminder {
  DeleteReminder({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<dynamic> data;

  factory DeleteReminder.fromJson(Map<String, dynamic> json) => DeleteReminder(
    status: json["status"],
    message: json["message"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}

class DeleteReminderService{
  final url = "https://dev.boq.wireandswitch.com/api/delete_reminder";
  String token = "50|KUxjo3j04ypKtHT9iTriBNsfrhva0srwD1x6OGDJ";


  Future<DeleteReminder> deleteReminder(String id) async{
    final response = await post(Uri.parse(url), headers: {'accept':'application/json',
      'Authorization':'Bearer $token'},body: {
      "id":id
    });
    print(response.body);
    final deleteReminder = deleteReminderFromJson(response.body);
    print(deleteReminder);
    return deleteReminder;
  }

}

