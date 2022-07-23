import 'package:bloc_8_reminder_app/view/reminder_screen.dart';
import 'package:flutter/material.dart';

class AddReminder extends StatelessWidget {
  const AddReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: Text('Add Reminder',
        style: TextStyle(color: Colors.black54,
        fontWeight: FontWeight.w600,fontSize: 25),)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: 'Set Reminder',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: 300,
                child: TextField(
                  textAlign: TextAlign.center,

                  decoration: InputDecoration(

                      hintText: 'Set Time',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
              ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.cyan)),
                  onPressed:(){
                Navigator.pop(context);
              }, child: Text('Submit'))

            ],
          ),
        ),
      ),
    );
  }
}
