import 'package:bloc_8_reminder_app/bloc/reminder_bloc.dart';
import 'package:bloc_8_reminder_app/model/reminder.dart';
import 'package:bloc_8_reminder_app/view/add_reminder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/model/delete_reminder.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({Key? key}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReminderBloc(
        RepositoryProvider.of<ReminderService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Reminders',
          style: TextStyle(
            color: Colors.black54,fontSize: 25,fontWeight: FontWeight.w600
          ),),
actions: [

  GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> AddReminder()));
    },
      child: Icon(Icons.add,color: Colors.black,)),
  SizedBox(width: 30,)
],
        ),
        body:
        Padding(
              padding: const EdgeInsets.all(16.0),
              child: BlocBuilder<ReminderBloc,ReminderState>(
                builder: (context,state){
                  if(state is ReminderLoadingState){
                    return Center(child: CircularProgressIndicator(),);
                  }
                  if(state is ReminderLoadedState){
                    return ListView.builder(
                      itemCount: state.data!.length,
                        itemBuilder: (context,index){
                      return SizedBox(
                        height: 70,
                          child: Card(child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(state.data![index].alertText,
                                    style: TextStyle(color: Colors.blueAccent,
                                    fontSize: 20,fontWeight: FontWeight.bold),),
                                    SizedBox(height: 10,),
                                    Text('${state.data![index].reminderTime} PM')
                                  ],
                                ),
                                GestureDetector
                                  (onTap: (){
                                  DeleteReminderService().deleteReminder(state.data![index].id.toString()).then((value) => {
                                    ReminderService().getReminder()
                                  });

                                },
                                    child: Icon(Icons.delete,color: Colors.red,))
                              ],
                            ),
                          )));
                    });
                  }
                  return Container();
                },
              ),
            ))
        );
  }
}
